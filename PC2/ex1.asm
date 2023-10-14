section .data
    hello_world_message: db "Hello, World!", 0x0a
    hello_world_message_len: equ $ - hello_world_message

section .text
global _start

_start:
    mov rdi, hello_world_message
    mov rsi, hello_world_message_len
    call write_stdout

_end:
    mov rdi, 0
    call exit_program

%include "syscall.asm"
