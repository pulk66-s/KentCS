section .text

;
; Write something into stdout
; following the C x86_64 calling convention
; Params:
;  rdi: pointer to string to write
;  rsi: length of string
;
write_stdout:
.save_registers:
    push rax
    push rdx
.write_body:
    mov rdx, rsi
    mov rsi, rdi
    mov rax, 1
    mov rdi, 1
    syscall
.restore_registers:
    pop rax
    pop rdx
    ret
