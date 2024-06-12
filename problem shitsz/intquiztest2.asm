.model small
.stack 64
.data
    A db 12
    B db 6
.code
main proc near
    mov AX, @data
    mov DS, AX
    mov ES, AX
    
    mov CX, 00
    mov CL, B
    
    l1:
        mov AH, 00H     
        mov BH, 00
        mov DH, A
        mov DL, 10
        int 10H
        
        mov AH, 0AH
        mov AL, 'j'
        mov BH, 00
        int 10H
        inc DH
     loop l1
    
    
main endp