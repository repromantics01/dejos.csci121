.model small
.stack 64
.data
    var1 dw 28
    sum dw 0
    isPerfect db 0
    
.code
main proc near 
    mov AX, @data
    mov ES, AX
    mov DS, AX
    
    mov CX, var1
    
    start:
        mov DX, 00
        mov AX, var1
        div CX
        
        cmp DX, 0
        je acc
        jmp end
        acc:
            add sum, AX
     
     end:
        loop start
     
     mov AX, var1
     sub sum, AX
     cmp AX, sum
     
     jne noflag
     
     flag:
        inc isPerfect
        jmp stop       
        
     noflag: 
        mov AL, 0
        mov isPerfect, AL
        
     stop:
    
main endp

