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


