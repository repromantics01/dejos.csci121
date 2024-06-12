.model small
.stack 64
.data
    InitArray dw 8,2,6,17,5,20,15,3,9,4,16,13,1,19,7,10,12,14,11,18
    FibInit dw 20 DUP(?)
    FibArr dw 20 DUP (?)
    
.code
main proc near
    mov AX, @data
    mov DS, AX
    mov ES, AX 
    mov SI, 0
    
    mov AX, 1
    mov [FibArr+SI], AX
    add SI,2
    
    mov AX, 2
    mov [FibArr+SI], AX
    add SI,2
    
    mov CX, 18
  
    storeInFibArr:
    add AX, [FibArr+(SI-4)]
    mov [FibArr+SI],AX
    add SI,2
       
    loop storeInFibArr
    
    mov SI, 0
    mov DI, 0
    mov CX, 20
    
    cont:
    mov AX, [InitArray+SI]
    mov BX, 2
    mul BX
    mov DI, AX
    mov DX, [FibArr+(DI-2)]
    mov [FibInit+SI], DX
    add SI,2
    
    loop cont    
    
main endp
