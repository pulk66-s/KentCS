section .text

;
; This function calculate the power of two numbers stored in registers
; Params:
;   rdi - base
;   rsi - exponent
; Returns:
;   rax - result
;
math_power:
.save_regs:
    push rbx
.setup_regs:
    mov rax, 1
    mov rbx, rsi
.loop:
    cmp rbx, 0
    je .restore_regs
    imul rax, rdi
    dec rbx
    jmp .loop
.restore_regs:
    pop rbx
.end:
    ret
