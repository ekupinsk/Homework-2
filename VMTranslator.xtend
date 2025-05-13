package VMTranslator


import java.io.File
import java.io.FileWriter
import java.util.List
import java.util.Scanner
import java.util.ArrayList

// טיפוסי פקודות
enum CommandType {
 C_ARITHMETIC,
    C_PUSH,
    C_POP,
    C_LABEL,
    C_GOTO,
    C_IF,
    C_FUNCTION,
    C_RETURN,
    C_CALL
}
// נקודת התחלה של התוכנית
class VMTranslator {

 



// Extend the existing CommandType enum to include new command types


// Main VMTranslator class - updated to handle multiple files and function calls

    static def main(String[] args) {
        println("Enter path to .vm file or directory:")
        val input = new Scanner(System.in).nextLine
        val inputFile = new File(input)
       
        val vmFiles = new ArrayList<File>()
       
        // Handle directory or single file input
        if (inputFile.isDirectory) {
            vmFiles.addAll(inputFile.listFiles.filter[name.endsWith(".vm") && !name.contains("Sys.vm")])
            val sysFile = inputFile.listFiles.findFirst[name == "Sys.vm"]
            if (sysFile !== null) {
                vmFiles.add(0, sysFile)  // Ensure Sys.vm is processed first if it exists
            }
        } else if (inputFile.exists && inputFile.name.endsWith(".vm")) {
            vmFiles.add(inputFile)
        } else {
            println("File not found or not a .vm file/directory.")
            return
        }
       
        // Determine output file path
        val outputPath = if (inputFile.isDirectory)
            inputFile.path + File.separator + inputFile.name + ".asm"
        else
            inputFile.path.replace(".vm", ".asm")
       
        val codeWriter = new CodeWriter(new File(outputPath))
       
        // Write bootstrap code if multiple files
        if (vmFiles.size > 1) {
            codeWriter.writeInit()
        }
       
        // Translate each VM file
        for (file : vmFiles) {
            val parser = new Parser(file)
            codeWriter.setFileName(file.name.replace(".vm", ""))
           
            while (parser.hasMoreCommands) {
                parser.advance
                switch parser.commandType {
                    case C_PUSH:
                        codeWriter.writePushPop(parser.commandType, parser.arg1, parser.arg2)
                    case C_POP:
                        codeWriter.writePushPop(parser.commandType, parser.arg1, parser.arg2)
                    case C_ARITHMETIC:
                        codeWriter.writeArithmetic(parser.arg1)
                    case C_LABEL:
                        codeWriter.writeLabel(parser.arg1)
                    case C_GOTO:
                        codeWriter.writeGoto(parser.arg1)
                    case C_IF:
                        codeWriter.writeIf(parser.arg1)
                    case C_FUNCTION:
                        codeWriter.writeFunction(parser.arg1, parser.arg2)
                    case C_CALL:
                        codeWriter.writeCall(parser.arg1, parser.arg2)
                    case C_RETURN:
                        codeWriter.writeReturn()
                }
            }
        }
       
        codeWriter.close
        println("Translation completed: " + outputPath)
    }
}

// Updated Parser class to handle new command types
class Parser {
    var List<String> lines
    var int currentIndex = -1
    var String currentCommand

new(File file) {
  lines = java.nio.file.Files.readAllLines(file.toPath)
    .map[line | line.split("//").get(0).trim] // מסיר תגובות ומרווחים
    .filter[!empty]
    .toList
}


    def boolean hasMoreCommands() {
        return currentIndex < lines.size - 1
    }

    def void advance() {
        currentIndex++
        currentCommand = lines.get(currentIndex)
    }

