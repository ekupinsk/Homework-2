// function SimpleFunction.test 2
(SimpleFunction.test)
@SP
A=M
M=0
@SP
M=M+1
@SP
A=M
M=0
@SP
M=M+1
// C_PUSH local 0
@LCL
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// C_PUSH local 1
@LCL
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
AM=M-1
D=M
A=A-1
M=D+M
// not
@SP
A=M-1
M=!M
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
// add
@SP
AM=M-1
D=M
A=A-1
M=D+M
// C_PUSH argument 1
@ARG
D=M
@1
A=D+A
D=M
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
