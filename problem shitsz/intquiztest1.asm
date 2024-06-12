.model small
.stack 64
.data 
    str1 db "computer organization" ,'$'
    para_list label byte
        max_len db 20
        act_len db ?
        kb_data db 20 dup('B'),'$'
.code
main proc near
    mov AX, @data
    mov DS, AX
    mov ES, AX
    
    mov AH, 0AH
    lea DX, para_list
    int 21H
    
    l0:
        lea BX, kb_data
        lea SI, str1
        mov CH, 00
        mov CL, act_len
    l1:
        mov AL, [BX]
        cmp [SI], AL
        je cont
        jne stop
    cont:
        inc SI
        inc BX
        
    loop l1
        lea DX, str1
        mov AH, 09H
        int 21H
        jmp exit
        
    stop: 
        lea DX, kb_data
        mov AH, 09H
        int 21H
        
    exit:
    mov AX, 4C00H
    int 21H
    
main endp