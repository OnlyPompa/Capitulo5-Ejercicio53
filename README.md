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

                                                    ,----,               ,--,                                ,----,.                                                                                                                           ,----,.                
                          ,-.----.                 ,/   .`|            ,---.'|       ,----..                ,'   ,' |                           ,---._                                                                 ,----..                ,'   ,' |  .--,-``-.     
  ,----..     ,---,       \    /  \     ,---,    ,`   .'  :            |   | :      /   /   \             ,'   .'   |            ,---,.       .-- -.' \     ,---,.,-.----.     ,----..     ,---,  ,----..     ,---,   /   /   \             ,'   .'   | /   /     '.   
 /   /   \   '  .' \      |   :    \ ,`--.' |  ;    ;     /       ,--, :   : |     /   .     :          ,----.'    .'          ,'  .' |       |    |   :  ,'  .' |\    /  \   /   /   \ ,`--.' | /   /   \ ,`--.' |  /   .     :          ,----.'    .'/ ../        ;  
|   :     : /  ;    '.    |   |  .\ :|   :  :.'___,/    ,'      ,'_ /| |   ' :    .   /   ;.  \         |    |   .'          ,---.'   |       :    ;   |,---.'   |;   :    \ |   :     :|   :  :|   :     :|   :  : .   /   ;.  \         |    |   .'  \ ``\  .`-    ' 
.   |  ;. /:  :       \   .   :  |: |:   |  '|    :     |  .--. |  | : ;   ; '   .   ;   /  ` ;         :    :  |--,         |   |   .'       :        ||   |   .'|   | .\ : .   |  ;. /:   |  '.   |  ;. /:   |  '.   ;   /  ` ;         :    :  |--,  \___\/   \   : 
.   ; /--` :  |   /\   \  |   |   \ :|   :  |;    |.';  ;,'_ /| :  . | '   | |__ ;   |  ; \ ; |         :    |  ;.' \        :   :  |-,       |    :   ::   :  |-,.   : |: | .   ; /--` |   :  |.   ; /--` |   :  |;   |  ; \ ; |         :    |  ;.' \      \   :   | 
;   | ;    |  :  ' ;.   : |   : .   /'   '  ;`----'  |  ||  ' | |  . . |   | :.'||   :  | ; | '         |    |      |        :   |  ;/|       :         :   |  ;/||   |  \ : ;   | ;    '   '  ;;   | ;    '   '  ;|   :  | ; | '         |    |      |      /  /   /  
|   : |    |  |  ;/  \   \;   | |`-' |   |  |    '   :  ;|  | ' |  | | '   :    ;.   |  ' ' ' :         `----'.'\   ;        |   :   .'       |    ;   ||   :   .'|   : .  / |   : |    |   |  ||   : |    |   |  |.   |  ' ' ' :         `----'.'\   ;      \  \   \  
.   | '___ '  :  | \  \ ,'|   | ;    '   :  ;    |   |  ':  | | :  ' ; |   |  ./ '   ;  \; /  |           __  \  .  |        |   |  |-,   ___ l         |   |  |-,;   | |  \ .   | '___ '   :  ;.   | '___ '   :  ;'   ;  \; /  |           __  \  .  |  ___ /   :   | 
'   ; : .'||  |  '  '--'  :   ' |    |   |  '    '   :  ||  ; ' |  | ' ;   : ;    \   \  ',  /          /   /\/  /  :        '   :  ;/| /    /\    J   :'   :  ;/||   | ;\  \'   ; : .'||   |  ''   ; : .'||   |  ' \   \  ',  /          /   /\/  /  : /   /\   /   : 
'   | '/  :|  :  :        :   : :    '   :  |    ;   |.' :  | : ;  ; | |   ,/      ;   :    /          / ,,/  ',-   .        |   |    \/  ../  `..-    ,|   |    \:   ' | \.''   | '/  :'   :  |'   | '/  :'   :  |  ;   :    /          / ,,/  ',-   ./ ,,/  ',-    . 
|   :    / |  | ,'        |   | :    ;   |.'     '---'   '  :  `--'   \'---'        \   \ .'           \ ''\       ;         |   :   .'\    \         ; |   :   .':   : :-'  |   :    / ;   |.' |   :    / ;   |.'    \   \ .'           \ ''\       ; \ ''\        ;  
 \   \ .'  `--''          `---'.|    '---'               :  ,      .-./              `---`              \   \    .'          |   | ,'   \    \      ,'  |   | ,'  |   |.'     \   \ .'  '---'    \   \ .'  '---'       `---`              \   \    .'   \   \     .'   
  `---`                     `---`                         `--`----'                                      `--`-,-'            `----'      "---....--'    `----'    `---'        `---`              `---`                                    `--`-,-'      `--`-,,-'     
                                                                                                                                                                                                                                                                       


 
<pre>
Problema 3 - Simular el desarrollo de un partido de Tenis (Nivel alto)
		<details>
			<summary>Código en C</summary>
/**
Problema 3 - Segundosenperiodosdetiempo

Este programa simula una serie de partidos de tenis entre dos jugadores, A y B. 
El objetivo es calcular la probabilidad de que el jugador A gane el partido en función de su probabilidad de ganar un punto.

Author:    Only Pompa
Fecha:      25/10/2023
*/

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

		</details>
		<details>
			<summary>Código en Ensamblador</summary>
/**
Problema 3 - Simular el desarrollo de un partido de Tenis (Nivel alto)

Este programa simula una serie de partidos de tenis entre dos jugadores, A y B. 
El objetivo es calcular la probabilidad de que el jugador A gane el partido en función de su probabilidad de ganar un punto.

Author:    Only Pompa
Fecha:      16/10/2023
*/
.section	.rodata
.LC0:
	.string	"Probabilidad de ganar un punto: %.2f, Probabilidad de ganar el partido: %.2f\n"

.section	.text
.globl main
main:
		pushq	%rbp
		movq	%rsp, %rbp
		subq	$16, %rsp
		xorl	%eax, %eax
		call srand
		movl	$0, -4(%rbp)

.L2:
		cmpl	$9, -4(%rbp)
		jg	.L1

		movl	-4(%rbp), %eax
		cltd
		idivl	$10, %eax
		movl	%edx, %eax
		movl	%eax, %ecx

		movl	$0, %eax
		pxor	%xmm1, %xmm1
		movsd	%xmm1, -16(%rbp)

.L4:
		cmpq	$999, %rax
		jg	.L3

		movq	%rax, %rdi
		call jugar_set
		testb	%al, %al
		je	.L6

		movl	-4(%rbp), %eax
		cltd
		idivl	$10, %eax
		movl	%edx, %eax
		movl	%eax, %ecx
		movq	-16(%rbp), %xmm0
		addsd	%xmm0, %xmm1

.L6:
		addq	$1, %rax
		jmp	.L4

.L3:
		movl	$LC0, %edi
		movl	$1, %eax
		movsd	%xmm1, %xmm0
		call printf
		addl	$1, -4(%rbp)
		jmp	.L2

.L1:
		movl	$0, %eax
		leave
		ret

		</details>
</details>
