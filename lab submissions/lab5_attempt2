.model small
.stack 100H
.data
    
    para_list label word
    max_len db 5
    act_len db ?
    kb_data1 db 4 DUP(0)
    
    para_list2 label word
    max_len2 db 5
    act_len2 db ?
    kb_data2 dw 2 DUP(0)      

    prompt1 db "Input 1: $"
    prompt2 dw "Input 2: $"
    result_label db "Sum: $"
    
    msg1_len equ $-prompt1
    msg2_len equ $-prompt2
.code
main proc near
    mov AX, @data
    mov DS, AX
    mov ES, AX
    
    lea SI, prompt1
    call loop_print
    
    mov AH, 0AH         ;asks the user for input
    lea DX, para_list
    int 21H
    
    call newLine
    lea SI, prompt2     ;will display 2nd message
    call loop_print 
    
    mov AH, 0AH         ;ask for 2nd input
    lea DX, para_list2
    int 21H
    
    lea SI, kb_data1
    call convert
    
    ;put code here      
    
    mov AX, 4C00H
    int 21H
main endp

loop_print proc near
    loop_p:    
        mov AH, 02H
        mov DL, [SI]
        cmp DL, '$'
        je end
        int 21H
        inc SI
    
    jmp loop_p
    
    end:
    ret    
loop_print endp

newLine proc near
    
    mov AH, 02H
    mov BH, 0
    mov DH, 1
    mov DL, 0
    int 10H
    
    ret
    
newLine endp

convert proc near
    mov CX, 0
    mov CL, act_len
                    
    mov AX, [SI] 
    mov BX, [SI+2]
    
    l_xtract:
        mov AX, [SI]
        sub AL, 30H
        mov [SI], AL
        inc SI
        
    loop l_xtract
    
    lea SI, kb_data1    
    mov AX, 0
    mov AL, act_len
    dec AL
    add SI, AX 
    
    mov BP, 0     ;sets bp   
    mov AX, 1     ;sets initial mutiplicand
    
    mov BX, [SI]
    mov CX, 0
    mov CL, BH
    add BP, CX    ;will store the converted num
    dec SI
    
    mov CX, 0
    mov CL, act_len
    dec CL
    
    l_convert:  
    
    mov BX, 10
    mul BX
    mov DI, AX ;DI preserves the power of 10
    
    mov DX, [SI]
    mul DH
    mov [SI], AX
    
    add BP, [SI]
    dec SI
        
    mov AX, DI
    
    loop l_convert    
    
    ret
    
convert endp              
