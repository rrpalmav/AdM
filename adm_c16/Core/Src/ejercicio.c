/*
 * ejercicio.c
 *
 *  Created on: May 26, 2023
 *      Author: palmaventura
 */

#include "ejercicio.h"
#include <stdint.h>

/*
 * 1) Realizar una funcion que inicialice una vector con ceros. La funcion debe tener el siguiente
 * prototipo:
 */

void zeros(uint32_t *vector, uint32_t longitud){

	uint32_t i;
	for(i = 0; i < longitud; i++ ){
		vector[i] = 0;
	}

}

/*
 * 2) Realizar una funcion que realice el producto de un vector y un escalar (por ejemplo, podria servir
 * para cambiar el nivel de amplitud de una señal
 */

void productoEscalar32(uint32_t *vectorIn, uint32_t *vectorOut, uint32_t longitud, uint32_t escalar){

	uint32_t max32bits = UINT32_MAX;

	uint32_t i;
	for(i = 0; i < longitud; i++ ){
		if(vectorOut[i] > (max32bits / escalar)) vectorOut[i] = max32bits;
		else vectorOut[i] = vectorIn[i] * escalar;
	}

}


/*
 * 3) Adapte la funcion del ejercicio 2 para realizar operaciones sobre vectores de 16 bits
 */

void productoEscalar16(uint16_t *vectorIn, uint16_t *vectorOut, uint32_t longitud, uint16_t escalar){

	uint16_t max16bits = UINT16_MAX;

	uint32_t i;
	for(i = 0; i < longitud; i++ ){
		if(vectorOut[i] > (max16bits / escalar)) vectorOut[i] = max16bits;
		else vectorOut[i] = vectorIn[i] * escalar;
	}
}

/*
 * 4) Adapte la funcion del ejercicio 3 para realizar operaciones sobre vectores de 12 bits
 */

void productoEscalar12(uint12_t *vectorIn, uint12_t *vectorOut, uint32_t longitud, uint12_t escalar){

	uint12_t max12bits = UINT12_MAX;

	uint32_t i;
	for(i = 0; i < longitud; i++ ){
		if(vectorOut[i] > (max12bits / escalar)) vectorOut[i] = max12bits;
		else vectorOut[i] = vectorIn[i] * escalar;
	}


}
