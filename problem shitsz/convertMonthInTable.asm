.model small
.stack 64
.data 
    month_tbl db "January.."
              db "February."
              db "March...."
              db "April...."
              db "May......"
              db "June....."
              db "July....."
              db "August..."
              db "September"
              db "October.."
              db "November."
              db "December."
    input db ?
              
.code
main proc near
    mov AX, @data
    mov ES, AX
    mov DS, AX
    
    mov AH, 01H
    int 21H
    
    sub AL, 30H
    
    lea SI, month_tbl
    mov CL, 9
    mul CL
    
    mov AH, 0 
    add SI, AX
    
    mov AH, 02H
    mov BH, 00
    mov DL, 00
    add DH, 1
    int 10H
    
    lea DX, SI
    mov AH, 09H
    int 21H
    
    mov AX, 4C00H
    int 21H  

    
main endp    