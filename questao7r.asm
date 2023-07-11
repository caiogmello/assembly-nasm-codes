; Questão 7: Leia a idade de uma pessoa expressa em anos, meses e dias e escreva somente em dias.
; Código refatorado por Caio Gomes de Mello

global main
extern printf, scanf, calcularIdadeEmDias

section .bss
    anos resb 3 ; Maximo de 999
    meses resb 4 ; Maximo de 9.999
    dias resb 6 ; Maximo de 99.999

section .data
    anosMsg db "Quantos anos voce tem?", 10, 0
    mesesMsg db "E quantos meses?", 10, 0
    diasMsg db "E quantos dias?", 10, 0
    intformat db "%d", 0 ; Formato para poder pegar o int no scanf
    final db "Voce tem %d dias", 10, 0

section .text
main:
    push rbp
    mov rbp, rsp

    mov rdi, anosMsg
    call printf

    mov rdi, intformat
    mov rsi, anos
    call scanf

    mov rbx, [anos]

    mov rdi, mesesMsg
    call printf

    mov rdi, intformat
    mov rsi, meses
    call scanf

    mov r12, [meses]

    mov rdi, diasMsg
    call printf

    mov rdi, intformat
    mov rsi, dias
    call scanf

    mov rdi, [anos]
    mov rsi, [meses]
    mov rdx, [dias]
    call calcularIdadeEmDias

    mov rdi, final
    mov rsi, rax
    call printf

    leave
    ret