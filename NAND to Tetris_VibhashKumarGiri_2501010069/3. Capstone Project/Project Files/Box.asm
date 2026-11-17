(MAIN_LOOP)
    @KBD
    D=M
    @KEY_PRESSED
    D;JGT

(KEY_RELEASED)
    @color
    M=0
    @DRAW_BOX
    0;JMP

(KEY_PRESSED)
    @color
    M=-1

(DRAW_BOX)
    @20
    D=A
    @row_count
    M=D
    
    // Start address: SCREEN (16384) + Offset (2208)
    @16384
    D=A
    @2208
    D=D+A
    @addr
    M=D
    
(ROW_LOOP)
    @row_count
    D=M
    @MAIN_LOOP
    D;JEQ
    
    @color
    D=M
    
    @addr
    A=M
    M=D           // Paint 1st word
    
    A=A+1
    M=D           // Paint 2nd word
    
    @32
    D=A
    @addr
    M=D+M
    
    @row_count
    M=M-1
    
    @ROW_LOOP
    0;JMP