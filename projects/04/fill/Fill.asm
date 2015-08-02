// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.

// Put your code here.


(LOOP)
    // arr = 16384 (base address of the Hack screen)
    @SCREEN
    D=A
    @arr
    M=D

    // n=8192
    @8192
    D=A
    @n
    M=D

    // initialize i = 0
    @i
    M=0
    // check keyboard
    @KBD
    D=M
    @WHITE
    D;JEQ
    @BLACK
    D;JNE

(BLACK)
    // if (i==n) go to LOOP
    @i
    D=M
    @n
    D=D-M
    @LOOP
    D;JEQ

    // RAM[arr+i] = -1
    @arr
    D=M
    @i
    A=D+M
    M=-1

    // i++
    @i
    M=M+1

    @BLACK
    0;JMP

(WHITE)
    // if (i==n) go to LOOP
    @i
    D=M
    @n
    D=D-M
    @LOOP
    D;JEQ

    // RAM[arr+i] = -1
    @arr
    D=M
    @i
    A=D+M
    M=0

    // i++
    @i
    M=M+1

    @WHITE
    0;JMP
