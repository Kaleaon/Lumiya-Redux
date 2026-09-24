import com.github.javaparser.JavaParser;
import com.github.javaparser.ParseResult;
import com.github.javaparser.ParserConfiguration;
import com.github.javaparser.ast.CompilationUnit;
import com.github.javaparser.ast.Modifier;
import com.github.javaparser.ast.Node;
import com.github.javaparser.ast.NodeList;
import com.github.javaparser.ast.body.ClassOrInterfaceDeclaration;
import com.github.javaparser.ast.body.ConstructorDeclaration;
import com.github.javaparser.ast.body.Parameter;
import com.github.javaparser.ast.expr.Expression;
import com.github.javaparser.ast.expr.NameExpr;
import com.github.javaparser.ast.expr.ObjectCreationExpr;
import com.github.javaparser.ast.expr.ThisExpr;
import com.github.javaparser.ast.stmt.ExplicitConstructorInvocationStmt;
import com.github.javaparser.printer.lexicalpreservation.LexicalPreservingPrinter;

import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * Undo a jadx artefact: for an inner (non-static) class, jadx prints the
 * implicit outer-instance parameter of its constructors as a real first
 * parameter (`Inner(Outer outer, int x)`), so javac adds a second hidden one
 * and the constructor no longer matches the original. This removes that
 * parameter, rewrites its uses to `Outer.this`, and drops the matching first
 * argument from `new Inner(...)` and `this(...)` calls in the same file.
 *
 * Usage: java -cp javaparser-core.jar:. FixOuterParam FILE...
 */
public class FixOuterParam {
    public static void main(String[] args) throws Exception {
        JavaParser parser = new JavaParser(new ParserConfiguration().setLanguageLevel(ParserConfiguration.LanguageLevel.JAVA_8));
        for (String arg : args) {
            Path p = Paths.get(arg);
            ParseResult<CompilationUnit> r = parser.parse(new String(Files.readAllBytes(p), StandardCharsets.UTF_8));
            if (!r.getResult().isPresent()) continue;
            CompilationUnit cu = r.getResult().get();
            LexicalPreservingPrinter.setup(cu);
            int n = fix(cu) + fixSynthetic(cu);
            if (n > 0) {
                Files.write(p, LexicalPreservingPrinter.print(cu).getBytes(StandardCharsets.UTF_8));
                System.err.println(arg + ": " + n + " constructors");
            }
        }
    }

    /**
     * jadx prints the compiler-generated accessor constructor of a private
     * nested constructor: {@code /* synthetic *&#47; Inner(Outer o, Inner marker) { this(); }}.
     * Remove it and call the real constructor directly; javac regenerates the
     * accessor. Call sites are rewritten through the this(...) delegation.
     */
    static int fixSynthetic(CompilationUnit cu) {
        int changed = 0;
        for (ClassOrInterfaceDeclaration inner : cu.findAll(ClassOrInterfaceDeclaration.class)) {
            for (ConstructorDeclaration c : new ArrayList<>(inner.getConstructors())) {
                boolean synthetic = c.getComment().map(cm -> cm.getContent().trim().equals("synthetic")).orElse(false)
                        || c.getAllContainedComments().stream().anyMatch(cm -> cm.getContent().trim().equals("synthetic"));
                if (!synthetic || c.getBody().getStatements().size() != 1
                        || !(c.getBody().getStatement(0) instanceof ExplicitConstructorInvocationStmt)) continue;
                ExplicitConstructorInvocationStmt delegate = (ExplicitConstructorInvocationStmt) c.getBody().getStatement(0);
                if (!delegate.isThis()) continue;
                List<String> params = new ArrayList<>();
                c.getParameters().forEach(pp -> params.add(pp.getNameAsString()));
                int arity = params.size();
                List<Expression> mapping = new ArrayList<>(delegate.getArguments());
                boolean simple = mapping.stream().allMatch(e -> e.isNameExpr() && params.contains(e.asNameExpr().getNameAsString()));
                if (!simple) continue;
                String name = inner.getNameAsString();
                for (ObjectCreationExpr oc : cu.findAll(ObjectCreationExpr.class)) {
                    if (!oc.getType().getNameAsString().equals(name) || oc.getArguments().size() != arity
                            || oc.getAnonymousClassBody().isPresent()) continue;
                    NodeList<Expression> old = oc.getArguments();
                    NodeList<Expression> args = new NodeList<>();
                    for (Expression m : mapping) {
                        args.add(old.get(params.indexOf(m.asNameExpr().getNameAsString())).clone());
                    }
                    oc.setArguments(args);
                }
                c.remove();
                changed++;
            }
        }
        return changed;
    }

    static int fix(CompilationUnit cu) {
        int changed = 0;
        // inner class name -> set of original constructor arities that were changed
        Map<String, Set<Integer>> arities = new HashMap<>();
        for (ClassOrInterfaceDeclaration inner : cu.findAll(ClassOrInterfaceDeclaration.class)) {
            if (inner.isInterface() || inner.isStatic() || !inner.isNestedType()) continue;
            Node parent = inner.getParentNode().orElse(null);
            if (!(parent instanceof ClassOrInterfaceDeclaration)) continue;
            ClassOrInterfaceDeclaration outer = (ClassOrInterfaceDeclaration) parent;
            if (outer.isInterface()) continue;
            String outerName = outer.getNameAsString();
            List<ConstructorDeclaration> ctors = inner.getConstructors();
            if (ctors.isEmpty()) continue;
            boolean all = true;
            for (ConstructorDeclaration c : ctors) {
                if (c.getParameters().isEmpty() || !c.getParameter(0).getType().asString().equals(outerName)) all = false;
            }
            if (!all) continue;
            for (ConstructorDeclaration c : ctors) {
                Parameter first = c.getParameter(0);
                String pname = first.getNameAsString();
                arities.computeIfAbsent(inner.getNameAsString(), k -> new HashSet<>()).add(c.getParameters().size());
                for (NameExpr ne : new ArrayList<>(c.getBody().findAll(NameExpr.class))) {
                    if (ne.getNameAsString().equals(pname)) {
                        ne.replace(new ThisExpr(new com.github.javaparser.ast.expr.Name(outerName)));
                    }
                }
                for (ExplicitConstructorInvocationStmt call : c.getBody().findAll(ExplicitConstructorInvocationStmt.class)) {
                    if (call.isThis() && !call.getArguments().isEmpty()) call.getArguments().remove(0);
                }
                first.remove();
                changed++;
            }
        }
        if (changed == 0) return 0;
        for (ObjectCreationExpr oc : cu.findAll(ObjectCreationExpr.class)) {
            Set<Integer> a = arities.get(oc.getType().getNameAsString());
            if (a == null || oc.getScope().isPresent() || oc.getAnonymousClassBody().isPresent()) continue;
            if (a.contains(oc.getArguments().size())) {
                Expression firstArg = oc.getArgument(0);
                oc.getArguments().remove(firstArg);
            }
        }
        return changed;
    }
}
