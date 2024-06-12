;convert string to lowercase
.model small
.stack 64
.data
    para_list label byte
        max_len db 20
        act_len db ?
        kb_data db 20 dup (0), '$'
    res db max_len dup(0)
.code
main proc near
    mov AX, @data
    mov DS, AX
    mov ES, AX
    
    mov AH, 0AH
    mov DL, kb_data
    int 21H
    
    lea SI, kb_data
    mov CH, 00
    mov CL, act_len
    
    mov AH, 02H
    mov BH, 0
    mov DH, 1
    mov DL, 0
    int 10H
    
    convert:
    add [SI], 20H
    mov AL, [SI]
    
    mov AH, 02H
    mov DL, AL
    int 21H
    
    inc SI
    loop convert
    
    mov AX, 4C00H
    int 21H
    
    
    
    
    
main endp