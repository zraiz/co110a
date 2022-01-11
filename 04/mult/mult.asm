// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.
0. @10     
1. D=A     
2. @0      
3. M=D     

4. @2      
5. D=A     
6. @1      
7. M=D     

8. @12
9. M=D

10. @0
11. D=M

12. @2
13. M=D+M

14. @12
15. M=M-1
16. M;JNE  

@17     
0;JMP