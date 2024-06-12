.model small
.stack 64
.data
    string1 db "Interstellar"
    string2 db 12 DUP(20H)

.code
main proc near
    mov AX, @data
    mov DS, AX
    mov ES, AX
    
    cld 
    mov CX, 12
    lea SI, string1
    lea DI, string2+11
    
    l20:
        LODSB   
        mov [DI], AL
        dec DI
    loop l20 
                    
main endp    