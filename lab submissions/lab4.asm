.model small
.stack 64
.data
    array db 4,24,12,19,5,10,30,3,8,22,13,9,11,1,20
    ;array db 5,3,2,8,1
    min db ?
    minIndex dw ?
    currentIndex dw ?
    
.code
main proc near
    mov AX, @data
    mov ES, AX
    mov DS, AX
    
    lea SI, array
    lea DI, array+1
    
    mov SP, SI
    mov BP, DI
    
    
    call selectionSort

main endp

selectionSort proc near
    
    mov CX, 15
    swap:
        call getMin
    mainf: 
        mov DI, minIndex
        mov BL, [SI]
        mov BH, [DI]
        
        xchg BL, BH
        mov [SI], BL
        mov [DI], BH
        inc SP
        
    loop swap    
    int 21H                 
    
selectionSort endp

getMin proc near
    
    mov SI, SP
    mov DI, BP
    loop_func:
        cmp DI, 15
        je return
        mov AL, [SI]
        mov AH, [DI]
        cmp AL, AH
        jle lesser
        jmp greater
        
    
    greater:
        mov AL, [DI]
        mov SI, DI
        mov minIndex, SI ;stores minimum number's index into minIndex
        
    lesser:
        inc DI
    
    jmp loop_func
    
    return:
        mov min, AL ;stores minimum number into AL
        inc BP
        jmp mainf             
               
    
getMin endp


    
