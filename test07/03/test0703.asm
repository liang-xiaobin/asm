assume cs:codesg,ds:datasg

datasg segment
  db 'BaSiC'
  db 'MinIX'
datasg ends

codesg segment
  start:
  	mov ax,datasg
  	mov ds,ax
  	mov bx,0
  	mov cx,5
  s: mov al,[bx]
     and al,11011111b
     mov [bx],al
     mov al,[bx+5]
     or  al,00100000b
     mov [bx+5],al
     inc bx
     loop s
codesg ends

end start