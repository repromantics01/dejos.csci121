.model small
.stack 64
.data
    para_list label byte
    max_len db 20   ;maxiimum number input characters
    act_len db 20    ;maximum number input characters
    kb_data db 20 DUP(' ');characters entered in Kb
.code
main proc near
    mov AX, @data
    mov ES, AX
    mov DS, AX
    
    ;request keyboard input and stores the data in kb
    mov AH, 0AH
    lea DX, para_list
    int 21H 
    
    ;keyboard input with echo
    ;mov AH, 01H
    ;int 21H
    
    ;keyboard input without echo(does not echo on the screen)
    ;mov AH, 07H
    ;int 21H
    
    ;keyboard input without echo
    ;mov AH, 08H
    ;int 21H 
    
main endp