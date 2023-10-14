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

;
; Write something into stderr
; following the C x86_64 calling convention
; Params:
;  rdi: pointer to string to write
;  rsi: length of string
;
write_stderr:
.save_registers:
    push rax
    push rdx
.write_body:
    mov rdx, rsi
    mov rsi, rdi
    mov rax, 2
    mov rdi, 1
    syscall
.restore_registers:
    pop rax
    pop rdx
    ret

;
; End the program
; following the C x86_64 calling convention
; Params:
;  rdi: exit code
;
exit_program:
    mov rax, 60
    syscall

;
; Allocate memory with mmap
; following the C x86_64 calling convention
; Params:
;  rdi: length of memory to allocate
; Return:
;  rax: the address of the allocated memory
;
mem_alloc:
.save_registers:
    push rsi
    push r10
    push r8
    push r9
.mem_alloc_body:
    mov rsi, rdi    ; size of the memory mapping (4096 bytes)
    mov rdi, 0      ; stdin (you can use a different file descriptor)
    mov rdx, 3      ; PROT_READ | PROT_WRITE
    mov r10, 2      ; MAP_PRIVATE | MAP_ANONYMOUS
    mov r8, -1      ; file descriptor (ignored because of MAP_ANONYMOUS)
    mov r9, 0       ; offset in the file (ignored because of MAP_ANONYMOUS)
    mov rax, 9      ; syscall number for mmap
    syscall
    test rax, rax
    jz .mem_alloc_error
.restore_registers:
    pop rsi
    pop r10
    pop r8
    pop r9
    ret
.mem_alloc_error:
    mov rdi, mem_alloc_error_msg
    mov rsi, mem_alloc_error_msg_len
    call write_stdout
    mov rdi, 1
    call exit_program
    ret

section .data
    mem_alloc_error_msg: db "Error allocating memory", 0x0a
    mem_alloc_error_msg_len: equ $ - mem_alloc_error_msg
