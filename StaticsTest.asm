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
// C_PUSH constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// C_PUSH constant 8
@8
D=A
@SP
A=M
M=D
@SP
M=M+1
 // call Class1.set 2
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
 @2
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
 @Class1.set
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
// C_PUSH constant 23
@23
D=A
@SP
A=M
M=D
@SP
M=M+1
// C_PUSH constant 15
@15
D=A
@SP
A=M
M=D
@SP
M=M+1
 // call Class2.set 2
 // Push return address
 @RETURN_2
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
 @2
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
 @Class2.set
 0;JMP

 // Return label
 (RETURN_2)
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
 // call Class1.get 0
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
 @Class1.get
 0;JMP

 // Return label
 (RETURN_3)
 // call Class2.get 0
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
 @Class2.get
 0;JMP

 // Return label
 (RETURN_4)
// label END
(Sys.init$END)
// goto END
@Sys.init$END
0;JMP
// function Class1.set 0
(Class1.set)
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
// C_POP static 0
@Class10
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
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
// C_POP static 1
@Class11
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// C_PUSH constant 0
@0
D=A
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
// function Class1.get 0
(Class1.get)
// C_PUSH static 0
@Class10
D=M
@SP
A=M
M=D
@SP
M=M+1
// C_PUSH static 1
@Class11
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
// function Class2.set 0
(Class2.set)
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
// C_POP static 0
@Class20
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
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
// C_POP static 1
@Class21
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// C_PUSH constant 0
@0
D=A
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
// function Class2.get 0
(Class2.get)
// C_PUSH static 0
@Class20
D=M
@SP
A=M
M=D
@SP
M=M+1
// C_PUSH static 1
@Class21
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
