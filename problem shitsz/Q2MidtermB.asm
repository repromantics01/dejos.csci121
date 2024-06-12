.model small
.stack 64
.data
    str db "ABCDEFGHIJK",0

.code
main proc near
    mov AX, @data
    mov ES, AX
    mov DS, AX
    
    lea SI, str  
    mov CX, 0
    
    begin:
        mov AL, [SI]
        inc SI
        inc CL
        cmp AL, 0
    jne begin
    
    lea SI, str
    lea DI, str
    
    mov BX, CX
    sub BX, 2
    dec CX
    shr CX, 1
    
    beginExch:
        mov AL, [SI]
        mov AH, [DI+BX]
        
        mov [SI], AH
        mov [DI+BX], AL
        
        inc SI
        dec BX
    loop beginExch
    
main endp
         
        