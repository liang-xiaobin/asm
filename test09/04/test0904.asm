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
  push ax ;Ŀ�ĵ�ַ�Ķε�ַ
  push bx ;�ַ����������ݶ��е�ƫ�Ƶ�ַ
  
  mov es, ax
  
  mov si, 0  ;Դ�ַ���
  mov di, 0  ;Ŀ��
  
  mov cx, 10h
 s1: mov al, ds:[si] ;��ѭ���� �ַ����� Դ��ַ���Ƶ� Ŀ�ĵ�ַ  
  mov es:[di], al ;��Ϊ ÿ���ַ�ռ�����ֽ� ��һ���ֽ��� ASCII �ڶ����ֽ��Ǹ��ַ����� [��ʱÿ���ַ�������ռ���ֽ�Ԥ������]
  inc si
  add di, 2  
  loop s1
  
  mov di, 1
  pop bx
  mov al, ds:10h[bx]
  inc bx
  
  mov cx, 10h
 s2: mov es:[di], al  ;��ѭ�����ÿ���ַ�������
  add di, 2
  loop s2
  
  pop ax
  add ax, 0ah ;Ŀ�ĵ�ַ�Ķε�ַ
  
  pop cx
  loop s3
  
  mov ax, 4c00h
  int 21h  
code ends

end start