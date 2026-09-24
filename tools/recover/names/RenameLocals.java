import com.github.javaparser.JavaParser;
import com.github.javaparser.ParseResult;
import com.github.javaparser.ParserConfiguration;
import com.github.javaparser.ast.CompilationUnit;
import com.github.javaparser.ast.Node;
import com.github.javaparser.ast.body.CallableDeclaration;
import com.github.javaparser.ast.body.FieldDeclaration;
import com.github.javaparser.ast.body.Parameter;
import com.github.javaparser.ast.body.VariableDeclarator;
import com.github.javaparser.ast.expr.AssignExpr;
import com.github.javaparser.ast.expr.CastExpr;
import com.github.javaparser.ast.expr.Expression;
import com.github.javaparser.ast.expr.FieldAccessExpr;
import com.github.javaparser.ast.expr.LambdaExpr;
import com.github.javaparser.ast.expr.MethodCallExpr;
import com.github.javaparser.ast.expr.NameExpr;
import com.github.javaparser.ast.expr.ObjectCreationExpr;
import com.github.javaparser.ast.expr.SimpleName;
import com.github.javaparser.ast.expr.VariableDeclarationExpr;
import com.github.javaparser.ast.stmt.CatchClause;
import com.github.javaparser.ast.stmt.ForEachStmt;
import com.github.javaparser.ast.stmt.ForStmt;
import com.github.javaparser.ast.type.ArrayType;
import com.github.javaparser.ast.type.ClassOrInterfaceType;
import com.github.javaparser.ast.type.PrimitiveType;
import com.github.javaparser.ast.type.Type;
import com.github.javaparser.printer.lexicalpreservation.LexicalPreservingPrinter;

import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

/**
 * Rename decompiler-generated local variables and parameters to names that say
 * what they hold.
 *
 * The 3.4.2 APK kept parameter names in its debug info but not local ones, so
 * jadx invented them from types (i2, z, str3, sLAgentCircuit, iIndexOf). This
 * tool renames only names that match those generated patterns, choosing from:
 *   1. what initialises the variable: getter / factory call, `new`, cast,
 *      field read, for-each source;
 *   2. otherwise its declared type (SL/LL prefixes dropped: SLAgentCircuit ->
 *      agentCircuit);
 *   3. int loop counters become i, j, k.
 *
 * Scoping is handled conservatively: a name is renamed only when it is
 * declared exactly once in the outermost method or constructor (including
 * lambdas and anonymous classes inside it), and the new name appears nowhere
 * else in the file. Local names are not part of the compiled code, so the
 * build must be byte-identical afterwards (tools/verify/smali_identical.py);
 * any file where that fails is reverted.
 *
 * Usage: java -cp javaparser-core.jar:. RenameLocals FILE...
 */
public class RenameLocals {
    static final Pattern GENERATED = Pattern.compile(
            "^(i|z|j|f|d|b|c|s|l|str|obj|e)\\d*$"                  // i2, z, str3
            + "|^(objArr|iArr|bArr|fArr|strArr|jArr|zArr|dArr|sArr|cArr)\\d*$"
            + "|^(i|z|j|f|d|b|str|obj|l)[A-Z]\\w*$"                  // iIndexOf, strTrim, zIsEmpty
            + "|^[a-z][A-Z]{1,3}[A-Z]?[a-z]\\w*\\d*$"                // sLAgentCircuit, lLVector3
            + "|^[a-z]\\w*[a-z]\\d+$");                              // next2, message3
    static final Set<String> KEYWORDS = new HashSet<>(Arrays.asList(
            "abstract", "assert", "boolean", "break", "byte", "case", "catch", "char", "class", "const",
            "continue", "default", "do", "double", "else", "enum", "extends", "final", "finally", "float",
            "for", "goto", "if", "implements", "import", "instanceof", "int", "interface", "long", "native",
            "new", "package", "private", "protected", "public", "return", "short", "static", "strictfp",
            "super", "switch", "synchronized", "this", "throw", "throws", "transient", "try", "void",
            "volatile", "while", "true", "false", "null", "var", "record", "yield", "object", "string",
            "clazz", "result"));
    static final String[] COUNTERS = {"i", "j", "k", "m", "n"};

