// Ghidra headless post-script used to produce the sibling
// .disasm.txt / .decompiled.c / .symbols.txt files.
//
// Usage:
//   analyzeHeadless /tmp/ghidra_proj LumiyaRawbuf \
//       -import path/to/librawbuf.so \
//       -scriptPath . -postScript DumpAll.java
//
// Writes to $GHIDRA_OUT (default /tmp/ghidra_dump).

import ghidra.app.script.GhidraScript;
import ghidra.app.decompiler.DecompInterface;
import ghidra.app.decompiler.DecompileOptions;
import ghidra.app.decompiler.DecompileResults;
import ghidra.program.model.listing.Function;
import ghidra.program.model.listing.FunctionIterator;
import ghidra.program.model.listing.Instruction;
import ghidra.program.model.listing.InstructionIterator;
import java.io.*;

public class DumpAll extends GhidraScript {
    @Override
    public void run() throws Exception {
        String outDir = System.getenv("GHIDRA_OUT");
        if (outDir == null) outDir = "/tmp/ghidra_dump";
        new File(outDir).mkdirs();

        String base = currentProgram.getName();

        File asmFile = new File(outDir, base + ".disasm.txt");
        try (PrintWriter pw = new PrintWriter(new BufferedWriter(new FileWriter(asmFile)))) {
            InstructionIterator it = currentProgram.getListing().getInstructions(true);
            while (it.hasNext()) {
                Instruction ins = it.next();
                pw.printf("%s  %-8s %s%n", ins.getAddress(), ins.getMnemonicString(), ins.toString());
            }
        }
        println("Wrote: " + asmFile);

        DecompInterface decomp = new DecompInterface();
        decomp.setOptions(new DecompileOptions());
        decomp.openProgram(currentProgram);

        File cFile = new File(outDir, base + ".decompiled.c");
        File symFile = new File(outDir, base + ".symbols.txt");
        try (PrintWriter pw = new PrintWriter(new BufferedWriter(new FileWriter(cFile)));
             PrintWriter sp = new PrintWriter(new BufferedWriter(new FileWriter(symFile)))) {
            pw.println("// Ghidra decompilation of " + base);
            pw.println();

            FunctionIterator fit = currentProgram.getFunctionManager().getFunctions(true);
            int n = 0;
            while (fit.hasNext()) {
                Function f = fit.next();
                sp.printf("%s  %s%n", f.getEntryPoint(), f.getName());
                DecompileResults res = decomp.decompileFunction(f, 60, monitor);
                pw.println("// === " + f.getName() + " @ " + f.getEntryPoint() + " ===");
                if (res != null && res.decompileCompleted() && res.getDecompiledFunction() != null) {
                    pw.println(res.getDecompiledFunction().getC());
                } else {
                    pw.println("// <decompile failed>");
                }
                pw.println();
                n++;
            }
            println("Decompiled " + n + " functions -> " + cFile);
        }
    }
}
