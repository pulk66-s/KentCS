global _start
_start:
    call launch_tty
    ; mov rax, 1024
    ; mov rbx, 1000
    ; div rbx
    ; mov rdi, rdx
    ; mov rsi, res_buff
    ; call itoa
    ; mov rdi, res_buff
    ; mov rsi, 10
    ; call write_stdout

_end:
    xor rdi, rdi
    mov rax, 60
    syscall

%include "output.asm"
%include "input.asm"
%include "tty.asm"
%include "atoi.asm"
%include "itoa.asm"
%include "power.asm"
%include "revstr.asm"

section .data
    res_buff: times 10 db 0