    def CommandType commandType() {
        val cmd = currentCommand.split(" ").get(0)
        switch cmd {
            case "push": return CommandType.C_PUSH
            case "pop": return CommandType.C_POP
            case "label": return CommandType.C_LABEL
            case "goto": return CommandType.C_GOTO
            case "if-goto": return CommandType.C_IF
            case "function": return CommandType.C_FUNCTION
            case "call": return CommandType.C_CALL
            case "return": return CommandType.C_RETURN
            default: return CommandType.C_ARITHMETIC
        }
    }

    def String arg1() {
        switch commandType {
            case C_ARITHMETIC:
                return currentCommand
            case C_RETURN:
                throw new IllegalArgumentException("No arg1 for return command")
            default:
                return currentCommand.split(" ").get(1)
        }
    }

    def int arg2() {
        switch commandType {
            case C_PUSH,
            case C_POP,
            case C_FUNCTION,
            case C_CALL:
                return Integer.parseInt(currentCommand.split(" ").get(2))
            default:
                throw new IllegalArgumentException("No arg2 for this command type")
        }
    }
}

// Extended CodeWriter to support function calls, labels, and bootstrap code
class CodeWriter {
    val FileWriter writer
    var String fileName
    var int labelCount = 0
    var String currentFunction = ""

    new(File file) {
        writer = new FileWriter(file)
    }

    def void setFileName(String name) {
        fileName = name
    }

    // Bootstrap code to initialize the VM
    def void writeInit() {
        writer.write('''
        // Bootstrap code
        @256
        D=A
        @SP
        M=D
        ''')
        writeCall("Sys.init", 0)
    }

    // Implement function declaration
    def void writeFunction(String functionName, int numLocals) {
        currentFunction = functionName
        writer.write('''
        // function «functionName» «numLocals»
        («functionName»)
        ''')
       
        // Initialize local variables to 0
        for (var i = 0; i < numLocals; i++) {
            writer.write('''
            @SP
            A=M
            M=0
            @SP
            M=M+1
            ''')
        }
    }

    // Implement function call
    def void writeCall(String functionName, int numArgs) {
        val returnLabel = "RETURN_" + labelCount++
       
        writer.write('''
        // call «functionName» «numArgs»
        // Push return address
        @«returnLabel»
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1
       
        // Push LCL
        @LCL
        D=M
        @SP
        A=M
        M=D
        @SP
        M=M+1
       
        // Push ARG
        @ARG
        D=M
        @SP
        A=M
        M=D
        @SP
        M=M+1
       
        // Push THIS
        @THIS
        D=M
        @SP
        A=M
        M=D
        @SP
        M=M+1
       
        // Push THAT
        @THAT
        D=M
        @SP
        A=M
        M=D
        @SP
        M=M+1
       
        // Reposition ARG
        @SP
        D=M
        @«numArgs»
        D=D-A
        @5
        D=D-A
        @ARG
        M=D
       
        // Reposition LCL
        @SP
        D=M
        @LCL
        M=D
       
        // Transfer control
        @«functionName»
        0;JMP
       
        // Return label
        («returnLabel»)
        ''')
    }

    // Implement function return
    def void writeReturn() {
        writer.write('''
        // return
        // Store LCL in R13
        @LCL
        D=M
        @R13
        M=D
       
        // Store return address (5th frame element) in R14
        @5
        A=D-A
        D=M
        @R14
        M=D
       
        // Reposition return value for caller
        @SP
        AM=M-1
        D=M
        @ARG
        A=M
        M=D
       
        // Restore SP of caller
        @ARG
        D=M+1
        @SP
        M=D
       
        // Restore THAT
        @R13
        AM=M-1
        D=M
        @THAT
        M=D
       
        // Restore THIS
        @R13
        AM=M-1
        D=M
        @THIS
        M=D
       
        // Restore ARG
        @R13
        AM=M-1
        D=M
        @ARG
        M=D
       
        // Restore LCL
        @R13
        AM=M-1
        D=M
        @LCL
        M=D
       
        // Go to return address
        @R14
        A=M
        0;JMP
        ''')
    }

