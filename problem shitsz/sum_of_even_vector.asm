; Vector of Even Addition

.model small
.stack 64
.data
    set1 db 2,3,4,5,6,7,8
    set2 db 4,5,6,9,10,11,12
    res db 7 dup(?)
    
.code
main proc near
    mov AX, @data
    mov DS, AX
    mov ES, AX
    
    mov CX, 07
    lea SI, set1
    lea DI, set2
    lea BX, res
    
    start:
        mov AL, [SI]
        mov DL, AL
        mov AH, [DI]
        mov DH, AH
        
        shr AL, 01
        jnc even
        jmp loop_this
        
    even:
        shr AH, 01
        jc loop_this
        add DH,DL
        mov [BX], DH
        jmp loop_this
        
    loop_this:
        inc SI
        inc DI
        inc BX
    loop start
     
    mov AX, 4C00H
    int 21H
main endp 