    public static void main(String[] args) throws Exception {
        ParserConfiguration cfg = new ParserConfiguration()
                .setLanguageLevel(ParserConfiguration.LanguageLevel.JAVA_8);
        JavaParser parser = new JavaParser(cfg);
        int files = 0, renamed = 0, skipped = 0;
        for (String arg : args) {
            Path p = Paths.get(arg);
            String src = new String(Files.readAllBytes(p), StandardCharsets.UTF_8);
            ParseResult<CompilationUnit> r = parser.parse(src);
            if (!r.isSuccessful() || !r.getResult().isPresent()) {
                skipped++;
                continue;
            }
            CompilationUnit cu = r.getResult().get();
            try {
                LexicalPreservingPrinter.setup(cu);
                int n = renameFile(cu);
                if (n > 0) {
                    String out = LexicalPreservingPrinter.print(cu);
                    Files.write(p, out.getBytes(StandardCharsets.UTF_8));
                    renamed += n;
                    files++;
                }
            } catch (RuntimeException ex) {
                skipped++;
                System.err.println("skip " + arg + ": " + ex);
            }
        }
        System.err.println("RenameLocals: " + renamed + " names in " + files + " files, " + skipped + " files skipped");
    }

    static int renameFile(CompilationUnit cu) {
        // Every identifier already used in the file is off limits for a new name.
        // Names a new local could capture or clash with: every unqualified
        // name used in the file (fields, inherited fields, statics, other
        // locals) and every declared variable. Member names after a dot and
        // method names cannot collide with a local.
        Set<String> taken = new HashSet<>();
        cu.findAll(NameExpr.class).forEach(n -> taken.add(n.getNameAsString()));
        cu.findAll(VariableDeclarator.class).forEach(v -> taken.add(v.getNameAsString()));
        cu.findAll(Parameter.class).forEach(v -> taken.add(v.getNameAsString()));
        cu.findAll(com.github.javaparser.ast.body.TypeDeclaration.class).forEach(t -> taken.add(t.getNameAsString()));
        Set<String> fields = new HashSet<>();
        cu.findAll(FieldDeclaration.class).forEach(f -> f.getVariables().forEach(v -> fields.add(v.getNameAsString())));
        int total = 0;
        for (CallableDeclaration<?> callable : cu.findAll(CallableDeclaration.class)) {
            if (callable.findAncestor(CallableDeclaration.class).isPresent()) {
                continue; // handled as part of the outermost callable
            }
            total += renameCallable(callable, taken, fields);
        }
        return total;
    }

    static int renameCallable(CallableDeclaration<?> callable, Set<String> taken, Set<String> fields) {
        // Declarations in the whole subtree (lambdas and anonymous classes included).
        Map<String, List<Node>> decls = new LinkedHashMap<>();
        for (VariableDeclarator v : callable.findAll(VariableDeclarator.class)) {
            if (v.getParentNode().orElse(null) instanceof FieldDeclaration) continue;
            decls.computeIfAbsent(v.getNameAsString(), k -> new ArrayList<>()).add(v);
        }
        for (Parameter prm : callable.findAll(Parameter.class)) {
            decls.computeIfAbsent(prm.getNameAsString(), k -> new ArrayList<>()).add(prm);
        }
        Map<String, String> plan = new LinkedHashMap<>();
        Set<String> chosen = new HashSet<>();
        for (Map.Entry<String, List<Node>> e : decls.entrySet()) {
            String old = e.getKey();
            if (e.getValue().size() != 1 || fields.contains(old)) continue;
            Node decl = e.getValue().get(0);
            if (!GENERATED.matcher(old).matches() && !typePlusCall(decl, old)) continue;
            if (decl instanceof Parameter && decl.getParentNode().orElse(null) instanceof LambdaExpr) continue;
            String base = suggest(decl, callable, old);
            if (base == null || base.equals(old)) continue;
            String name = null;
            if (base.equals("i")) {
                for (String c : COUNTERS) {
                    if (!taken.contains(c) && !chosen.contains(c) && !decls.containsKey(c)) { name = c; break; }
                }
            } else {
                name = unique(base, taken, chosen, decls.keySet());
            }
            if (name == null) continue;
            plan.put(old, name);
            chosen.add(name);
        }
        if (plan.isEmpty()) return 0;
        for (SimpleName sn : callable.findAll(SimpleName.class)) {
            String to = plan.get(sn.getIdentifier());
            if (to == null) continue;
            Node parent = sn.getParentNode().orElse(null);
            // Only variable uses and declarations; never members of other objects.
            if (parent instanceof NameExpr || parent instanceof VariableDeclarator || parent instanceof Parameter) {
                if (parent instanceof VariableDeclarator
                        && parent.getParentNode().orElse(null) instanceof FieldDeclaration) continue;
                sn.setIdentifier(to);
            }
        }
        taken.addAll(plan.values());
        return plan.size();
    }

