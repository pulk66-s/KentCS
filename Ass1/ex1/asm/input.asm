section .text

;
; This function read a char from stdin
; and return it in rax register
; Params
;  rsi: The buffer to store the char
;
read_stdin_char:
.save_registers:
    push rdi
    push rdx
.body:
    xor rdi, rdi
    mov rdx, 1
    xor rax, rax
    syscall
.restore_registers:
    pop rdx
    pop rdi
    ret
