// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.
    @2
	M=0 //set RAM[2] value into 0
	@0
	D=M
	@31
	D;JEQ //check if RAM[0] == 0, jump into the conclusion RAM[2] = 0. Because 0 * x = 0
	@1
	D=M
	@31
	D;JEQ //check if RAM[1] == 0, jump into the conclusion RAM[2] = 0. Because x * 0 = 0
	@18
	D;JGT // else if RAM[1] is greater than 0, jump to line 14
	@0 //else if RAM[1] is negative
	M=!M //set RAM[0] value into negative
	M=M+1 //Add RAM[0] value by 1, because M = !M would be M = -1 * (M+1).. e.x (M = 5; !M = -6)
	@1
	M=!M //set RAM[1] = !RAM[1] so the value would be positive
	M=M+1 //Just like before, we add !M value by 1
	@0 //start the looping program to multiplies R0 and R1
	D=M
	@2
	M=D+M //set RAM[2] = RAM[2] + RAM[0]
	@1
	M=M-1 //decrease the total loop that need to do
	D=M 
	@18
	D;JGT //if the loop value haven't reach 0, the program would go back to line 25
	//the loop has finished and the final result is in RAM[2]