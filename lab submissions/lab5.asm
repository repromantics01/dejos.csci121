.model small
.stack 64
.data
    
    para_list label word
    max_len db 5
    act_len db ?
    kb_data1 dw 2 DUP(0)
    
    para_list2 label word
    max_len1 db 5
    act_len2 db ?
    kb_data2 dw 2 DUP(0)
    
    arr dw 4 DUP(0)
    arr2 dw 4 DUP(0)
    nums dw 2 DUP(0)
    
.code
main proc near
    mov AX, @data
    mov ES, AX
    mov DS, AX
    
    
    mov AH, 0AH
    lea DX, para_list
    int 21H
    
    mov AH, 02H
    mov BH, 0
    mov DH, 1
    mov DL, 0
    int 10H
    
    mov AH, 0AH
    lea DX, para_list2
    int 21H
    
    ;convert 1st num
    mov BX, kb_data1
    mov CX, 0
    mov CX, kb_data1+2
    
    sub BL, 30H
    sub BH, 30H
    sub CL, 30H
    sub CH, 30H
    
    lea SI, arr
    lea DI, nums
   
    mov [SI], CH
    mov [SI+2], CL
    mov [SI+4], BH
    mov [SI+6], BL
    
    mov AX, [SI+6]
    mov CX, 1000
    mul CX
    mov BP, AX
    
    mov AX,[SI+4]
    mov CX, 100
    mul CX
    add BP, AX
    
    mov AX, [SI+2]
    mov CX, 10
    mul CX
    add BP, AX
    
    add BP, [SI]
    mov [DI], BP
    
    ;convert 2nd number
    mov BX, kb_data2
    mov CX,0
    mov CX, kb_data2+2
    
    sub BL, 30H
    sub BH, 30H
    sub CL, 30H
    sub CH, 30H
    
    lea SI, arr2
    mov [SI], CH
    mov [SI+2], CL
    mov [SI+4], BH
    mov [SI+6], BL
    
    mov AX, [SI+6]
    mov CX, 1000
    mul CX
    mov BP, AX
    
    mov AX,[SI+4]
    mov CX, 100
    mul CX
    add BP, AX
    
    mov AX, [SI+2]
    mov CX, 10
    mul CX
    add BP, AX
    
    add BP, [SI]
    mov [DI+2], BP
    add BP, [DI]
    mov AX, BP; sum is stored in AX
    
    
main endp
