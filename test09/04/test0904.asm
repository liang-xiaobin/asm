assume cs:code,ds:data,ss:stack

data segment
 db 'welcome to masm!'
 db 02h, 24h, 71h 
data ends

stack segment
 dw 8 dup(0)
stack ends

code segment
start: mov ax, data
  mov ds, ax
  mov ax, stack
  mov ss, ax
  mov sp, 16h
  mov bx,0
  mov ax, 0b872h
  
  mov cx, 3
 s3: push cx 
  push ax ;目的地址的段地址
  push bx ;字符属性在数据段中的偏移地址
  
  mov es, ax
  
  mov si, 0  ;源字符串
  mov di, 0  ;目标
  
  mov cx, 10h
 s1: mov al, ds:[si] ;次循环把 字符串从 源地址复制到 目的地址  
  mov es:[di], al ;因为 每个字符占两个字节 第一个字节是 ASCII 第二个字节是该字符属性 [此时每个字符属性所占的字节预留出来]
  inc si
  add di, 2  
  loop s1
  
  mov di, 1
  pop bx
  mov al, ds:10h[bx]
  inc bx
  
  mov cx, 10h
 s2: mov es:[di], al  ;此循环填充每个字符的属性
  add di, 2
  loop s2
  
  pop ax
  add ax, 0ah ;目的地址的段地址
  
  pop cx
  loop s3
  
  mov ax, 4c00h
  int 21h  
code ends

end start