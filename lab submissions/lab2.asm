.model small
.stack 64
.data
    
    num dw 5
    output dw 0
    
.code
main proc near
    mov AX, @data
    mov DS, AX
    mov ES, AX
    
    mov AX, num ;moves the input to AX register
    
    collatz:
    cmp AX,1  ;compares if AX == 1
    JE end    ; if equal, jump to end label
    
    parity:
    test AX,1 ;tests if the last significant digit of the input is 1 (even if 0, odd otherwise)
    JZ even   ;jump to even label if zero
    JNZ odd   ;jump to odd label if not zero
    
    even:
    mov BX,2  ;sets BX to two, this serves as the divisor
    div BX    ;divides AX by BX and stores it to AX
    add output,1 ;adds one to the number of collatz cycle
    jmp collatz  
    
    odd:
    mov BX,3  ;sets BX to 3, this serves as a multiplier
    mul BX    ;multiplies AX and BX
    add AX, 1 ;adds one to the result
    add output,1 ;adds one to the number of collatz cycle
    jmp collatz
    
    
    end:  
    int 21H  ;ends the cylce once AX reaches one
        
main endp
