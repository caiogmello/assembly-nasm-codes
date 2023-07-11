section .data
    msg1 db "Digite a temperatura em Fahrenheit: ", 0
    msg2 db "A temperatura em Celsius é: %d", 10, 0

section .bss
    temperatura resd 1

section .text
    global main
    extern printf, scanf

main:
    ; Imprime a mensagem solicitando a temperatura em Fahrenheit
    mov rdi, msg1
    mov rax, 0
    call printf

    ; Lê a entrada do usuário e armazena em temperatura
    mov rdi, "%d"
    mov rsi, temperatura
    mov rax, 0
    call scanf

    ; Carrega o valor lido em eax e converte para Celsius
    mov eax, [temperatura]
    sub eax, 32
    imul eax, 5
    mov edx, 9
    idiv edx

    ; Imprime a mensagem com o valor em Celsius
    mov rdi, msg2
    mov rsi, rax
    mov rax, 0
    call printf

    ; Encerra o programa
    mov eax, 0
    ret
