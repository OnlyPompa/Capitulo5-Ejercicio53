.arch armv6
.eabi_attribute 28, 1
.eabi_attribute 20, 1
.eabi_attribute 21, 1
.eabi_attribute 23, 3
.eabi_attribute 24, 1
.eabi_attribute 25, 1
.eabi_attribute 26, 2
.eabi_attribute 30, 6
.eabi_attribute 34, 1
.eabi_attribute 18, 4
.file "tennis_simulation.s"
.text
.align 2

.global jugar_punto
.arch armv6
.syntax unified
.arm
.fpu vfp
.type jugar_punto, %function
jugar_punto:
    @ args = 1, pretend = 0, frame = 16
    @ frame_needed = 1, uses_anonymous_args = 0
    push {fp, lr}
    add fp, sp, #4

    @ Cargar el valor del punto desde la pila
    vldr.d8 d0, [fp, #8]

    @ Llamar a la función rand para obtener un valor aleatorio
    bl rand

    @ Mover el resultado de rand a un registro de punto flotante
    vmov s15, r0 @ int

    @ Convertir el valor aleatorio a punto flotante
    vcvt.f64.s32 d6, s15

    @ Comparar el valor aleatorio con la probabilidad de ganar el punto
    vcmpe.f64 d6, d0

    @ Almacenar el resultado de la comparación en el registro APSR_nzcv
    vmrs APSR_nzcv, FPSCR

    @ Comprobar si el jugador A ganó el punto
    moveq r0, #1
    movne r0, #0
    uxtb r0, r0

    @ Restaurar el marco de pila
    sub sp, fp, #4
    @ sp needed
    pop {fp, pc}

.align 2
.global jugar_juego
.syntax unified
.arm
.fpu vfp
.type jugar_juego, %function
jugar_juego:
    @ args = 1, pretend = 0, frame = 32
    @ frame_needed = 1, uses_anonymous_args = 0
    push {fp, lr}
    add fp, sp, #4

    @ Cargar la probabilidad desde la pila
    vldr.d8 d0, [fp, #8]

    @ Inicializar contadores de puntos para ambos jugadores
    mov r4, #0
    mov r5, #0

.L3:
    @ Inicializar el contador de puntos en un juego
    mov r6, #4

.L4:
    @ Llamar a la función jugar_punto con la probabilidad de ganar el punto
    vldr.d8 d1, [fp, #8]
    bl jugar_punto

    @ Comprobar si el jugador A ganó el punto
    cmp r0, #0

    @ Si el jugador A ganó el punto, aumentar su contador de puntos
    beq .L2
    add r4, r4, #1
    b .L5

.L2:
    @ Si el jugador A no ganó el punto, aumentar el contador de puntos del jugador B

.L5:
    add r5, r5, #1

    @ Decrementar el contador de puntos restantes en el juego
    subs r6, r6, #1
    bne .L4

    @ Comprobar si el jugador A ganó el juego
    cmp r4, #4

    @ Si el jugador A ganó el juego, devolver 1
    moveq r0, #1

    @ Si el jugador A no ganó el juego, devolver 0
    movne r0, #0
    uxtb r0, r0

    @ Restaurar el marco de pila
    sub sp, fp, #4
    @ sp needed
    pop {fp, pc}

.align 2
.global jugar_set
.syntax unified
.arm
.fpu vfp
.type jugar_set, %function
jugar_set:
    @ args = 1, pretend = 0, frame = 48
    @ frame_needed = 1, uses_anonymous_args = 0
    push {fp, lr}
    add fp, sp, #4

    @ Cargar la probabilidad desde la pila
    vldr.d8 d0, [fp, #8]

    @ Inicializar contadores de juegos para ambos jugadores
    mov r4, #0
    mov r5, #0

.L6:
    @ Inicializar el contador de juegos en un set
    mov r6, #6

.L7:
    @ Llamar a la función jugar_juego con la probabilidad de ganar el juego
    vldr.d8 d1, [fp, #8]
    bl jugar_juego

    @ Comprobar si el jugador A ganó el juego
    cmp r0, #0

    @ Si el jugador A ganó el juego, aumentar su contador de juegos
    beq .L1
    add r4, r4, #1
    b .L8

.L1:
    @ Si el jugador A no ganó el juego, aumentar el contador de juegos del jugador B

.L8:
    add r5, r5, #1

    @ Decrementar el contador de juegos restantes en el set
    subs r6, r6, #1
    bne .L7

    @ Comprobar si el jugador A ganó el set
    cmp r4, #6

    @ Si el jugador A ganó el set, devolver 1
    moveq r0, #1

    @ Si el jugador A no ganó el set, devolver 0
    movne r0, #0
    uxtb r0, r0

    @ Restaurar el marco de pila
    sub sp, fp, #4
    @ sp needed
    pop {fp, pc}

.section .rodata
.align 2
.LC0:
    .ascii "Probabilidad de ganar un punto: %.2f, Probabilidad de ganar el partido: %.2f\012\000"

.text
.align 2
.global main
.syntax unified
.arm
.fpu vfp
.type main, %function
main:
    @ args = 0, pretend = 0, frame = 32
    @ frame_needed = 1, uses_anonymous_args = 0
    push {fp, lr}
    add fp, sp, #4
    sub sp, sp, #32

    @ Inicializar la semilla para la función rand
    bl srand

    @ Inicializar un bucle para NUM_MATCHES partidos
    mov r0, #0

.L12:
    @ Cargar el valor de i como un número en punto flotante y dividirlo por NUM_MATCHES
    ldr r3, [fp, #-16]
    ldr r4, [fp, #-16]
    bl __aeabi_dadd

    @ Convertir el valor resultante en punto flotante a la probabilidad de ganar un punto
    vmov s15, r0 @ int
    vcvt.f64.s32 d0, s15

    @ Inicializar el contador de victorias para el jugador A
    mov r4, #0

    @ Inicializar un bucle para simular 1000 partidos
    mov r0, #0

.L14:
    @ Llamar a la función jugar_set con la probabilidad de ganar el punto
    vldr.d8 d0, [fp, #-16]
    bl jugar_set

    @ Comprobar si el jugador A ganó el partido
    cmp r0, #0

    @ Si el jugador A ganó el partido, aumentar el contador de victorias
    beq .L15
    add r4, r4, #1
    b .L16

.L15:
    @ Si el jugador A no ganó el partido, continuar

.L16:
    @ Decrementar el contador de partidos restantes
    subs r0, r0, #1

    @ Comprobar si se han simulado 1000 partidos
    cmp r0, #1000
    blt .L14

    @ Calcular la proporción de partidos ganados por el jugador A
    ldr r8, [fp, #-16]
    mov r9, #1000
    sub r9, r4, r8

    @ Imprimir la probabilidad de ganar un punto y la probabilidad de ganar el partido
    vldr.d8 d1, [fp, #-16]
    bl printf

    @ Incrementar el contador i y repetir el bucle para el siguiente valor de i
    ldr r10, [fp, #-16]
    add r10, r10, #1
    str r10, [fp, #-16]
    b .L12

@ Fin del programa
