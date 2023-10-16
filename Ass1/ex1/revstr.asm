section .text

;
; This function revert a string
; Params:
;  rdi - address of string
;  rsi - length of string
;
revstr:
.save_regs:
    push rax
    push rbx
    push rcx
    push rdx
    mov rax, 0
    mov rbx, rsi
    dec rbx
.loop:
    cmp rax, rbx
    jge .restore_regs
    movzx rcx, byte [rdi + rax]
    movzx rdx, byte [rdi + rbx]
    mov byte [rdi + rax], dl
    mov byte [rdi + rbx], cl
    inc rax
    dec rbx
    jmp .loop
.restore_regs:
    pop rdx
    pop rcx
    pop rbx
    pop rax
    ret
