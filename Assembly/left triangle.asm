.model small
.stack 100h
.data
msg1 db 'Enter your input:$ '
msg db 10,13,"$"
.code
main proc
    
 mov ax,@data
 mov ds,ax 
 
 mov ah,9
 lea dx,msg1
 int 21h
    
 mov ah,1
 int 21h
 
 sub al,48
 mov ah,0
 
 mov cx,ax
 
 mov bx,1
 
 mov dx,offset msg
 mov ah,9
 int 21h
 
 l1:
 push cx
 mov ah,2
 mov dl,32
 
 l2:
  int 21h
  loop l2
  mov cx,bx
  mov dl,'*'
  
  
  
  inc bx
  
  l3:
  int 21h
  loop l3
  mov ah,2
  pop cx
  
  lea dx,msg
  mov ah,9
  int 21h
  
  loop l1
   
   
main endp
end main