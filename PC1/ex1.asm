section .data
    hello_world_message: db "Hello, World!", 0x0a
    hello_world_message_len: equ $ - hello_world_message

section .text
    global _start

_start:
    mov rdi, 4
    call print_ncomb

_end:
    mov rdi, rax
    call exit_program

%include "syscall.asm"
%include "bin_comb.asm"
