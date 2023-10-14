section .text

;
; Print all the combinations of the binary numbers from 0 to (2^n)-1
; where n is the number of bits in the binary number.
; Params:
;  rdi - number of bits in the binary number
print_ncomb:
.save_registers:
    push r12
    push rbx
    push rcx
.print_ncomb_start:
    mov r12, rdi        ; save rdi
    call calc_ncomb
    mov rbx, rax
    mov rcx, 0
.print_ncomb_loop:
    cmp rbx, 0
    je .restore_registers

    push rcx
    mov rdi, rcx
    mov rsi, r12
    call print_bin_nb
    pop rcx

    dec rbx
    inc rcx
    jmp .print_ncomb_loop
.restore_registers:
    pop rcx
    pop rbx
    pop r12
    ret

;
; Calculate the nb of positions in the binary number
; Params:
;  rdi - number of bits in the binary number
; Return:
;  rax - number of positions in the binary number
;
calc_ncomb:
    push rdi
    mov rax, 1
.calc_ncomb_loop:
    cmp rdi, 0
    je .calc_ncomb_end
    dec rdi
    shl rax, 1
    jmp .calc_ncomb_loop
.calc_ncomb_end:
    pop rdi
    ret

;
; Create a mask to determine the value of the bit at a certain position
; Params:
;  rdi - position of the bit
; Return:
;  rax - mask
;
create_mask:
    push rdi
    mov rax, 1
    dec rdi
.create_mask_loop:
    cmp rdi, 0
    je .create_mask_end
    dec rdi
    shl rax, 1
    jmp .create_mask_loop
.create_mask_end:
    pop rdi
    ret

;
; Print the binary representation of the number passed as param
; Params:
;  rdi - number to print
;  rsi - number of bits in the binary number
;
print_bin_nb:
.save_registers:
    push r12
    push r13
    push rdi
    push rsi
.print_bin_init:
    push rdi
    mov rdi, rsi
    call create_mask
    mov r12, rax
    pop rdi
.print_bin_body:
    cmp rsi, 0
    je .print_bin_nb_end
    mov r13, rdi
    and r13, r12

    push rdi
    push rsi
    cmp r13, 0
    je .print_bin_zero
    jmp .print_bin_one

.print_bin_zero:
    mov rdi, zero_value
    mov rsi, 1
    call write_stdout
    jmp .print_bin_end
.print_bin_one:
    mov rdi, one_value
    mov rsi, 1
    call write_stdout
.print_bin_end:
    pop rsi
    pop rdi

    dec rsi
    shl rdi, 1
    jmp .print_bin_body
.print_bin_nb_end:
    mov rdi, nl_value
    mov rsi, 1
    call write_stdout
.restore_registers:
    pop rsi
    pop rdi
    pop r13
    pop r12
    ret

section .data
    zero_value: db '0', 0
    one_value: db '1', 0
    nl_value: db 10, 0
