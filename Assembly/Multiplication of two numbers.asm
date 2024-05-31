.model small
.stack 100h
.data
a db 'Enter First Number: $'
b db 10,13,'Enter second number: $'
d db 10,13,'Result: $'
e db ?
f db ?
rem db ?
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,a
    int 21h
    
    mov ah,1
    int 21h
    sub al,48
    mov e,al 
    
    mov ah,9
    lea dx,b
    int 21h
    
    mov ah,1
    int 21h
    sub al,48
    mov f,al
    
    
    mov ah,9
    lea dx,d
    int 21h
    
    ;multiplication
    
    mov al,e
    mov bl,f
    mul bl
    
    mov ah,0
    mov bl,10 
    div bl
    mov rem,ah
    
    mov ah,2
    mov dl,al
    add dl,48
    int 21h
    
    mov ah,2
    mov dl,rem
    add dl,48
    int 21h
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main