    // Implement label command
    def void writeLabel(String label) {
        writer.write('''
        // label «label»
        («currentFunction»$«label»)
        ''')
    }

    // Implement goto command
    def void writeGoto(String label) {
        writer.write('''
        // goto «label»
        @«currentFunction»$«label»
        0;JMP
        ''')
    }

    // Implement if-goto command
    def void writeIf(String label) {
        writer.write('''
        // if-goto «label»
        @SP
        AM=M-1
        D=M
        @«currentFunction»$«label»
        D;JNE
        ''')
    }

    // Existing methods from Project 7 remain the same
    def void writeArithmetic(String command) {
        writer.write("// " + command + "\n")
        switch command {
            case "add": binary("M=D+M")
            case "sub": binary("M=M-D")
            case "and": binary("M=D&M")
            case "or": binary("M=D|M")
            case "neg": unary("M=-M")
            case "not": unary("M=!M")
            case "eq": compare("JEQ")
            case "gt": compare("JGT")
            case "lt": compare("JLT")
        }
    }

    def void writePushPop(CommandType type, String segment, int index) {
        writer.write("// " + type + " " + segment + " " + index + "\n")
        if (type == CommandType.C_PUSH) {
            switch segment {
                case "constant":
                    writer.write("@" + index + "\nD=A\n")
                case "local": loadSegment("LCL", index)
                case "argument": loadSegment("ARG", index)
                case "this": loadSegment("THIS", index)
                case "that": loadSegment("THAT", index)
                case "temp": {
                    val tempAddress = 5 + index
                    writer.write("@" + tempAddress + "\nD=M\n")
                }
                case "pointer": {
                    val pointerAddress = index + 3
                    writer.write("@" + pointerAddress + "\nD=M\n")
                }
                case "static":
                    writer.write("@" + fileName + index + "\nD=M\n")
            }
            pushD()
        } else if (type == CommandType.C_POP) {
            switch segment {
                case "local": storeSegment("LCL", index)
                case "argument": storeSegment("ARG", index)
                case "this": storeSegment("THIS", index)
                case "that": storeSegment("THAT", index)
                case "temp": {
                    val tempAddress = 5 + index
                    writer.write("@" + tempAddress + "\nD=A\n")
                }
                case "pointer": {
                    val pointerAddress = index + 3
                    writer.write("@" + pointerAddress + "\nD=A\n")
                }
                case "static":
                    writer.write("@" + fileName + index + "\nD=A\n")
            }
            writer.write('''
            @R13
            M=D
            @SP
            AM=M-1
            D=M
            @R13
            A=M
            M=D
            ''')
        }
    }

    def void close() {
        // Infinite loop at end to prevent further execution
        writer.write('''
        // Infinite loop
        (END)
        @END
        0;JMP
        ''')
        writer.close
    }

    // Helper methods remain the same as in Project 7
    def void pushD() {
        writer.write('''
        @SP
        A=M
        M=D
        @SP
        M=M+1
        ''')
    }

    def void unary(String operation) {
        writer.write('''
        @SP
        A=M-1
        «operation»
        ''')
    }

    def void binary(String operation) {
        writer.write('''
        @SP
        AM=M-1
        D=M
        A=A-1
        «operation»
        ''')
    }

    def void compare(String jump) {
        val lbl = labelCount++
        writer.write('''
        @SP
        AM=M-1
        D=M
        A=A-1
        D=M-D
        @TRUE«lbl»
        D;«jump»
        @SP
        A=M-1
        M=0
        @END«lbl»
        0;JMP
        (TRUE«lbl»)
        @SP
        A=M-1
        M=-1
        (END«lbl»)
        ''')
    }

    def void loadSegment(String base, int index) {
        writer.write('''
        @«base»
        D=M
        @«index»
        A=D+A
        D=M
        ''')
    }

    def void storeSegment(String base, int index) {
        writer.write('''
        @«base»
        D=M
        @«index»
        D=D+A
	''')
	}
}