.model small
.stack 64
.data
    nums db 23,7,25,9,3,12,16,10,6,2
.code
main proc near
    mov AX,@data
    mov DS, AX
    mov ES, AX
    
    lea SI, nums
    lea DI, nums+1
    mov AL, [SI] ;register that stores the minimum number 
    mov CX, 9
    
    getMin:        
        mov BL, [DI] ;will increment
        cmp AL, BL
        jg greater
        jl lesser
        
        
    greater:
        mov AL, BL
           
    lesser:
        inc DI
        
    loop getMin
    
main endp        