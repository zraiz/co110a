## A. NOT
<img src="NOT Gate.png" alt="NOT gate" title="NOT gate" height="400" />

### A.1 NOT Code
```
// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/01/Not.hdl

/**
 * Not gate:
 * out = not in
 */

CHIP Not {
    IN in;
    OUT out;

    PARTS:
    // Put your code here:
    Nand(a=in, b=in, out=out);
}
```

## B. AND
<img src="AND Gate.png" alt="AND gate" title="AND gate" height="400" />

### B.1 AND Code
```
// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/01/And.hdl

/**
 * And gate: 
 * out = 1 if (a == 1 and b == 1)
 *       0 otherwise
 */

CHIP And {
    IN a, b;
    OUT out;

    PARTS:
    // Put your code here:
    Nand(a = a, b = b, out = AnB);
    Not(in = AnB, out = out);
}
```

## C. OR
<img src="OR Gate.png" alt="OR gate" title="OR gate" height="400" />

### C.1 OR Code
```
// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/01/Or.hdl

 /**
 * Or gate:
 * out = 1 if (a == 1 or b == 1)
 *       0 otherwise
 */

CHIP Or {
    IN a, b;
    OUT out;

    PARTS:
    // Put your code here:
    Nand(a=a, b=a, out=oa);
    Nand(a=b, b=b, out=ob);
    Nand(a=oa, b=ob, out=out);
}
```

## D. XOR
<img src="XOR Gate.png" alt="XOR gate" title="XOR gate" height="400" />

### D.1 XOR Code
```
// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/01/Xor.hdl

/**
 * Exclusive-or gate:
 * out = not (a == b)
 */

CHIP Xor {
    IN a, b;
    OUT out;

    PARTS:
    // Put your code here:
    Nand(a=a, b=b, out=c);
    Nand(a=a, b=c, out=d);
    Nand(a=c, b=b, out=e);
    Nand(a=d, b=e, out=out);
}
```

## E. MUX
<img src="MUX Gate.png" alt="MUX gate" title="MUX gate" height="400" />

### E.1 MUX Code
```
// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/01/Mux.hdl

/** 
 * Multiplexor:
 * out = a if sel == 0
 *       b otherwise
 */

CHIP Mux {
    IN a, b, sel;
    OUT out;

    PARTS:
    // Put your code here:
    Nand(a=sel, b=sel, out=nsel); //Not
    Nand(a=a, b=nsel, out=c);
    Nand(a=b, b=sel, out=e);
    Nand(a=c, b=e, out=out);
}
```

## F. DMUX
<img src="DMUX Gate.png" alt="DMUX gate" title="DMUX gate" height="400" />

### F.1 DMUX Code
```
// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/01/DMux.hdl

/**
 * Demultiplexor:
 * {a, b} = {in, 0} if sel == 0
 *          {0, in} if sel == 1
 */

CHIP DMux {
    IN in, sel;
    OUT a, b;

    PARTS:
    // Put your code here:
    Nand (a=sel, b=sel, out=nsel); //Not

    Nand (a=in, b=nsel, out=c);
    Nand (a=c, b=c, out=a);

    Nand (a=in, b=sel, out=d);
    Nand (a=d, b=d, out=b);
}