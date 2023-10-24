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


