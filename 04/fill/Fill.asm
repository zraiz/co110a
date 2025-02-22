// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

@16384    
D=A
@1
M=D

@0       
M=0
@10
0;JMP     

@0        
M=-1

@0        
D=M
@1        
A=M
M=D       

@24575    
D=A
@1
D=D-M
@0        
D;JEQ

@1        
M=M+1

@24576    
D=M
@4
D;JEQ
@8        
0;JMP