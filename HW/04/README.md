## A. Alu
<img src="HW4.JPG" alt="HW4" title="HW4" height="400" />

### A.1 Alu Code
```
// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/02/ALU.hdl

/**
 * The ALU (Arithmetic Logic Unit).
 * Computes one of the following functions:
 * x+y, x-y, y-x, 0, 1, -1, x, y, -x, -y, !x, !y,
 * x+1, y+1, x-1, y-1, x&y, x|y on two 16-bit inputs, 
 * according to 6 input bits denoted zx,nx,zy,ny,f,no.
 * In addition, the ALU computes two 1-bit outputs:
 * if the ALU output == 0, zr is set to 1; otherwise zr is set to 0;
 * if the ALU output < 0, ng is set to 1; otherwise ng is set to 0.
 */

// Implementation: the ALU logic manipulates the x and y inputs
// and operates on the resulting values, as follows:
// if (zx == 1) set x = 0        // 16-bit constant
// if (nx == 1) set x = !x       // bitwise not
// if (zy == 1) set y = 0        // 16-bit constant
// if (ny == 1) set y = !y       // bitwise not
// if (f == 1)  set out = x + y  // integer 2's complement addition
// if (f == 0)  set out = x & y  // bitwise and
// if (no == 1) set out = !out   // bitwise not
// if (out == 0) set zr = 1
// if (out < 0) set ng = 1

CHIP ALU {
    IN  
        x[16], y[16],  // 16-bit inputs        
        zx, // zero the x input?
        nx, // negate the x input?
        zy, // zero the y input?
        ny, // negate the y input?
        f,  // compute out = x + y (if 1) or x & y (if 0)
        no; // negate the out output?

    OUT 
        out[16], // 16-bit output
        zr, // 1 if (out == 0), 0 otherwise
        ng; // 1 if (out < 0),  0 otherwise

    PARTS:
   // Put you code here:
    Mux16(a=x, b=false, sel=zx, out=xZero);

    Not16(in=xZero, out=notZx);
    Mux16(a=xZero, b=notZx, sel=nx, out=MnotX);

    Mux16(a=y, b=false, sel=zy, out=yZero);

    Not16(in=yZero, out=notZy);
    Mux16(a=yZero, b=notZy, sel=ny, out=MnotY);

    And16(a=MnotY, b=MnotX, out=XandY);
    Add16(a=MnotY, b=MnotX, out=XaddY);
    Mux16(a=XandY, b=XaddY, sel=f, out=opr);

    Not16(in=opr, out=nOpr);
    Mux16(a=opr, b=nOpr, sel=no, out=out, out[0..7]=out07, out[8..15]=out815, out[15]=ng);

    Or8Way(in=out07, out=or07);
    Or8Way(in=out815, out=or815);
    Or(a=or07, b=or815, out=or015);
    Not(in=or015, out=zr);
}
```
