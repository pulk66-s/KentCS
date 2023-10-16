global _start
_start:
    call launch_tty

_end:
    mov rdi, 0
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
