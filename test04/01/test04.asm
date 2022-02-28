assume cs:code
code segment
  mov ax,cs
  mov ds,ax
  mov ax,0020H
  mov es,ax
  mov bx,0
  sub cx,5
s:mov al,[bx]
  mov es:[bx],al
  inc bx
  loop s
  mov ax,4c00h
  int 21h
code ends
end