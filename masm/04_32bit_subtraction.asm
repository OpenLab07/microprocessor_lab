data segment
    msg1 db 0ah, 0dh, "Enter first number : $"
    msg2 db 0ah, 0dh, "Enter second number : $"
    msg3 db 0ah, 0dh, "Result is : $"
    n1 db 09h dup(?)
    n2 db 09h dup(?)
data ends
display   macro msg
            lea dx,msg
            mov ah,09h
            int 21h
          endm
readDigit macro 
            mov ah,01h
            int 21h
            sub al,30h
	   endm
printDigit macro
	    add dl,30h
      mov ah,02h
      int 21h
	   endm
code segment
    assume cs:code, ds:data
start:  mov ax, data
        mov ds, ax
        mov si, offset n1
        mov di, offset n2
        display msg1
        mov cx, 08h
first:  readDigit
        mov [si], al
        inc si
        dec cx
        jnz first
        display msg2
        mov cx, 08h
second: readDigit
        mov [di], al
        inc di
        dec cx
        jnz second
        clc
        mov cx, 08h
subtraction:dec di
            dec si
            mov al, [si]
            mov bl, [di]
            sbb al, bl
            mov ah, 00h
            aas
            mov [di], al
            dec cx
            jnz subtraction
            display msg3
            mov cx, 08h
print:  mov dl, [di]
        printDigit
        inc di
        dec cx
        jnz print
        mov ah, 4ch
        int 21h
code ends
end start

/*

OUTPUT
------
Enter first number : 87654321
Enter second number : 12345678
Result is : 75308643

Enter first number : 87654321
Enter second number : 22233311
Result is : 65421010

Enter first number : 88118811
Enter second number : 88118811
Result is : 00000000
*/
