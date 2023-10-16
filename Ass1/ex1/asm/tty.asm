section .text

;
; Launch The tty
;
launch_tty:
.setup_regs:
    xor r12, r12    ; index of the buffer
    xor r13, r13    ; Index of the choice
    xor r14, r14    ; Base number
    xor r15, r15    ; Exponent number
    xor r10, r10    ; Module number

.welcome_message:
    mov rdi, welcome_message
    mov rsi, welcome_message_size
    call write_stdout

.read_message:
    cmp r13, 0
    je .ask_base_message
    cmp r13, 1
    je .ask_exponent_message
    cmp r13, 2
    je .ask_module_message
    jmp .end

.ask_module_message:
    mov rdi, asking_module_buffer
    mov rsi, asking_module_buffer_size
    call write_stdout
    jmp .read

.ask_base_message:
    mov rdi, asking_base_buffer
    mov rsi, asking_base_buffer_size
    call write_stdout
    jmp .read

.ask_exponent_message:
    mov rdi, asking_exponent_buffer
    mov rsi, asking_exponent_buffer_size
    call write_stdout

.read:
    mov rsi, char_read_buffer
    call read_stdin_char

.check_0x0A:
    cmp byte [char_read_buffer], 0x0A
    je .end_input

.add_data_to_buffer:
    movzx rax, byte [char_read_buffer]
    mov [tty_buffer + r12], rax
    inc r12
    jmp .read

.end_input:
    cmp r13, 0
    je .save_base
    cmp r13, 1
    je .save_exp
    jmp .save_module

.save_base:
    xor rbx, rbx
.save_base_loop:
    cmp rbx, r12
    je .end_save_base_loop
    movzx rax, byte [tty_buffer + rbx]
    mov [base_buffer + rbx], rax
    inc rbx
    jmp .save_base_loop
.end_save_base_loop:
    inc r13
    mov rdi, base_buffer
    mov rsi, r12
    call atoi
    mov r14, rax
    xor r12, r12
    jmp .read_message

.save_exp:
    xor rbx, rbx
.save_exp_loop:
    cmp rbx, r12
    je .end_save_exp_loop
    movzx rax, byte [tty_buffer + rbx]
    mov [exponent_buffer + rbx], rax
    inc rbx
    jmp .save_exp_loop
.end_save_exp_loop:
    inc r13
    mov rdi, exponent_buffer
    mov rsi, r12
    call atoi
    mov r15, rax
    xor r12, r12
    jmp .read_message

.save_module:
    xor rbx, rbx
.save_module_loop:
    cmp rbx, r12
    je .end_save_module_loop
    movzx rax, byte [tty_buffer + rbx]
    mov [module_buffer + rbx], rax
    inc rbx
    jmp .save_module_loop
.end_save_module_loop:
    inc r13
    mov rdi, module_buffer
    mov rsi, r12
    call atoi
    mov r10, rax
    jmp .read_message

.end:
    mov rdi, print_res_msg
    mov rsi, print_res_msg_size
    call write_stdout
    mov rdi, r14
    mov rsi, r15
    call math_power

    xor rdx, rdx
    mov rdi, rax
    mov rbx, r10
    div rbx

    mov rdi, rdx
    mov rsi, print_buffer
    call itoa
    mov rdi, print_buffer
    mov rsi, 100
    call write_stdout
    mov rdi, newline
    mov rsi, 1
    call write_stdout
    ret


section .data
    tty_buffer: times 100 db 0
    char_read_buffer: db 0

    newline: db 0x0A

    welcome_message: db "Welcome to the tty! Please enter a number", 0x0A
    welcome_message_size: equ $ - welcome_message

    base_buffer: times 100 db 0
    exponent_buffer: times 100 db 0
    module_buffer: times 100 db 0

    asking_base_buffer: db "Please enter the base: ", 0x0A
    asking_base_buffer_size: equ $ - asking_base_buffer

    asking_exponent_buffer: db "Please enter the exponent: ", 0x0A
    asking_exponent_buffer_size: equ $ - asking_exponent_buffer

    asking_module_buffer: db "Please enter the module: ", 0x0A
    asking_module_buffer_size: equ $ - asking_module_buffer

    print_buffer: times 100 db 0
    print_res_msg: db "The result is: ", 0x0A
    print_res_msg_size: equ $ - print_res_msg