assume cs:codesg,ds:datasg

datasg segment
datasg ends

codesg segment
  start: mov dx,1
         mov ax,86A1H
         mov bx,100
         div bx
codesg ends

end start