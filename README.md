![](https://s3.amazonaws.com/videos.pentesteracademy.com/videos/badges/low/arm-assembly.png)

Borrar y modificar a su gusto este README, pero antes utilizar estas condiciones de entrega del trabajo.

# Utilizar los dos directorios

- code  - ahi depositar sus programas los ***archivos extensión *.s****  (Source File) algunos autores en x86 de ponen .asm y en otras plataformas ARM compatibles la extension *.elf
- Todo programa lleva su comentario en la parte de arriba, objetivo y nombre del programador minimo.
- images  - de haber algo de pantallas ahi se presentaran, su busca documentarlas en MARKDOWN el código es:

``` ![](images/---archivo.jpg---) recordar que no lleva espacios```



- Programa en MarkDown es inicia con tres tildes * (`) sin espacio, seguido de el lenguaje de programacion, al final del codigo se poner otra vez los mismos tilder..

No se usan espacios en nombres de archivos, usar los nombres estilo camelCase (primera palabra minusculas, mayuscula solo la 1ra letra de cada palabra subsecuente):  ejemplo: sensorHumo, etc.

Suerte.

Att. ![](https://img.icons8.com/color/2x/docker.png)

------

<pre>

	<p align=center>

Tecnológico Nacional de México
Instituto Tecnológico de Tijuana

Departamento de Sistemas y Computación
Ingeniería en Sistemas Computacionales

Semestre:
Agosto - Diciembre 2023

Materia:
Lenguajes de interfaz

Docente:
M.C. Rene Solis Reyes 

Unidad:
2

Título del trabajo:
Ejercicios:
- Problema 3 - Simular el desarrollo de un partido de Tenis (Nivel alto)

Estudiante:
Pompa Retana Brandon Hazael
	</p>

</pre>
<pre>
 ██████  █████  ██████  ██ ████████ ██    ██ ██       ██████      ███████     ███████      ██ ███████ ██████   ██████ ██  ██████ ██  ██████      ███████ ██████  
██      ██   ██ ██   ██ ██    ██    ██    ██ ██      ██    ██     ██          ██           ██ ██      ██   ██ ██      ██ ██      ██ ██    ██     ██           ██ 
██      ███████ ██████  ██    ██    ██    ██ ██      ██    ██     ███████     █████        ██ █████   ██████  ██      ██ ██      ██ ██    ██     ███████  █████  
██      ██   ██ ██      ██    ██    ██    ██ ██      ██    ██          ██     ██      ██   ██ ██      ██   ██ ██      ██ ██      ██ ██    ██          ██      ██ 
 ██████ ██   ██ ██      ██    ██     ██████  ███████  ██████      ███████     ███████  █████  ███████ ██   ██  ██████ ██  ██████ ██  ██████      ███████ ██████  
                                                                                                                                                                 
Problema 3 - Simular el desarrollo de un partido de Tenis (Nivel alto)
	
/**
Problema 3 - Segundosenperiodosdetiempo

Este programa simula una serie de partidos de tenis entre dos jugadores, A y B. 
El objetivo es calcular la probabilidad de que el jugador A gane el partido en función de su probabilidad de ganar un punto.

Author:    Only Pompa
Fecha:      25/10/2023
*/

//PROGRAMA EN C
	
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define NUM_MATCHES 10

// Función para jugar un punto - jugar_punto(double p): Esta función simula un punto jugado entre los dos jugadores. 
//La probabilidad de que el jugador A gane el punto es p. La función devuelve 1 si el jugador A gana el punto, y 0 en caso contrario.
int jugar_punto(double p) {
    return rand() < p * RAND_MAX;
}

// Función para jugar un juego - jugar_juego(double p): Esta función simula un juego completo de tenis. Un juego se gana al ganar 4 puntos. La función utiliza la función jugar_punto para simular cada punto y cuenta el número de puntos ganados por cada jugador.
// La función devuelve 1 si el jugador A gana el juego, y 0 en caso contrario.
int jugar_juego(double p) {
    int puntos_A = 0;
    int puntos_B = 0;
    while(puntos_A < 4 && puntos_B < 4) {
        if(jugar_punto(p)) {
            puntos_A++;
        } else {
            puntos_B++;
        }
    }
    return puntos_A == 4;
}

// Función para jugar un set - jugar_set(double p): Esta función simula un set completo de tenis. Un set se gana al ganar 6 juegos. La función utiliza la función jugar_juego para simular cada juego y cuenta el número de juegos ganados por cada jugador. 
// La función devuelve 1 si el jugador A gana el set, y 0 en caso contrario.
int jugar_set(double p) {
    int juegos_A = 0;
    int juegos_B = 0;
    while(juegos_A < 6 && juegos_B < 6) {
        if(jugar_juego(p)) {
            juegos_A++;
        } else {
            juegos_B++;
        }
    }
    return juegos_A == 6;
}

// Función principal - main(): Esta es la función principal del programa. Simula una serie de partidos de tenis utilizando la función jugar_set. Para cada partido, calcula la probabilidad de que el jugador A gane un punto (que varía de 0 a 1 en incrementos de 0.1) y luego simula 1000 partidos con esa probabilidad. 
// Después de simular los partidos, calcula la proporción de partidos ganados por el jugador A y la imprime.
int main() {
    srand(time(NULL));
    for(int i = 0; i < NUM_MATCHES; i++) {
        double p = (double)i / NUM_MATCHES;
        int victorias_A = 0;
        for(int j = 0; j < 1000; j++) {
            if(jugar_set(p)) {
                victorias_A++;
            }
        }
        printf("Probabilidad de ganar un punto: %.2f, Probabilidad de ganar el partido: %.2f\n", p, (double)victorias_A / 1000);
    }
    return 0;
}

//PROGRAMA EN C
/**
Problema 3 - Segundosenperiodosdetiempo

Este programa simula una serie de partidos de tenis entre dos jugadores, A y B. 
El objetivo es calcular la probabilidad de que el jugador A gane el partido en función de su probabilidad de ganar un punto.

Author:    Only Pompa
Fecha:      25/10/2023
*/
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

