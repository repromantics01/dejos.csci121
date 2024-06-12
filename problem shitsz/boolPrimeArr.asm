;create array of flags that determines if a number from the 1st array is prime or not

.model small
.stack 64
.data
    byteList db 2,5,3,13,44,4,8,9,10,12,13,16,14,17,10
    boolPrime db 15 DUP (0)

.code
main proc near
    mov AX, @data
    mov ES, AX
    mov DS, AX
    
    lea SI, byteList  ;moves offset of byteList to SI
    lea DI, boolPrime ;moves offset of byteList to DI
    mov AX, 0         ;clears the content of AX register
    
    setNum:
    cmp SI, 15        ;will stop the loop if it reaches last index
    je end
    mov CL, [SI]      ;counter register will be initially set to SI's element
    
    evalNum: 
    mov AX, 0         ;clears content of AX register since it was stored the quotient and remainder
    mov AL, [SI]      ;AL will be set to the index's corresponding element from byteList
    cmp AL, CL        ;compares if its contents are the same  
    je skip           ;indicates that a number is divisible by itself, so skip
    
    cmp CL, 1         ;indicates that once CL reaches 1, it does not have any factor
    je prime          ;jumps to prime since CL cannot reach 1 if number has a factor
    div CL            ;AL/CL (since byte, AH=remainder and AL=quotient)
    cmp AH, 0         ;if it has no remainder, then it has a factor other than one and itself
    je incrementBList ;flag will not be set so will immediately increment the byteList
     
    skip:
    loop evalNum      ;loops eval num function
    
    prime:            ;will set flag of boolPrime list 
    mov [DI], 1
    
    incrementBList:
    inc SI
    inc DI
    jmp setNum
    
    end:
    mov AX, 4C00H
    int 21H
        
main endp
    
    
    
