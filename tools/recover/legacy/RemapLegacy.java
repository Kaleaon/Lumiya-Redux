import java.io.*;
import java.nio.file.*;
import java.util.*;
import java.util.zip.*;
import org.objectweb.asm.*;
import org.objectweb.asm.commons.*;

/**
 * Last-resort recovery: ship the ORIGINAL compiled bytecode for classes that
 * no decompiler reproduces faithfully.
 *
 *   java RemapLegacy dump   ORIG_JAR CLASSES_TXT            -> referenced type names on stdout
 *   java RemapLegacy remap  ORIG_JAR CLASSES_TXT MAP_TXT OUT_JAR
 *
 * ORIG_JAR is dex2jar output of the original classes.dex. CLASSES_TXT lists
 * top-level internal names (com/lumiyaviewer/lumiya/Foo); their inner classes
 * are included automatically. MAP_TXT is "old new" per line (internal names),
 * produced by map_types.py from tools/migrate_androidx.py so the bytecode gets
 * exactly the same android.support -> androidx rewrite as the sources.
 */
public class RemapLegacy {
    static boolean selected(String entry, Set<String> tops) {
        if (!entry.endsWith(".class")) return false;
        String n = entry.substring(0, entry.length() - 6);
        if (n.contains("-$Lambda$")) return tops.contains(n);  // D8 lambda class
        int d = n.indexOf('$');
        return tops.contains(d < 0 ? n : n.substring(0, d));
    }

    static Set<String> readSet(String f) throws IOException {
        Set<String> s = new TreeSet<>();
        for (String l : Files.readAllLines(Paths.get(f))) {
            l = l.trim();
            if (!l.isEmpty() && !l.startsWith("#")) s.add(l);
        }
        return s;
    }

    public static void main(String[] a) throws Exception {
        Set<String> tops = readSet(a[2]);
        if (a[0].equals("dump")) {
            Set<String> names = new TreeSet<>();
            Remapper collector = new Remapper() {
                @Override public String map(String internalName) { names.add(internalName); return internalName; }
            };
            try (ZipFile z = new ZipFile(a[1])) {
                for (ZipEntry e : Collections.list(z.entries())) {
                    if (!selected(e.getName(), tops)) continue;
                    ClassReader r = new ClassReader(z.getInputStream(e));
                    r.accept(new ClassRemapper(new ClassWriter(0), collector), 0);
                }
            }
            for (String n : names) System.out.println(n);
            return;
        }
        Map<String, String> map = new HashMap<>();
        for (String l : Files.readAllLines(Paths.get(a[3]))) {
            String[] p = l.trim().split("\\s+");
            if (p.length == 2) map.put(p[0], p[1]);
        }
        Remapper remapper = new SimpleRemapper(map);
        // Platform calls whose contract changed after 3.4.2 shipped are
        // routed through com.lumiyaviewer.lumiya.compat.PlatformCompat.
        final String pi = "(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;";
        int n = 0;
        try (ZipFile z = new ZipFile(a[1]);
             ZipOutputStream out = new ZipOutputStream(new FileOutputStream(a[4]))) {
            for (ZipEntry e : Collections.list(z.entries())) {
                if (!selected(e.getName(), tops)) continue;
                ClassReader r = new ClassReader(z.getInputStream(e));
                ClassWriter w = new ClassWriter(0);
                ClassVisitor redirect = new ClassVisitor(Opcodes.ASM9, w) {
                    @Override
                    public MethodVisitor visitMethod(int acc, String name, String desc, String sig, String[] ex) {
                        MethodVisitor mv = super.visitMethod(acc, name, desc, sig, ex);
                        return new MethodVisitor(Opcodes.ASM9, mv) {
                            @Override
                            public void visitMethodInsn(int op, String owner, String mname, String mdesc, boolean itf) {
                                if (op == Opcodes.INVOKESTATIC && owner.equals("android/app/PendingIntent")
                                        && mdesc.equals(pi)
                                        && (mname.equals("getActivity") || mname.equals("getService") || mname.equals("getBroadcast"))) {
                                    owner = "com/lumiyaviewer/lumiya/compat/PlatformCompat";
                                }
                                super.visitMethodInsn(op, owner, mname, mdesc, itf);
                            }
                        };
                    }
                };
                r.accept(new ClassRemapper(redirect, remapper), 0);
                out.putNextEntry(new ZipEntry(e.getName()));
                out.write(w.toByteArray());
                out.closeEntry();
                n++;
            }
        }
        System.err.println("remapped " + n + " classes");
    }
}
