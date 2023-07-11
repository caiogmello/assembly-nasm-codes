section .bss
    qtdTanque resq 1
    volumeTanque resq 1
    alturaTanque resq 1

section .data
    litrosPorLata dq 7.0
    areaPorLitro dq 5.0
    precoTinta dq 101.35
    pi dq 3.141592

    dois dq 2.0

    digiteQtd db "Digite a quantidade de tanques a serem pintados:", 10, 0
    digiteVolume db "Digite o volume dos tanques:", 10, 0
    digiteAltura db "Digite a altura dos tanques em metros:", 10, 0

    precoLatasOutput db "O valor total das latas é %.2lf reais", 10, 0
    qtdLatasOutput db "e serão necessárias %ld latas para pintar os tanques", 10, 0

    fmt db "%lf", 0

section .text
    global main
    extern printf, scanf

main:
    push rbp
    mov rbp, rsp

    ; Solicita a quantidade de tanques a serem pintados
    mov rdi, digiteQtd
    mov rax, 0
    call printf

    ; Lê a quantidade de tanques
    mov rdi, fmt
    mov rsi, qtdTanque
    xor rax, rax
    call scanf

    ; Solicita o volume dos tanques
    mov rdi, digiteVolume
    mov rax, 0
    call printf

    ; Lê o volume dos tanques
    mov rdi, fmt
    mov rsi, volumeTanque
    xor rax, rax
    call scanf

    ; Solicita a altura dos tanques
    mov rdi, digiteAltura
    mov rax, 0
    call printf

    ; Lê a altura dos tanques
    mov rdi, fmt
    mov rsi, alturaTanque
    xor rax, rax
    call scanf

    ; Calcula o raio dos tanques
    movsd xmm1, [volumeTanque]
    movsd xmm2, [alturaTanque]
    mulsd xmm2, [pi]
    divsd xmm1, xmm2
    sqrtsd xmm1, xmm1

    ; Calcula a área total dos tanques
    movsd xmm0, [pi]
    mulsd xmm0, xmm1
    mulsd xmm0, xmm1
    mulsd xmm0, [dois]
    mulsd xmm0, [alturaTanque]
    mov rsi, qtdTanque
    cvttsd2si rsi, xmm0
    imul rsi, rsi

    ; Calcula a quantidade de latas necessárias
    movsd xmm0, xmm1
    mulsd xmm0, [areaPorLitro]
    divsd xmm0, [litrosPorLata]
    roundsd xmm0, xmm0, 2
    cvttsd2si rax, xmm0

    ; Calcula o preço total das latas
    mov rsi, rax
    cvtsi2sd xmm0, rax
    mulsd xmm0, [precoTinta]

    ; Imprime o valor total das latas
    mov rdi, precoLatasOutput
    xor rax, rax
    call printf

    ; Imprime a quantidade de latas necessárias
    mov rdi, qtdLatasOutput
    xor rax, rax
    call printf

    leave
    ret
