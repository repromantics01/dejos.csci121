;determine if number is palindrome

.model small
.stack 64
.data
    buffer_list label byte
    maxlen db 50
    actlen db ?
    inBuffer db 50 dup (' ')
    revString db 50 dup (' ')
    
    msg1 db "Input string: ",'$' 
    msgP db "Palindrome",'$'
    msgNP db "Not a Palindrome", '$'
    row db 0
    
.code
main proc near
    mov AX, @data
    mov ES, AX
    mov DS, AX
    
    mov DX, offset msg1
    mov AH, 9
    int 21H 
   
    mov AH, 0AH   
    lea DX, buffer_list
    int 21H
    
    lea SI, inBuffer 
    mov BX, 0
    mov BL, actlen
    add SI, BX
    dec SI
    lea DI, revString
    
    call reverseString
    
    lea SI, inBuffer
    lea DI, revString

    mov BX, 0
    mov BL, actlen
    mov CX, BX
    
    checkMatch:
        CMPSB
        jne notPalindrome
        loop checkMatch
    
    isPalindrome:
        call newLine
        lea DX, msgP
        mov AH, 09H
        int 21H
        
        jmp end
    
    notPalindrome:
        call newLine
        lea DX, msgNP
        mov AH, 09H
        int 21H
        
    end:
        mov AX, 4C00H
        int 21H
     
main endp    

newLine proc near
    inc row
    
    mov AH, 02H
    mov BH, 00
    mov DL, 00
    add DH, row
    int 10H
    
    ret   
newLine endp 

reverseString proc near
    mov BX, 0
    mov BL, actlen
    mov CX, BX
    
    rev:
        std
        lodsb 
        cld
        stosb
    loop rev
    
    ret
reverseString endp    