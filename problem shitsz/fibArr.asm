.model small
.stack 64

.data
    ;InitArray db 3, 2, 1, 4, 5, 7, 8, 11, 21, 13, 15, 14, 9, 16, 17, 20, 19, 21, 18, 12 
    InitArray db 8, 2, 6, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20
    FibInt dw 20 dup (?)
                     
.code
    main proc near
    mov AX, @data
    mov DS, AX
    mov ES, AX  
    mov CX, 0
             
             
    L120: 
    cmp CX, 20
    jz done 
       
    mov DI, CX   
    mov AH, InitArray[DI]
  
    mov BX, 0 
    mov DX, 1
    
    L121:
    cmp AH, 0 
    jz store
    mov SI, DX
    add BX, DX
    mov DX, BX
    mov BX, SI
    DEC AH
    jmp L121

    store:    
    shl DI, 1
    mov FibInt[DI], DX
    INC CX 
    jmp L120
             
    done:
    mov AX,4C00H
    int 21H
    main endp