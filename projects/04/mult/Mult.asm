// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.
// i = 1
// mul = 0;
// while i <= R0:
//     mul += R1
//     i += 1

    @i
    M=0
    @mul
    M=0
(LOOP)
    @i          // D=i
    D=M
    @R0
    D=D-M       // D=i-R0
    @SAVE
    D;JEQ       // If i-R0 > 0 go to SAVE
    @R1
    D=M         // D=R1
    @mul
    M=D+M       // mul = mul + R1
    @i
    M=M+1       // i=i+1
    @LOOP
    0;JMP       // Go to LOOP
(SAVE)
    @mul
    D=M
    @R2
    M=D
(END)
    @END        // Infinite loop
    0;JMP
