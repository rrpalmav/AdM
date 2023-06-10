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
	for(i = longitud; i > 0; i-- ){
		vector[i - 1] = 0;
	}

}

/*
 * 2) Realizar una funcion que realice el producto de un vector y un escalar (por ejemplo, podria servir
 * para cambiar el nivel de amplitud de una señal
 */

void productoEscalar32(uint32_t *vectorIn, uint32_t *vectorOut, uint32_t longitud, uint32_t escalar){

	/*
	uint32_t max32bits = UINT32_MAX;
	
	for(; longitud > 0; longitud-- ){
		if(vectorOut[longitud] > (max32bits / escalar)) vectorOut[longitud] = max32bits;
		else vectorOut[longitud] = vectorIn[longitud] * escalar;
	}
	*/
	uint32_t i;
	
	for(i = longitud; i > 0; i-- ){
		vectorOut[i-1] = vectorIn[i-1] * escalar;
	}
}


/*
 * 3) Adapte la funcion del ejercicio 2 para realizar operaciones sobre vectores de 16 bits
 */

void productoEscalar16(uint16_t *vectorIn, uint16_t *vectorOut, uint32_t longitud, uint16_t escalar){

	/*
	uint16_t max16bits = UINT16_MAX;
	for(; longitud > 0; longitud-- ){
		if(vectorOut[longitud-1] > (max16bits / escalar)) vectorOut[longitud-1] = max16bits;
		else vectorOut[longitud-1] = vectorIn[longitud-1] * escalar;
	}
	*/

	uint32_t i;
	
	for(i = longitud; i > 0; i-- ){
		vectorOut[i-1] = vectorIn[i-1] * escalar;
	}

}

/*
 * 4) Adapte la funcion del ejercicio 3 para realizar operaciones sobre vectores de 12 bits
 */

void productoEscalar12(uint16_t *vectorIn, uint16_t *vectorOut, uint32_t longitud, uint16_t escalar){

	/*
	uint16_t max12bits = UINT16_MAX;

	uint32_t i;
	for(; longitud > 0; longitud-- ){
		if(vectorOut[longitud-1] > (max12bits / escalar)) vectorOut[longitud-1] = max12bits;
		else vectorOut[longitud-1] = vectorIn[longitud-1] * escalar;
	}
	*/
	uint32_t i;
	uint32_t valorMaximo;
	uint16_t max12bits = 4095;

	for(uint32_t i = longitud ; i > 0; i-- ){
		valorMaximo = vectorIn[i-1]*escalar;
		if(valorMaximo > max12bits){
			valorMaximo = max12bits;
		}	
		vectorOut[i-1] = valorMaximo;
	}

}


/*
* 5) Realice una función que implemente un filtro de ventana móvil de 10 valores sobre un vector de
* muestras.
*/

void filtroVentana10(uint16_t * vectorIn, uint16_t * vectorOut, uint32_t longitudVectorIn){

	uint8_t SampleOffset = 5;
	uint32_t tam = longitudVectorIn - 1;
	for (int32_t i = tam; i > 0; i--){
		for (int32_t j = i + SampleOffset; j >= i - SampleOffset; j--){
			if(j > tam || j < 0){
				vectorOut[i] += 0;
			}
			else{
				vectorOut[i] += vectorIn[j];
			}
		}
		vectorOut[i] /= (SampleOffset*2 + 1);
	}
}


/*
* 6) Realizar una función que reciba un vector de números signados de 32 bits y los “empaquete” en
* otro vector de 16 bits. La función deberá adecuar los valores de entrada a la nueva precisión.
*/
void pack32to16 (int32_t * vectorIn, int16_t *vectorOut, uint32_t longitud){

	for (uint32_t i = longitud; i > 0; i--){
		vectorOut[i] = (uint16_t)(vectorIn[i]>>8);
	}

}

/*
* 7) Realizar una función que reciba un vector de números signados de 32 bits y devuelva la posición
* del máximo del vector.
*/

int32_t max (int32_t * vectorIn, uint32_t longitud){

	int32_t max = vectorIn[longitud - 1];
	uint32_t index = longitud - 1;
	for (uint32_t i = longitud - 1; i > 0; i--){
		if(vectorIn[i-1] > max){
			max = vectorIn[i-1];
			index = i - 1;
		}
	}
	return index;
}

