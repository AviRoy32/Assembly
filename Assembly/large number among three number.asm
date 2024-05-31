.model small
.stack 100h
.data
a db 'Enter first number: $'
b db 10,13,'Enter second number: $' 
c db 10,13,'Enter third number: $' 
d db 10,13, 'Result $'
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,a
    int 21h
    
    mov ah,1
    int 21h
    mov bl,al 
    
    mov ah,9
    lea dx,b
    int 21h
    
    mov ah,1
    int 21h
    mov bh,al
    
    mov ah,9
    lea dx,c
    int 21h
    
    mov ah,1
    int 21h
    mov cl,al 
    
    mov ah,9
    lea dx,d
    int 21h
    
    cmp bl,bh
    jge l1
    
    l2:
    cmp bh,cl
    jge l3
    
    mov ah,2
    mov dl,cl
    int 21h
    jmp exit
    
    l3:
    mov ah,2
    mov dl,bh
    int 21h
    jmp exit
    
    l1:
    cmp bl,cl
    jge l4
    
    mov ah,2
    mov dl,cl
    int 21h
    jmp exit
    
    l4: 
    mov ah,2
    mov dl,bl
    int 21h
    jmp exit 
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main
    
    
    
    
    