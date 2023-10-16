section .text

;
; This function convert a buffer stored in parameter to a number
; Parameter:
;  rdi - the buffer to convert
;  rsi - the size of the buffer
; Returns:
;  rax - the converted number
;
atoi:
.setup_regs:
    push rdi
    push rsi
    push rdx
    push rcx
    mov rax, 0
    mov rdx, 0
    mov rcx, 0

.loop:
    movzx rdx, byte [rdi + rcx]
    cmp rcx, rsi
    je .restore_regs

    sub rdx, '0'
    imul rax, rax, 10
    add rax, rdx

    inc rcx
    jmp .loop
.restore_regs:
    pop rcx
    pop rdx
    pop rsi
    pop rdi

.end:
    ret
