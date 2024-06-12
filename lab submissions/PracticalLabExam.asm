.model small
.stack 64
.data
    matrix_list label byte
    maxlen1 db 13
    actlen1 db ?
    matrixInput db 13 dup ('$') 
    
    row dw 0 
    msg db 'Enter Input: '                    
    msg1 db 'Matrix: '            
    msg2 db 'Transposed Matrix: ' 
 
    matrixOutput db 13 dup(' '), '$' 
    
    displayMat db 4 dup ('$')    
    displayTrans db 3 dup ('$')  
    pos db 0
    

.code
main proc near
    mov AX, @data
    mov ES, AX
    mov DS, AX
    
    lea BP, msg
    mov CX, 13
    mov DH, pos
    mov DL, 0
    call display_text
    inc pos
    
    mov AH,0AH
    mov DX, matrix_list
    int 21H
    
    lea BP, msg1
    mov CX, 8
    mov DH, pos
    mov DL, 0
    call display_text 
    inc pos 
    
    call display_matrix
    inc pos

    lea BP, msg2
    mov CX, 19
    mov DH, pos
    mov DL, 0
    call display_text 
    inc pos 
    
    call transpose
    
    call display_matrix_result
    
    call replace_memory
    
    mov AX,04C00H
    int 21H
    main endp 

display_text proc near
        
        mov AH,13H
        mov AL,01H
        mov BX,0FH
        
        int 10H
              
    ret
    display_text endp

display_matrix proc near
    
        inc pos
        lea SI, matrixInput
        lea DI, displayMat
        mov CX, 3
        
        LO:
        mov AX,[SI]
        mov [DI],AX   
        inc SI
        inc DI
        loop LO:
        inc SI
                 
        lea BP, displayMat
        mov CX,4
        mov DH,pos
        mov DL,0
        call display_text 
        inc pos
        
        lea DI, displayMat
        mov CX,3
        
        L1:
        mov AX,[SI]
        mov [DI],AX   
        inc SI
        inc DI
        loop L1:
        inc SI
        
        lea BP, displayMat
        mov CX,4
        mov DH,pos
        mov DL,0
        call display_text 
        inc pos
        
        lea DI, displayMat
        mov CX,3
        
        L2:
        mov AX,[SI]
        mov [DI],AX   
        inc SI
        inc DI
        loop L2:
        
        lea BP, displayMat
        mov CX,4
        mov DH,pos
        mov DL,0
        call display_text 
        inc pos
              
    ret
    display_matrix endp

transpose proc near
        
        lea SI, matrixInput
        lea DI, matrixOutput
        mov CX,3
        
        TO:
        mov AL,[SI]
        mov [DI],AL
        add SI,4
        inc DI
        loop TO
        inc row
        
        lea SI, matrixInput
        add SI,row
        mov CX,3
        
        T1:
        mov AL,[SI]
        mov [DI],AL
        add SI,4
        inc DI
        loop T1
        inc row
        
        lea SI, matrixInput
        add SI,row
        mov CX,3
        
        T2:
        mov AL,[SI]
        mov [DI],AL
        add SI,4
        inc DI
        loop T2
        inc row
        
        lea SI, matrixInput
        add SI,row
        mov CX,3
        
        T3:
        mov AL,[SI]
        mov [DI],AL
        add SI,4
        inc DI
        loop T3
                
              
    ret
    transpose endp

display_matrix_result proc near
    
        inc pos
        lea SI, matrixOutput
        lea DI, displayTrans
        mov CX,2
        
        LRO:
        mov AX,[SI]
        mov [DI],AX   
        inc SI
        inc DI
        loop LRO:
        inc SI
                 
        lea BP, displayTrans
        mov CX,3
        mov DH,pos
        mov DL,0
        call display_text 
        inc pos
        
        lea DI, displayTrans
        mov CX,2
        
        LR1:
        mov AX,[SI]
        mov [DI],AX   
        inc SI
        inc DI
        loop LR1:
        inc SI
        
        lea BP, displayTrans
        mov CX,3
        mov DH,pos
        mov DL,0
        call display_text 
        inc pos
        
        lea DI, displayTrans
        mov CX,2
        
        LR2:
        mov AX,[SI]
        mov [DI],AX   
        inc SI
        inc DI
        loop LR2:
        inc SI
        
        lea BP, displayTrans
        mov CX, 3
        mov DH, pos
        mov DL, 0
        call display_text 
        inc pos
        
        lea DI, displayTrans
        mov CX,2
        
        LR3:
        mov AX,[SI]
        mov [DI],AX   
        inc SI
        inc DI
        loop LR3:
        
        lea BP, displayTrans
        mov CX,3
        mov DH,pos
        mov DL,0
        call display_text
              
    ret
    display_matrix_result endp

replace_memory proc near
     
    lea DI, matrixInput
    lea SI, matrixOutput
    mov CX,12
        
    REP MOVSB  
     
     ret
replace_memory endp   
