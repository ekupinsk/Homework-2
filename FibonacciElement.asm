// Bootstrap code
@256
D=A
@SP
M=D
 // call Sys.init 0
 // Push return address
 @RETURN_0
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
 @0
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
 @Sys.init
 0;JMP

 // Return label
 (RETURN_0)
// function Sys.init 0
(Sys.init)
// C_PUSH constant 4
@4
D=A
@SP
A=M
M=D
@SP
M=M+1
 // call Main.fibonacci 1
 // Push return address
 @RETURN_1
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
 @1
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
 @Main.fibonacci
 0;JMP

 // Return label
 (RETURN_1)
// label END
(Sys.init$END)
// goto END
@Sys.init$END
0;JMP
// function Main.fibonacci 0
(Main.fibonacci)
// C_PUSH argument 0
@ARG
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// C_PUSH constant 2
@2
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
AM=M-1
D=M
A=A-1
D=M-D
@TRUE2
D;JLT
@SP
A=M-1
M=0
@END2
0;JMP
(TRUE2)
@SP
A=M-1
M=-1
(END2)
// if-goto N_LT_2
@SP
AM=M-1
D=M
@Main.fibonacci$N_LT_2
D;JNE
// goto N_GE_2
@Main.fibonacci$N_GE_2
0;JMP
// label N_LT_2
(Main.fibonacci$N_LT_2)
// C_PUSH argument 0
@ARG
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
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
// label N_GE_2
(Main.fibonacci$N_GE_2)
// C_PUSH argument 0
@ARG
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// C_PUSH constant 2
@2
D=A
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
AM=M-1
D=M
A=A-1
M=M-D
 // call Main.fibonacci 1
 // Push return address
 @RETURN_3
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
 @1
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
 @Main.fibonacci
 0;JMP

 // Return label
 (RETURN_3)
// C_PUSH argument 0
@ARG
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// C_PUSH constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
AM=M-1
D=M
A=A-1
M=M-D
 // call Main.fibonacci 1
 // Push return address
 @RETURN_4
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
 @1
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
 @Main.fibonacci
 0;JMP

 // Return label
 (RETURN_4)
// add
@SP
AM=M-1
D=M
A=A-1
M=D+M
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
// Infinite loop
(END)
@END
0;JMP
