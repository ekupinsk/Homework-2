// function Sys.init 0
(Sys.init)
// C_PUSH constant 4000
@4000
D=A
@SP
A=M
M=D
@SP
M=M+1
// C_POP pointer 0
@3
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// C_PUSH constant 5000
@5000
D=A
@SP
A=M
M=D
@SP
M=M+1
// C_POP pointer 1
@4
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
 // call Sys.main 0
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
 @Sys.main
 0;JMP

 // Return label
 (RETURN_0)
// C_POP temp 1
@6
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// label LOOP
(Sys.init$LOOP)
// goto LOOP
@Sys.init$LOOP
0;JMP
// function Sys.main 5
(Sys.main)
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
@SP
A=M
M=0
@SP
M=M+1
// C_PUSH constant 4001
@4001
D=A
@SP
A=M
M=D
@SP
M=M+1
// C_POP pointer 0
@3
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// C_PUSH constant 5001
@5001
D=A
@SP
A=M
M=D
@SP
M=M+1
// C_POP pointer 1
@4
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// C_PUSH constant 200
@200
D=A
@SP
A=M
M=D
@SP
M=M+1
// C_POP local 1
@LCL
D=M
@1
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// C_PUSH constant 40
@40
D=A
@SP
A=M
M=D
@SP
M=M+1
// C_POP local 2
@LCL
D=M
@2
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// C_PUSH constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// C_POP local 3
@LCL
D=M
@3
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// C_PUSH constant 123
@123
D=A
@SP
A=M
M=D
@SP
M=M+1
 // call Sys.add12 1
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
 @Sys.add12
 0;JMP

 // Return label
 (RETURN_1)
// C_POP temp 0
@5
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
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
// C_PUSH local 2
@LCL
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// C_PUSH local 3
@LCL
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// C_PUSH local 4
@LCL
D=M
@4
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
// add
@SP
AM=M-1
D=M
A=A-1
M=D+M
// add
@SP
AM=M-1
D=M
A=A-1
M=D+M
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
// function Sys.add12 0
(Sys.add12)
// C_PUSH constant 4002
@4002
D=A
@SP
A=M
M=D
@SP
M=M+1
// C_POP pointer 0
@3
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// C_PUSH constant 5002
@5002
D=A
@SP
A=M
M=D
@SP
M=M+1
// C_POP pointer 1
@4
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
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
// C_PUSH constant 12
@12
D=A
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
