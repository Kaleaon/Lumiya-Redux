import com.github.javaparser.JavaParser;
import com.github.javaparser.ParseResult;
import com.github.javaparser.ParserConfiguration;
import com.github.javaparser.ast.CompilationUnit;
import com.github.javaparser.ast.Node;
import com.github.javaparser.ast.NodeList;
import com.github.javaparser.ast.body.FieldDeclaration;
import com.github.javaparser.ast.body.MethodDeclaration;
import com.github.javaparser.ast.expr.ArrayAccessExpr;
import com.github.javaparser.ast.expr.AssignExpr;
import com.github.javaparser.ast.expr.Expression;
import com.github.javaparser.ast.expr.FieldAccessExpr;
import com.github.javaparser.ast.expr.IntegerLiteralExpr;
import com.github.javaparser.ast.expr.MethodCallExpr;
import com.github.javaparser.ast.expr.NameExpr;
import com.github.javaparser.ast.stmt.SwitchEntry;
import com.github.javaparser.ast.stmt.SwitchStmt;
import com.github.javaparser.printer.lexicalpreservation.LexicalPreservingPrinter;

import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Undo a decompiler artefact: an enum {@code switch} compiled by dx/Jack
 * reads a synthetic ordinal table ({@code -getFooSwitchesValues()}), and jadx
 * prints that helper and switches on the table entry with integer labels:
 *
 * <pre>
 *   switch (m199x6cbd47ba()[key.ordinal()]) { case 1: ... case 2: ... }
 * </pre>
 *
 * This reads the helper's {@code table[Foo.X.ordinal()] = N} assignments and
 * rewrites every such switch in the file to {@code switch (key) { case X: ... }},
 * then removes the helper method and its cache field. javac generates its own
 * table; the verifier ignores switch-map helpers on both sides (SWITCHMAP).
 *
 * A file is left untouched if any use of a helper remains that is not the
 * selector of a switch whose labels all resolve.
 *
 * Usage: java -cp javaparser-core.jar:. FixSwitchMaps FILE...
 */
public class FixSwitchMaps {
    public static void main(String[] args) throws Exception {
        JavaParser parser = new JavaParser(new ParserConfiguration().setLanguageLevel(ParserConfiguration.LanguageLevel.JAVA_8));
        for (String arg : args) {
            Path p = Paths.get(arg);
            ParseResult<CompilationUnit> r = parser.parse(new String(Files.readAllBytes(p), StandardCharsets.UTF_8));
            if (!r.getResult().isPresent()) continue;
            CompilationUnit cu = r.getResult().get();
            LexicalPreservingPrinter.setup(cu);
            int n = fix(cu);
            if (n > 0) {
                Files.write(p, LexicalPreservingPrinter.print(cu).getBytes(StandardCharsets.UTF_8));
                System.err.println(arg + ": " + n + " switches + helpers");
            } else if (n < 0) {
                System.err.println(arg + ": SKIPPED (unresolved helper use)");
            }
        }
    }

    static boolean isHelper(MethodDeclaration m) {
        String comment = m.getComment().map(c -> c.getContent()).orElse("");
        return m.getParameters().isEmpty() && m.getType().asString().equals("int[]")
                && (comment.contains("SwitchesValues") || m.getNameAsString().endsWith("SwitchesValues"));
    }

    static int fix(CompilationUnit cu) {
        // helper name -> (label -> enum constant), plus the cache field it fills
        Map<String, Map<Integer, String>> tables = new HashMap<>();
        Map<String, MethodDeclaration> helpers = new HashMap<>();
        Map<String, String> cacheField = new HashMap<>();
        for (MethodDeclaration m : cu.findAll(MethodDeclaration.class)) {
            if (!isHelper(m)) continue;
            Map<Integer, String> t = new HashMap<>();
            for (AssignExpr a : m.findAll(AssignExpr.class)) {
                if (a.getTarget().isArrayAccessExpr() && a.getValue().isIntegerLiteralExpr()) {
                    Expression idx = a.getTarget().asArrayAccessExpr().getIndex();
                    if (idx.isMethodCallExpr() && idx.asMethodCallExpr().getNameAsString().equals("ordinal")
                            && idx.asMethodCallExpr().getScope().map(Expression::isFieldAccessExpr).orElse(false)) {
                        FieldAccessExpr c = idx.asMethodCallExpr().getScope().get().asFieldAccessExpr();
                        t.put(a.getValue().asIntegerLiteralExpr().asNumber().intValue(), c.getNameAsString());
                    }
                } else if (a.getTarget().isNameExpr() && a.getValue().isNameExpr()) {
                    cacheField.put(m.getNameAsString(), a.getTarget().asNameExpr().getNameAsString());
                } else if (a.getTarget().isFieldAccessExpr() && a.getValue().isNameExpr()) {
                    cacheField.put(m.getNameAsString(), a.getTarget().asFieldAccessExpr().getNameAsString());
                }
            }
            tables.put(m.getNameAsString(), t);
            helpers.put(m.getNameAsString(), m);
        }
        if (tables.isEmpty()) return 0;

        List<Runnable> edits = new ArrayList<>();
        int switches = 0;
        for (SwitchStmt s : cu.findAll(SwitchStmt.class)) {
            Expression sel = s.getSelector();
            if (!sel.isArrayAccessExpr()) continue;
            ArrayAccessExpr aa = sel.asArrayAccessExpr();
            if (!aa.getName().isMethodCallExpr()) continue;
            String helper = aa.getName().asMethodCallExpr().getNameAsString();
            Map<Integer, String> t = tables.get(helper);
            if (t == null) continue;
            if (!aa.getIndex().isMethodCallExpr() || !aa.getIndex().asMethodCallExpr().getNameAsString().equals("ordinal")
                    || !aa.getIndex().asMethodCallExpr().getScope().isPresent()) return -1;
            Expression value = aa.getIndex().asMethodCallExpr().getScope().get();
            for (SwitchEntry e : s.getEntries()) {
                for (Expression l : e.getLabels()) {
                    if (!l.isIntegerLiteralExpr() || !t.containsKey(l.asIntegerLiteralExpr().asNumber().intValue())) return -1;
                }
            }
            switches++;
            edits.add(() -> {
                s.setSelector(value.clone());
                for (SwitchEntry e : s.getEntries()) {
                    NodeList<Expression> labels = new NodeList<>();
                    for (Expression l : e.getLabels()) {
                        labels.add(new NameExpr(t.get(l.asIntegerLiteralExpr().asNumber().intValue())));
                    }
                    e.setLabels(labels);
                }
            });
        }
        // Every call of a helper must be a switch selector we rewrite.
        int calls = 0;
        for (MethodCallExpr c : cu.findAll(MethodCallExpr.class)) {
            if (tables.containsKey(c.getNameAsString()) && c.getArguments().isEmpty()) calls++;
        }
        if (calls != switches) return -1;
        edits.forEach(Runnable::run);
        for (Map.Entry<String, MethodDeclaration> h : helpers.entrySet()) {
            String field = cacheField.get(h.getKey());
            Node owner = h.getValue().getParentNode().get();  // class body or anonymous class body
            h.getValue().remove();
            if (field != null) {
                for (Node child : new ArrayList<>(owner.getChildNodes())) {
                    if (child instanceof FieldDeclaration) {
                        FieldDeclaration f = (FieldDeclaration) child;
                        if (f.getVariables().size() == 1 && f.getVariable(0).getNameAsString().equals(field)) f.remove();
                    }
                }
            }
        }
        return switches + helpers.size();  // > 0 whenever the file changed
    }
}
