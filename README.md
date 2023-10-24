[![Open in Codespaces](https://classroom.github.com/assets/launch-codespace-7f7980b617ed060a017424585567c406b6ee15c891e84e1186181d67ecf80aa0.svg)](https://classroom.github.com/open-in-codespaces?assignment_repo_id=12415607)
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
- Problema 1 - Botes de Colores (Nivel Bajo)
- Problema 2 - Pesos del Equipo Escolar (Nivel Intermedio)
- Problema 3 - Simular el desarrollo de un partido de Tenis (Nivel alto)
- Problema 4 - Campo Semicircular (Bonus)
- Problema 5 - Entero Positivo N (Bonus)


Estudiante:
Pompa Retana Brandon Hazael

	</p>

</pre>

<pre>
<details>
	<summary>Problema 1 - Botes de Colores</summary>
		<details>
			<summary>Código en C</summary>
/**
Problema 1 - Botes de Colores

El objetivo del programa es calcular el número total de combinaciones posibles de botes, 
dadas ciertas características. Las características son: color, modelo, máquina y opciones adicionales.


Author:    Only Pompa
Fecha:      16/10/2023
*/

#include <stdio.h>

int main() {
    int colores = 12;
    int modelos = 5;
    int maquinas = 7;
    int opciones = 8;

    int total = colores * modelos * maquinas * opciones;

    printf("El número total de botes diferentes disponibles es: %d\n", total);

    return 0;
}
		</details>
		<details>
			<summary>Código en Ensamblador</summary>
/**
Problema 1 - Botes de Colores

El objetivo del programa es calcular el número total de combinaciones posibles de botes, 
dadas ciertas características. Las características son: color, modelo, máquina y opciones adicionales.


Author:    Only Pompa
Fecha:      16/10/2023
*/
.file	"Botesdecolores.c" // Define el nombre del archivo fuente.

.text // Sección de código.

.section	.rodata // Sección de datos de solo lectura.
.align 8 // Alinea los datos en un límite de 8 bytes.
.LC0:
	.string	"El n\303\272mero total de botes diferentes disponibles es: %d\n" // Define una cadena constante.

.text // Vuelve a la sección de código.
.globl	main // Hace que la función main sea visible para el vinculador.
.type	main, @function // Define el tipo de símbolo de main como función.

main: // Comienza la definición de la función main.
.LFB0:
	.cfi_startproc // Inicia una secuencia de instrucciones CFI (Call Frame Information).
	endbr64 // Instrucción de protección contra ataques ROP y JOP.
	pushq	%rbp // Guarda el valor actual del puntero base en la pila.
	.cfi_def_cfa_offset 16 // Actualiza el offset para el registro CFA (Canonical Frame Address).
	.cfi_offset 6, -16 // Registra el hecho de que el valor original del registro rbp se guarda en la pila.
	movq	%rsp, %rbp // Establece el nuevo puntero base como el valor actual del puntero de pila.
	.cfi_def_cfa_register 6 // Establece rbp como el registro CFA.

	subq	$32, %rsp // Reserva espacio en la pila para las variables locales.

	movl	$12, -20(%rbp) // Asigna 12 a la primera variable local.
	movl	$5, -16(%rbp) // Asigna 5 a la segunda variable local.
	movl	$7, -12(%rbp) // Asigna 7 a la tercera variable local.
	movl	$8, -8(%rbp) // Asigna 8 a la cuarta variable local.

	movl	-20(%rbp), %eax // Carga el valor de la primera variable local en eax.
	imull	-16(%rbp), %eax // Multiplica eax por el valor de la segunda variable local y guarda el resultado en eax.
	imull	-12(%rbp), %eax // Multiplica eax por el valor de la tercera variable local y guarda el resultado en eax.

	movl	-8(%rbp), %edx // Carga el valor de la cuarta variable local en edx.
	imull	%edx, %eax // Multiplica eax por edx y guarda el resultado en eax.

	movl	%eax, -4(%rbp) // Guarda el resultado final en una nueva variable local.

	movl	-4(%rbp), %eax // Carga el resultado final en eax para su uso como argumento en printf.
	movl	%eax, %esi 
	leaq	.LC0(%rip), %rdi // Carga la dirección de la cadena constante en rdi para su uso como argumento en printf.

	movl	$0, %eax 
	call	printf@PLT // Llama a printf con los argumentos preparados.

	movl	$0, %eax 
	leave
	ret
	.cfi_endproc // Finaliza la secuencia de instrucciones CFI.
.LFE0:
	.size	main, .-main // Define el tamaño del símbolo main.

	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.2) 9.4.0" // Identifica la versión del compilador.

	.section	.note.GNU-stack,"",@progbits // Sección de pila de GNU.
	.section	.note.gnu.property,"a" // Sección de propiedades de GNU.
	.align 8 // Alinea los datos en un límite de 8 bytes.
	.long	 1f - 0f // Calcula la longitud de la cadena "GNU".
	.long	 4f - 1f // Calcula la longitud de las propiedades.
	.long	 5 // Identifica el tipo de nota como NT_GNU_PROPERTY_TYPE_0.
0:
	.string	 "GNU" // Cadena "GNU".
1:
	.align 8
	.long	 0xc0000002 // Identifica el tipo de propiedad como GNU_PROPERTY_X86_FEATURE_1_AND.
	.long	 3f - 2f // Calcula la longitud del valor de la propiedad.
2:
	.long	 0x3 // Valor de la propiedad (indicando que se requiere soporte para CX8 y CMPXCHG16B).
3:
	.align 8
4:

		</details>
</details>
<details>
	<summary>Problema 2 - Pesos del Equipo Escolar (Nivel Intermedio) </summary>
		<details>
			<summary>Código en C</summary>
/**
Problema 2 - PesosEquipoEscolar (Nivel Intermedio)

El objetivo del programa es convertir los pesos de los miembros 
de un equipo de fútbol escolar de libras a kilogramos.

Author:    Only Pompa
Fecha:      16/10/2023
*/

#include <stdio.h>

#define LIBRAS_A_KILOGRAMOS 0.45359237

void convertir_a_kilogramos(float libras) {
    float kilogramos = libras * LIBRAS_A_KILOGRAMOS;
    printf("%.2f libras son %.2f kilogramos\n", libras, kilogramos);
}

int main() {
    float pesos_equipo[] = {150.0, 160.0, 155.0, 175.0, 145.0};  // Ejemplo de pesos en libras
    int tamano_equipo = sizeof(pesos_equipo) / sizeof(pesos_equipo[0]);

    for (int i = 0; i < tamano_equipo; i++) {
        convertir_a_kilogramos(pesos_equipo[i]);
    }

    return 0;
}

		</details>
		<details>
			<summary>Código en Ensamblador</summary>
/**
Problema 2 - PesosEquipoEscolar (Nivel Intermedio)

El objetivo del programa es convertir los pesos de los miembros 
de un equipo de fútbol escolar de libras a kilogramos.

Author:    Only Pompa
Fecha:      16/10/2023
*/

.file "PesosEquipoEscolar.c"        # Nombre del archivo fuente

.section .rodata                   # Sección de datos de solo lectura
.align 8                           # Alineación de 8 bytes
.LC1:                               # Etiqueta .LC1
	.string "%.2f libras son %.2f kilogramos\n"
	# Cadena de formato para imprimir la conversión

.text                              # Sección de código

.globl convertir_a_kilogramos       # Declaración de la función global
.type convertir_a_kilogramos, @function  # Especificación del tipo de función

convertir_a_kilogramos:             # Definición de la función convertir_a_kilogramos
.LFB0:                             # Etiqueta .LFB0
	.cfi_startproc                   # Inicio del procedimiento
	endbr64                          # Directiva de seguridad

	pushq %rbp                        # Guardar el valor de %rbp en la pila
	.cfi_def_cfa_offset 16            # Definir el desplazamiento de la pila
	.cfi_offset 6, -16                # Definir el desplazamiento de %rbp
	movq %rsp, %rbp                   # Establecer %rsp como %rbp
	.cfi_def_cfa_register 6           # Registrar %rbp como el marco actual

	subq $32, %rsp                    # Reservar espacio en la pila

	movss %xmm0, -20(%rbp)            # Mover el valor de %xmm0 a la pila
	cvtss2sd -20(%rbp), %xmm1         # Convertir de precisión simple a doble
	movsd .LC0(%rip), %xmm0           # Cargar el valor de .LC0 en %xmm0
	mulsd %xmm1, %xmm0                # Multiplicar %xmm0 por %xmm1
	cvtsd2ss %xmm0, %xmm0             # Convertir de doble a precisión simple
	movss %xmm0, -4(%rbp)             # Almacenar el resultado en la pila
	cvtss2sd -4(%rbp), %xmm1          # Convertir de precisión simple a doble
	cvtss2sd -20(%rbp), %xmm0         # Convertir de precisión simple a doble
	leaq .LC1(%rip), %rdi             # Cargar la dirección de la cadena de formato en %rdi
	movl $2, %eax                     # Cargar 2 en %eax (dos argumentos en printf)
	call printf@PLT                   # Llamar a la función printf
	nop

	leave                             # Deshacer la pila
	.cfi_def_cfa 7, 8                 # Definir el nuevo marco
	ret                               # Retornar
	.cfi_endproc                      # Final del procedimiento

.LFE0:                              # Etiqueta .LFE0
	.size convertir_a_kilogramos, .-convertir_a_kilogramos

.globl main                        # Declaración de la función global
.type main, @function               # Especificación del tipo de función

main:                              # Definición de la función main
.LFB1:                             # Etiqueta .LFB1
	.cfi_startproc                   # Inicio del procedimiento
	endbr64                          # Directiva de seguridad

	pushq %rbp                        # Guardar el valor de %rbp en la pila
	.cfi_def_cfa_offset 16            # Definir el desplazamiento de la pila
	.cfi_offset 6, -16                # Definir el desplazamiento de %rbp
	movq %rsp, %rbp                   # Establecer %rsp como %rbp
	.cfi_def_cfa_register 6           # Registrar %rbp como el marco actual

	subq $48, %rsp                    # Reservar espacio en la pila

	movq %fs:40, %rax                 # Verificar seguridad de pila
	movq %rax, -8(%rbp)
	xorl %eax, %eax                   # Establecer %eax a 0

	movss .LC2(%rip), %xmm0           # Cargar un valor de libras en %xmm0
	movss %xmm0, -32(%rbp)            # Almacenar en la pila
	movss .LC3(%rip), %xmm0           # Cargar otro valor de libras en %xmm0
	movss %xmm0, -28(%rbp)            # Almacenar en la pila
	movss .LC4(%rip), %xmm0           # Cargar otro valor de libras en %xmm0
	movss %xmm0, -24(%rbp)            # Almacenar en la pila
	movss .LC5(%rip), %xmm0           # Cargar otro valor de libras en %xmm0
	movss %xmm0, -20(%rbp)            # Almacenar en la pila
	movss .LC6(%rip), %xmm0           # Cargar otro valor de libras en %xmm0
	movss %xmm0, -16(%rbp)            # Almacenar en la pila

	movl $5, -36(%rbp)                # Inicializar contador a 5
	movl $0, -40(%rbp)                # Inicializar un índice a 0

	jmp .L3                            # Saltar a .L3
.L4:
	movl -40(%rbp), %eax              # Cargar el índice en %eax
	cltq                             # Extender el índice a 8 bytes
	movl -32(%rbp,%rax,4), %eax      # Cargar un valor de libras desde una tabla
	movd %eax, %xmm0                  # Mover el valor a %xmm0
	call convertir_a_kilogramos       # Llamar a la función convertir_a_kilogramos
	addl $1, -40(%rbp)                # Incrementar el índice
.L3:
	movl -40(%rbp), %eax              # Cargar el índice en %eax
	cmpl -36(%rbp), %eax             # Comparar con 5 (límite)
	jl .L4                            # Saltar a .L4 si es menor
	movl $0, %eax                      # Cargar 0 en %eax
	movq -8(%rbp), %rdx               # Cargar el valor de seguridad de pila
	xorq %fs:40, %rdx
	je .L6                             # Saltar a .L6 si no hay error de seguridad
	call __stack_chk_fail@PLT          # Llamar a la función __stack_chk_fail
.L6:
	leave                             # Deshacer la pila
	.cfi_def_cfa 7, 8                 # Definir el nuevo marco
	ret                               # Retornar
	.cfi_endproc                      # Final del procedimiento

.LFE1:                              # Etiqueta .LFE1
	.size main, .-main               # Tamaño de la función main

.section .rodata                   # Sección de datos de solo lectura
.align 8                           # Alineación de 8 bytes
.LC0:
	.long 1253531217                 # Representación en punto flotante
	.long 1071450024
	.align 4
.LC2:
	.long 1125515264                 # Representación en punto flotante
	.align 4
.LC3:
	.long 1126170624                 # Representación en punto flotante
	.align 4
.LC4:
	.long 1125842944                 # Representación en punto flotante
	.align 4
.LC5:
	.long 1127153664                 # Representación en punto flotante
	.align 4
.LC6:
	.long 1125187584                 # Representación en punto flotante
	.ident "GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.2) 9.4.0"
	.section .note.GNU-stack,"",@progbits
	.section .note.gnu.property,"a"
	.align 8
	.long 1f - 0f
	.long 4f - 1f
	.long 5
0:
	.string "GNU"
1:
	.align 8
	.long 0xc0000002
	.long 3f - 2f
2:
	.long 0x3
3:
	.align 8
4:

		</details>
<details>
			<summary>Archivo makefile</summary>
/**
Problema 2 - PesosEquipoEscolar (Nivel Intermedio)

El objetivo del programa es convertir los pesos de los miembros 
de un equipo de fútbol escolar de libras a kilogramos.

Author:    Only Pompa
Fecha:      16/10/2023
*/
# Define el archivo fuente en ensamblador
SRC = pesoequipo.s

# Define el nombre del archivo de salida
OUT = pesoequipo

# Define el ensamblador y las banderas
AS = as
ASFLAGS = -g

# Define el enlazador y las banderas
LD = ld
LDFLAGS =

# Define el GCC o G++ segun corresponda
GCC = gcc
GCCFLAGS =  -g

# Corrida de make
all: $(OUT)

$(OUT): $(SRC)
	$(AS) $(ASFLAGS) $(SRC) -o $(OUT).o
	$(GCC) $(LDFLAGS) $(OUT).o -o $(OUT)
# Borra temporales y ejecutable
clean:
	rm -f $(OUT) $(OUT).o
# Corrida
run: $(OUT)
	./$(OUT)
# Entrar al Debugger
gef: $(OUT)
	gdb  $(OUT)

		</details>
</details>
<details>
	<summary>Problema 3 - Simular el desarrollo de un partido de Tenis (Nivel alto)</summary>
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

// Función para jugar un punto
int jugar_punto(double p) {
    return rand() < p * RAND_MAX;
}

// Función para jugar un juego
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

// Función para jugar un set
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

// Función principal
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
Problema 3 - Segundosenperiodosdetiempo

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
<details>
	<summary>Problema 4 - Campo Semicircular (Bonus)</summary>
		<details>
			<summary>Código en C</summary>
/**
Problema 4 - CampoSemicircular

El objetivo del programa es determinar el área del campo semicircular de 61 m de diámetro 
para un granjero que planta sus cacahuates.

Author:    Only Pompa
Fecha:      16/10/2023
*/

#include <stdio.h>
#include <math.h>

#define M_PI		3.1416

int main() {
    double diametro = 61.0;
    double radio = diametro / 2.0;
    double area = M_PI * pow(radio, 2) / 2.0;

    printf("El área del campo semicircular es: %.2f metros cuadrados\n", area);

    return 0;
}
		</details>
		<details>
			<summary>Código en Ensamblador</summary>
/**
Problema 4 - CampoSemicircular

El objetivo del programa es determinar el área del campo semicircular de 61 m de diámetro 
para un granjero que planta sus cacahuates.

Author:    Only Pompa
Fecha:      16/10/2023
*/
			
.file "CampoSemicircular.c"          # Nombre del archivo fuente

.section .rodata                     # Sección de datos de solo lectura
.align 8                            # Alineación de 8 bytes
.LC3:                               # Etiqueta .LC3
	.string "El \303\241rea del campo semicircular es: %.2f metros cuadrados\n"
	# Cadena que se mostrará en la salida

.text                               # Sección de código
.globl main                         # Declaración de la función principal
.type main, @function                # Especificación de tipo de función

main:                               # Inicio de la función main
.LFB0:                              # Etiqueta .LFB0
	.cfi_startproc                   # Inicio del procedimiento
	endbr64                          # Directiva de seguridad

	pushq %rbp                        # Guardar el valor de %rbp en la pila
	.cfi_def_cfa_offset 16            # Definir el desplazamiento de la pila
	.cfi_offset 6, -16                # Definir el desplazamiento de %rbp
	movq %rsp, %rbp                   # Establecer %rsp como %rbp
	.cfi_def_cfa_register 6           # Registrar %rbp como el marco actual

	subq $32, %rsp                    # Reservar espacio en la pila

	movsd .LC0(%rip), %xmm0           # Cargar el valor de .LC0 en %xmm0
	movsd %xmm0, -24(%rbp)            # Almacenar %xmm0 en la pila
	movsd -24(%rbp), %xmm0            # Cargar el valor de la pila en %xmm0
	movsd .LC1(%rip), %xmm1           # Cargar el valor de .LC1 en %xmm1
	divsd %xmm1, %xmm0                # Dividir %xmm0 entre %xmm1
	movsd %xmm0, -16(%rbp)            # Almacenar el resultado en la pila
	movsd .LC1(%rip), %xmm0           # Cargar el valor de .LC1 en %xmm0
	movq -16(%rbp), %rax              # Cargar el valor de la pila en %rax
	movapd %xmm0, %xmm1               # Copiar %xmm0 a %xmm1
	movq %rax, %xmm0                  # Copiar %rax a %xmm0
	call pow@PLT                      # Llamar a la función pow
	movsd .LC2(%rip), %xmm1           # Cargar el valor de .LC2 en %xmm1
	mulsd %xmm1, %xmm0                # Multiplicar %xmm0 por %xmm1
	movsd .LC1(%rip), %xmm1           # Cargar el valor de .LC1 en %xmm1
	divsd %xmm1, %xmm0                # Dividir %xmm0 entre %xmm1
	movsd %xmm0, -8(%rbp)             # Almacenar el resultado en la pila
	movq -8(%rbp), %rax               # Cargar el valor de la pila en %rax
	movq %rax, %xmm0                  # Copiar %rax a %xmm0

	leaq .LC3(%rip), %rdi             # Cargar la dirección de la cadena en %rdi
	movl $1, %eax                     # Cargar 1 en %eax (formato de punto flotante)
	call printf@PLT                   # Llamar a la función printf

	movl $0, %eax                      # Cargar 0 en %eax (retorno exitoso)
	leave                             # Deshacer la pila
	.cfi_def_cfa 7, 8                 # Definir el nuevo marco
	ret                               # Retornar
	.cfi_endproc                      # Final del procedimiento

.LFE0:                              # Etiqueta .LFE0
	.size main, .-main               # Tamaño de la función main

.section .rodata                    # Sección de datos de solo lectura
.align 8                           # Alineación de 8 bytes
.LC0:
	.long 0
	.long 1078886400
	.align 8
.LC1:
	.long 0
	.long 1073741824
	.align 8
.LC2:
	.long 776530087
	.long 1074340351
	.ident "GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.2) 9.4.0"
	.section .note.GNU-stack,"",@progbits
	.section .note.gnu.property,"a"
	.align 8
	.long 1f - 0f
	.long 4f - 1f
	.long 5
0:
	.string "GNU"
1:
	.align 8
	.long 0xc0000002
	.long 3f - 2f
2:
	.long 0x3
3:
	.align 8
4:
		</details>
</details>
<details>
	<summary>Problema 5 - Entero Positivo N (Bonus)</summary>
		<details>
			<summary>Código en C</summary>
/**
Problema 5 - EnteroPositivoN

El objetivo del programa es introducir un entero positivo N. Encontrar la suma de los N enteros. 
Imprimir cada uno de los enteros y la suma.

Author:    Only Pompa
Fecha:      16/10/2023
*/
#include <stdio.h>

int main() {
    int N, i, num, suma = 0;

    // Solicitamos al usuario que introduzca un entero positivo N
    printf("Introduce un entero positivo N: ");
    scanf("%d", &N);

    // Solicitamos al usuario que introduzca N enteros y calculamos la suma
    printf("Introduce %d enteros:\n", N);
    for(i = 0; i < N; i++) {
        scanf("%d", &num);
        printf("Has introducido el entero: %d\n", num);
        suma += num;
    }

    // Imprimimos la suma de los N enteros
    printf("La suma de los %d enteros es: %d\n", N, suma);

    return 0;
}
		</details>
		<details>
			<summary>Código en Ensamblador</summary>
/**
Problema 5 - EnteroPositivoN

El objetivo del programa es introducir un entero positivo N. Encontrar la suma de los N enteros. 
Imprimir cada uno de los enteros y la suma.

Author:    Only Pompa
Fecha:      16/10/2023
*/
.file	"EnteropositivoN.c" // Define el nombre del archivo fuente.

.text // Sección de código.

.section	.rodata // Sección de datos de solo lectura.
.align 8 // Alinea los datos en un límite de 8 bytes.
.LC0:
	.string	"Introduce un entero positivo N: " // Define una cadena constante.
.LC1:
	.string	"%d" // Define una cadena constante para la entrada de un entero.
.LC2:
	.string	"Introduce %d enteros:\n" // Define una cadena constante para solicitar múltiples entradas enteras.
.align 8
.LC3:
	.string	"Has introducido el entero: %d\n" // Define una cadena constante para mostrar la entrada del usuario.
.align 8
.LC4:
	.string	"La suma de los %d enteros es: %d\n" // Define una cadena constante para mostrar la suma de las entradas.

.text // Vuelve a la sección de código.
.globl	main // Hace que la función main sea visible para el vinculador.
.type	main, @function // Define el tipo de símbolo de main como función.

main: // Comienza la definición de la función main.
.LFB0:
	.cfi_startproc // Inicia una secuencia de instrucciones CFI (Call Frame Information).
	endbr64 // Instrucción de protección contra ataques ROP y JOP.
	pushq	%rbp // Guarda el valor actual del puntero base en la pila.
	.cfi_def_cfa_offset 16 // Actualiza el offset para el registro CFA (Canonical Frame Address).
	.cfi_offset 6, -16 // Registra el hecho de que el valor original del registro rbp se guarda en la pila.
	movq	%rsp, %rbp // Establece el nuevo puntero base como el valor actual del puntero de pila.
	.cfi_def_cfa_register 6 // Establece rbp como el registro CFA.

	subq	$32, %rsp // Reserva espacio en la pila para las variables locales.

	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, -12(%rbp) // Inicializa la variable que almacenará la suma total.

	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT // Imprime la solicitud al usuario para un entero positivo N.

	leaq	-24(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT // Lee la entrada del usuario y la almacena en -24(%rbp).

	movl	-24(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC2(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT // Imprime una solicitud al usuario para N enteros.

	movl	$0, -16(%rbp) // Inicializa el contador para el bucle.

	jmp .L2

.L3:
    leaq -20(%rbp), %rax
    movq %rax, %rsi
    leaq .LC1(%rip), %rdi
    movl $0, %eax
    call __isoc99_scanf@PLT  // Lee un entero del usuario y lo almacena en -20(%rbp).

    movl -20(%rbp), %eax
    movl %eax, %esi
    leaq .LC3(%rip), %rdi
    movl $0, %eax
    call printf@PLT  // Imprime el entero que acaba de introducir el usuario.

    movl -20(%rbp), %eax 
    addl %eax, -12(%rbp)  // Suma el entero introducido a la suma total.

    addl $1, -16(%rbp)  // Incrementa el contador del bucle.

.L2:
    movl -24(%rbp), %eax 
    cmpl %eax, -16(%rbp) 
    jl .L3  // Si aún no se han introducido N enteros, vuelve a .L3.

    movl -24(%rbp), %eax 
    movl -12(%rbp), %edx 
    movl %eax, %esi
    leaq .LC4(%rip), %rdi
    movl $0, %eax
    call printf@PLT  // Imprime la suma total de los N enteros.

    movl $0, %eax
    movq -8(%rbp), %rcx
    xorq %fs:40, %rcx
    je .L5
    call __stack_chk_fail@PLT  // Verifica si ha habido un desbordamiento de pila.

.L5:
    leave  // Restaura el puntero de pila y el puntero base.
    ret  // Retorna de la función main.
		.cfi_endproc // Finaliza la secuencia de instrucciones CFI (Call Frame Information).
.LFE0:
	.size	main, .-main // Define el tamaño del símbolo main.

	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.2) 9.4.0" // Identifica la versión del compilador.

	.section	.note.GNU-stack,"",@progbits // Sección de pila de GNU.
	.section	.note.gnu.property,"a" // Sección de propiedades de GNU.
	.align 8 // Alinea los datos en un límite de 8 bytes.
	.long	 1f - 0f // Calcula la longitud de la cadena "GNU".
	.long	 4f - 1f // Calcula la longitud de las propiedades.
	.long	 5 // Identifica el tipo de nota como NT_GNU_PROPERTY_TYPE_0.
0:
	.string	 "GNU" // Cadena "GNU".
1:
	.align 8
	.long	 0xc0000002 // Identifica el tipo de propiedad como GNU_PROPERTY_X86_FEATURE_1_AND.
	.long	 3f - 2f // Calcula la longitud del valor de la propiedad.
2:
	.long	 0x3 // Valor de la propiedad (indicando que se requiere soporte para CX8 y CMPXCHG16B).
3:
	.align 8
4:

		</details>
</details>
	</p>

</pre>