    /** jadx 1.5 names a local after its type plus the call that produced it
     *  (responseExecute, xmlPullParserNewPullParser, sLMessageUnpack). */
    static boolean typePlusCall(Node decl, String old) {
        Type type = decl instanceof VariableDeclarator ? ((VariableDeclarator) decl).getType() : ((Parameter) decl).getType();
        if (!type.isClassOrInterfaceType()) return false;
        String t = type.asClassOrInterfaceType().getNameAsString();
        String d = Character.toLowerCase(t.charAt(0)) + t.substring(1);
        return old.length() > d.length() && old.startsWith(d) && Character.isUpperCase(old.charAt(d.length()));
    }

    static String unique(String base, Set<String> taken, Set<String> chosen, Set<String> localNames) {
        if (!base.matches("[a-z][A-Za-z0-9]*") || KEYWORDS.contains(base)) return null;
        for (int i = 1; i < 10; i++) {
            String n = i == 1 ? base : base + i;
            if (!taken.contains(n) && !chosen.contains(n) && !localNames.contains(n)) return n;
        }
        return null;
    }

    static String suggest(Node decl, CallableDeclaration<?> callable, String old) {
        Type type = decl instanceof VariableDeclarator ? ((VariableDeclarator) decl).getType() : ((Parameter) decl).getType();
        Node parent = decl.getParentNode().orElse(null);
        // int loop counters -> i, j, k
        if (decl instanceof VariableDeclarator && parent instanceof VariableDeclarationExpr
                && parent.getParentNode().orElse(null) instanceof ForStmt
                && type.isPrimitiveType() && old.matches("i\\d*")) {
            return "i"; // unique() turns a clash into the next free counter below
        }
        if (decl instanceof Parameter && parent instanceof CatchClause) {
            return old.matches("e\\d*") ? null : "e";
        }
        Expression init = null;
        if (decl instanceof VariableDeclarator) {
            init = ((VariableDeclarator) decl).getInitializer().orElse(null);
            if (init == null) {
                String name = ((VariableDeclarator) decl).getNameAsString();
                for (AssignExpr a : callable.findAll(AssignExpr.class)) {
                    if (a.getTarget().isNameExpr() && a.getTarget().asNameExpr().getNameAsString().equals(name)) {
                        init = a.getValue();
                        break;
                    }
                }
            }
            if (parent instanceof VariableDeclarationExpr && parent.getParentNode().orElse(null) instanceof ForEachStmt) {
                String fromIterable = singular(nameOf(((ForEachStmt) parent.getParentNode().get()).getIterable()));
                String fromElement = fromType(type);
                if (fromElement != null) return fromElement;
                if (fromIterable != null) return fromIterable;
            }
        }
        String fromInit = init == null ? null : nameOf(init);
        if (fromInit != null) return fromInit;
        // jadx "type prefix + call" names: iIndexOf -> index, strTrim -> trim
        java.util.regex.Matcher m = Pattern.compile("^(?:i|z|j|f|d|b|str|obj|l)([A-Z]\\w*)$").matcher(old);
        if (m.matches()) {
            String n = fromMethodName(decap(m.group(1).replaceAll("\\d+$", "")));
            if (n != null) return n;
        }
        return fromType(type);
    }

    /** A name for the value an expression produces. */
    static String nameOf(Expression e) {
        if (e == null) return null;
        if (e.isEnclosedExpr()) return nameOf(e.asEnclosedExpr().getInner());
        if (e instanceof CastExpr) {
            String n = nameOf(((CastExpr) e).getExpression());
            return n != null ? n : fromType(((CastExpr) e).getType());
        }
        if (e instanceof MethodCallExpr) {
            return fromMethodName(((MethodCallExpr) e).getNameAsString());
        }
        if (e instanceof ObjectCreationExpr) {
            return fromType(((ObjectCreationExpr) e).getType());
        }
        if (e instanceof FieldAccessExpr) {
            String n = ((FieldAccessExpr) e).getNameAsString();
            if (n.matches("[A-Z0-9_]+")) return null; // constants
            return n.endsWith("_Field") ? decap(n.substring(0, n.length() - 6)) : n.replaceAll("_Fields$", "s");
        }
        if (e.isNameExpr()) {
            String n = e.asNameExpr().getNameAsString();
            return GENERATED.matcher(n).matches() ? null : n;
        }
        return null;
    }

    static final Pattern NOUN_PREFIX = Pattern.compile(
            "^(get|find|load|fetch|create|make|build|new|parse|unpack|compute|calc|calculate|obtain|lookup|resolve|read|decode|extract|query|acquire)([A-Z]\\w*)$");

