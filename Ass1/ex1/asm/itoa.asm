section .text

;
; Function that converts an integer to a string
; Params:
;  rdi - the number to convert
;  rsi - the buffer to store the string
;
itoa:
.save_regs:
    push rsi
    push rdi
    push rax
    push rbx
    push r12
    xor r12, r12
    xor rax, rax
.loop:
    cmp rdi, 0
    je .loop_end
    mov rax, rdi
    mov rbx, 10
    xor rdx, rdx
    div rbx
    add rdx, '0'
    mov [rsi], dl
    inc rsi
    mov rdi, rax
    inc r12
    jmp .loop
.loop_end:
    mov rdi, rsi
    sub rdi, r12
    mov rsi, r12
    call revstr
.restore_regs:
    pop r12
    pop rbx
    pop rax
    pop rdi
    pop rsi
.end:
    ret
