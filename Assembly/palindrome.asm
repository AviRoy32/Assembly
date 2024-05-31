.model small
.stack 100h
.data
msg1 db 'Enter any number or string: $'
msg2 db 10,13,'The following number or string is palindrome$'
msg3 db 10,13,'The following number or string is not palindrome$'
str1 db 100 dup(0)
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,msg1
    int 21h
    
    lea si,str1
    lea di,str1
    
    next:
    mov ah,1
    int 21h 
    
    cmp al,13
    je terminate
    mov [di],al
    inc di
    inc cx
    jmp next
    
    terminate:
    mov al,"$"
    mov [di],al 
    
    do:
    dec di
    mov al,[si] 
    cmp [di],al
    jne notpalindrome
    
    inc si
    cmp si,di
    jl do
    
    palindrome:
    mov ah,9
    lea dx,msg2
    int 21h
    jmp exit
    
    notpalindrome:
    mov ah,9
    lea dx,msg3
    int 21h
    
    exit: 
    mov ah,4ch
    int 21h
    main endp
end main