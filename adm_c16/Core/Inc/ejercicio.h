/*
 * ejercicio.h
 *
 *  Created on: May 19, 2023
 *      Author: palmaventura
 */

#ifndef INC_EJERCICIO_H_
#define INC_EJERCICIO_H_

#include <stdint.h>

/*
 * 1) Realizar una funcion que inicialice una vector con ceros. La funcion debe tener el siguiente
 * prototipo:
 */

void zeros(uint32_t *vector, uint32_t longitud);

/*
 * 2) Realizar una funcion que realice el producto de un vector y un escalar (por ejemplo, podria servir
 * para cambiar el nivel de amplitud de una señal
 */

void productoEscalar32(uint32_t *vectorIn, uint32_t *vectorOut, uint32_t longitud, uint32_t escalar);


/*
 * 3) Adapte la funcion del ejercicio 2 para realizar operaciones sobre vectores de 16 bits
 */

void productoEscalar16(uint16_t *vectorIn, uint16_t *vectorOut, uint32_t longitud, uint16_t escalar);

/*
 * 4) Adapte la funcion del ejercicio 3 para realizar operaciones sobre vectores de 12 bits
 */

void productoEscalar12(uint12_t *vectorIn, uint12_t *vectorOut, uint32_t longitud, uint12_t escalar);





#endif /* INC_EJERCICIO_H_ */
