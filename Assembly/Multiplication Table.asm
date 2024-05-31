.model small
.stack 100h
.data
msg db 10,13,"enter the value: $" 
msg2 db 10,13,'$'

.code
.
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9h
    lea dx,msg
    int 21h
    
    mov ah,1h          ;input
    int 21h
    
    mov ch,10          ;check the table end
    mov cl,0
    
    cmp al,13 ;compare end
    sub al,48           ; al=al-30
    mov  bh,al              ;bh=al
    mov bl,1                     ;bl=1h
    
    tableloop:
    mov ah,9 
    lea dx,msg2   ;new line
    int 21h 
    
    mov ah,2
    mov dl,bh
    add dl,48
    int 21h
    
    mov dl,'*'
    mov ah,2
    int 21h
    
    mov al,bl
    mul bh ;bh=bh*al
    
    aam
    
    push ax
    
    mov ah,0
    mov al,bl
    
    aaa
    
    mov cl,ah
    mov bl,al
    
    mov dl,cl
    add dl,48
    mov ah,2
    int 21h
    
    
    mov dl,bl
    add dl,48
    mov ah,2h
    int 21h
    
    
  outputtable:
  mov dl,'='
  mov ah,2h
  int 21h
  
  pop ax
  
  mov dh,al
  mov dl,ah
  add dl,48
  mov ah,2
  int 21h
  
  mov dl,dh
  add dl,48
  mov ah,2
  int 21h
  
  
  inc bl
  dec ch
  cmp ch,0
  jne tableloop
  
  quittable:
  mov ah,4ch
  int 21h
  
    
    main endp
end main