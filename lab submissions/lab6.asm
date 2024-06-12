.model small
.stack 64
.data
    src_list label byte
    max1_len db 50
    act1_len db 0 
    kb1_data db 50 dup(' '), 0
    
    dest_list label byte
    max2_len db 50
    act2_len db 0
    kb2_data db 50 dup(' '), 0
    
    ctr db 0
    row db 0
    tryAgain db ?
    msg1 db 'Source: ','$'
    msg2 db 'Destination: ','$'
    msg3 db 'Count: ','$'
    msg4 db 'Try Again? [Y/N]','$'   

.code
main proc near
    mov AX, @data
    mov ES, AX
    mov DS, AX
    
    start:
        mov ctr, 0
        call askSrcInput
        call newLine
        call askDestInput
        
        cmp act1_len, 0
        je end_loop
        
        cmp act2_len, 0
        je end_loop
        
        cld
        mov CX, 0
        lea SI, kb1_data
        lea DI, kb2_data
        
        mov AH, 00
        mov AL, ctr
        
        ;iterates through the source index if mismatch is found
        loop_1: 
            cmp [SI], 0
            je end_loop
            
            cld
            mov CX, 0
            mov CL, act2_len
            lea SI, kb1_data
            add SI, AX
            
            lea DI, kb2_data
            repe cmpsb
            jne skip
            
            inc ctr
            
            skip:
                inc AX
                jmp loop_1
               
    end_loop:
    
        call newLine  
    
        add ctr, 30H
        
        mov AH, 09H
        lea DX, msg3
        int 21H
        
        mov AH, 0AH
        mov AL, ctr
        mov BH, 00
        mov BL, 16H
        mov CX, 1
        int 10H
               
        
        call newLine       
        call askTryAgain
        cmp AL, 'y'
        je start       
               
        mov AX, 4C00H
        int 21H
                            
main endp

askDestInput proc near 
    inc row     
    ;prompts user for destination input
    lea DX, msg2
    mov AH, 09H
    int 21H 
    
    ;user enters destination input
    mov AH, 0AH
    lea DX, dest_list
    mov SI, DX
    int 21H
    
    ret
    
askDestInput endp

askSrcInput proc near 
    inc row
    ;prompts user for source input
    lea DX, msg1
    mov AH, 09H
    int 21H  
    
    ;user enters source input
    mov AH, 0AH
    lea DX, src_list 
    mov SI, DX
    int 21H 
    
    ret 
    
askSrcInput endp

newLine proc near
    ;moves cursor down
    mov AH, 02H
    mov BH, 00
    mov DL, 00
    add DH, row
    int 10H
    
    ret
    
newLine endp

askTryAgain proc near
    inc row
    call newLine
    
    lea DX, msg4
    mov AH, 09H
    int 21H
    
    mov AH, 01H
    int 21H
    
    ret 
    
askTryAgain endp    