    static String fromMethodName(String m) {
        if (m == null) return null;
        java.util.regex.Matcher x = NOUN_PREFIX.matcher(m);
        if (x.matches()) {
            String rest = x.group(2);
            if (rest.matches("(Int|Long|Float|Double|Byte|Short|Boolean|Char|String|Object|Instance|Value|Data|Item|Bytes|U8|U16|U32|S8|S16|S32|F32|F64)s?")) {
                return null; // says nothing about what the value is
            }
            return decap(stripPrefix(rest));
        }
        if (m.matches("(is|has|can|should|was|contains)[A-Z]\\w*")) return m;
        switch (m) {
            case "indexOf": case "lastIndexOf": return "index";
            case "size": return "size";
            case "length": return "length";
            case "toString": return "text";
            case "trim": return "trimmed";
            case "substring": return "part";
            case "toLowerCase": return "lower";
            case "toUpperCase": return "upper";
            case "iterator": return "iterator";
            case "keySet": return "keys";
            case "values": return "values";
            case "entrySet": return "entries";
            case "currentTimeMillis": case "elapsedRealtime": case "uptimeMillis": return "nowMillis";
            case "nanoTime": return "nowNanos";
            case "remove": case "poll": case "take": case "pop": return "removed";
            case "next": case "valueOf": case "equals": case "hashCode": case "apply": case "call":
            case "get": case "run": case "clone": case "format": case "intValue": case "longValue":
            case "floatValue": case "doubleValue": case "ordinal": return null;
            default:
                return m.matches("[a-z][a-z]+[A-Z]\\w*") && !m.startsWith("set") && !m.startsWith("on")
                        && !m.startsWith("to") && !m.startsWith("add") && !m.startsWith("put")
                        && !m.startsWith("remove") && !m.startsWith("update") && !m.startsWith("handle")
                        && !m.startsWith("send") && !m.startsWith("process") ? m : null;
        }
    }

    static String fromType(Type t) {
        if (t instanceof ArrayType) {
            Type c = ((ArrayType) t).getComponentType();
            if (c instanceof PrimitiveType) {
                switch (((PrimitiveType) c).getType()) {
                    case BYTE: return "bytes";
                    case FLOAT: return "floats";
                    case INT: return "ints";
                    case LONG: return "longs";
                    case CHAR: return "chars";
                    default: return null;
                }
            }
            String n = fromType(c);
            return n == null ? null : plural(n);
        }
        if (t instanceof ClassOrInterfaceType) {
            ClassOrInterfaceType ct = (ClassOrInterfaceType) t;
            String simple = ct.getNameAsString();
            if (simple.equals("String")) return null;
            if (simple.equals("Object")) return null;
            if (ct.getTypeArguments().isPresent() && !ct.getTypeArguments().get().isEmpty()
                    && simple.matches("List|Set|Collection|Iterable|ArrayList|LinkedList|HashSet|Queue|Deque|ImmutableList|ImmutableSet")) {
                String el = fromType(ct.getTypeArguments().get().get(0));
                return el == null ? null : plural(el);
            }
            if (simple.matches("Integer|Long|Float|Double|Boolean|Byte|Short|Character|Void")) return null;
            return decap(stripPrefix(simple));
        }
        return null;
    }

    static String stripPrefix(String s) {
        // SLAgentCircuit -> AgentCircuit, LLVector3 -> Vector3; keep UUID, SLURL as acronyms.
        if (s.matches("(SL|LL)[A-Z][a-z]\\w*")) return s.substring(2);
        return s;
    }

    static String decap(String s) {
        if (s == null || s.isEmpty()) return null;
        int i = 0;
        while (i < s.length() && Character.isUpperCase(s.charAt(i))) i++;
        if (i == 0) return s;
        if (i == s.length()) return s.toLowerCase();             // UUID -> uuid
        if (i == 1) return Character.toLowerCase(s.charAt(0)) + s.substring(1);
        // LLSDNode -> llsdNode, HTTPRequest -> httpRequest
        return s.substring(0, i - 1).toLowerCase() + s.substring(i - 1);
    }

    static String plural(String n) {
        if (n.endsWith("s")) return n + "List";
        if (n.endsWith("y") && !n.matches(".*[aeiou]y")) return n.substring(0, n.length() - 1) + "ies";
        return n + "s";
    }

    static String singular(String n) {
        if (n == null) return null;
        if (n.endsWith("ies")) return n.substring(0, n.length() - 3) + "y";
        if (n.endsWith("List")) return n.substring(0, n.length() - 4);
        if (n.endsWith("s") && n.length() > 3 && !n.endsWith("ss")) return n.substring(0, n.length() - 1);
        return null;
    }
}
