include 'emu8086.inc'
.model small
.stack 100h
.code
main proc
    print "Enter any number or string: "
    mov ah,1
    mov cx,0
    input:
    int 21h
    cmp al,13
    je exit
    push ax
    inc cx
    jmp input
    
    exit:
    printn ;new line
    print "output:"
    mov ah,2
    
    output:
    pop dx
    int 21h
    loop output
    
    mov ah,4ch
    int 21h
    main endp
end main