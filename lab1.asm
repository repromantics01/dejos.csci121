.model small
.stack 64
.data

 var1 db 0A4H
 var2 dw 84FBH
 var3 dd 85BA45FBH
 arr1 db 05H,06H,07H,08H,0AH,0BH,0CH
 arr2 dw 078AH,9453H,321AH
 
.code
 main proc near
 mov AX,@data
 mov DS,AX
 mov ES,AX

 mov AH,var1
 mov AL,arr1 
 mov BX,var2
 mov CX,arr2
 mov DX,AX
  
 mov var1,CH
 mov arr1,CL
 mov var2,AX
 mov arr2,BX
 
 mov AX,4C00H
 int 21H
 main endp
 
