assume cs:code
code segment
  mov ax,0020H
  mov ds,ax
  mov cx,64
  mov bl,0
s: mov ds:[bx],bl
   inc bl
   loop s
   mov ax,4c00h
   int 21h
code ends
end
  