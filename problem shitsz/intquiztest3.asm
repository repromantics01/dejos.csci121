;problem that displays its next ascii characters 
;given the single input character

.model small
.stack 64
.data
.code
main proc near
    mov AX, @data
    mov ES, AX
    mov DS, AX
    
    mov DX, 0
    mov AH, 01H
    int 21H
        
    l1:
        inc AL
        cmp AL, 7FH
        je end
        
        mov AH, 02H
        mov DL, AL
        int 21H
        jmp l1
        
    end:
        mov AX, 4C00H
        int 21H       
    
main endp    
