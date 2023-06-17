.syntax unified
.thumb
.text

@ Simbolos exportados
.global asm_svc
.global asm_sum

.global asm_zeros
.global asm_productoEscalar32
.global asm_productoEscalar16
.global asm_productoEscalar12
.global asm_filtroVentana10
.global asm_pack32to16
.global asm_max
.global asm_downsampleM
.global asm_invertir
.global asm_eco
.global corr


@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Prototipo en "C":
@   void asm_svc (void)
@
.thumb_func
    asm_svc:
        svc 0
        bx lr


@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Prototipo en "C":
@   uint32_t asmSum (uint32_t firstOperand, uint32_t secondOperand)
@
@ Parametros recibidos:
@   r0: firstOperand
@   r1: secondOperand
@
@ Valor de retorno:
@   r0: resultado de la suma de firstOperand y secondOperand
@
.thumb_func
    asm_sum:
        add r0, r1  @ r0 = r0 + r1
        bx lr       @ vuelve adonde fue llamada (especificamente, si "pc"
                    @ es la direccion, en el codigo del programa, de la
                    @ instruccion "bl asm_sum" usada para saltar a
                    @ esta funcion, entonces "lr" contiene ese "pc" + 4).
                    @ el valor de retorno debe quedar en el registro r0.
                    @ En este caso, r0 es el resultado de r0 + r1.

        @ Otras alternativas para el retorno
        @ mov pc,lr
        @ bx lr
        @ push {lr} ... pop {pc}




@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Prototipo en "C":
@   void asm_zeros(uint32_t * vector, uint32_t longitud)
@
@ Parametros recibidos:
@   r0: dirección del vector
@   r1: longitud
@
@ Valor de retorno: Nada
@
.thumb_func
    asm_zeros:
    	MOV R2, #4
    	MUL R1, R1, R2
    	ADD R1, R0
    	MOV R2, #0
	asm_zerosloop:
		STR R2, [R0], #4
		CMP R0, R1
		BEQ EXIT
		B LOOP
	exit:
        BX LR       @ vuelve adonde fue llamada (especificamente, si "pc"
                    @ es la direccion, en el codigo del programa, de la
                    @ instruccion "bl asm_sum" usada para saltar a
                    @ esta funcion, entonces "lr" contiene ese "pc" + 4).
                    @ el valor de retorno debe quedar en el registro r0.
                    @ En este caso, r0 es el resultado de r0 + r1.

        @ Otras alternativas para el retorno
        @ mov pc,lr
        @ bx lr
        @ push {lr} ... pop {pc}


@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Prototipo en "C":
@   void  asm_productoEscalar32(uint32_t *vectorIn, uint32_t *vectorOut, uint32_t longitud, uint32_t escalar);
@
@ Parametros recibidos:
@   r0: dirección del vector de entrada
@   r1: direccion del vecttor de salida
@   r2: longitud
@   r3: escalar
@
@ Valor de retorno: Nada
@
.thumb_func
     asm_productoEscalar32:
    	SUB R2, #1
    	LDR R4, [R0, R2, LSL, #2]
    	MUL R4, R4, R3
    	STR R4, [R1, R2, LSL #2]
    	CMP R2, #0
    	BNE asm_productoEscalar32
        BX LR       @ vuelve adonde fue llamada (especificamente, si "pc"
                    @ es la direccion, en el codigo del programa, de la
                    @ instruccion "bl asm_sum" usada para saltar a
                    @ esta funcion, entonces "lr" contiene ese "pc" + 4).
                    @ el valor de retorno debe quedar en el registro r0.
                    @ En este caso, r0 es el resultado de r0 + r1.

        @ Otras alternativas para el retorno
        @ mov pc,lr
        @ bx lr
        @ push {lr} ... pop {pc}


@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Prototipo en "C":
@   void asm_productoEscalar16(uint16_t *vectorIn, uint16_t *vectorOut, uint32_t longitud, uint16_t escalar);
@
@ Parametros recibidos:
@   r0: dirección del vector de entrada
@   r1: direccion del vecttor de salida
@   r2: longitud
@   r3: escalar
@
@ Valor de retorno: Nada
@
.thumb_func
     asm_productoEscalar16:
    	PUSH {R4}
     asm_productoEscalar16loop:
    	SUB R2, #1
    	LDRH R4, [R0, R2, LSL #1]
    	MUL R4, R4, R3
    	STRH R4, [R1, R2, LSL #1]
    	CMP R2, #0
    	POP {R4}
        BX LR       @ vuelve adonde fue llamada (especificamente, si "pc"
                    @ es la direccion, en el codigo del programa, de la
                    @ instruccion "bl asm_sum" usada para saltar a
                    @ esta funcion, entonces "lr" contiene ese "pc" + 4).
                    @ el valor de retorno debe quedar en el registro r0.
                    @ En este caso, r0 es el resultado de r0 + r1.

        @ Otras alternativas para el retorno
        @ mov pc,lr
        @ bx lr
        @ push {lr} ... pop {pc}


@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Prototipo en "C":
@   void asm_productoEscalar12(uint16_t *vectorIn, uint16_t *vectorOut, uint32_t longitud, uint16_t escalar);
@
@ Parametros recibidos:
@   r0: dirección del vector de entrada
@   r1: direccion del vecttor de salida
@   r2: longitud
@   r3: escalar
@
@ Valor de retorno: Nada
@
.thumb_func
     asm_productoEscalar12:

     asm_productoEscalar12loop:
    	SUB R2, #1
    	LDRH R4, [R0, R2, LSL #1]
    	MUL R4, R4, R3
    	USAT R4, #12, R4			// SATURO EL REGISTRO A 12 BITS
    	STRH R4, [R1, R2, LSL #1]
    	CMP R2, #0
    	BNE asm_productoEscalar12
    	POP {R4}
        BX LR       @ vuelve adonde fue llamada (especificamente, si "pc"
                    @ es la direccion, en el codigo del programa, de la
                    @ instruccion "bl asm_sum" usada para saltar a
                    @ esta funcion, entonces "lr" contiene ese "pc" + 4).
                    @ el valor de retorno debe quedar en el registro r0.
                    @ En este caso, r0 es el resultado de r0 + r1.

        @ Otras alternativas para el retorno
        @ mov pc,lr
        @ bx lr
        @ push {lr} ... pop {pc}


@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Prototipo en "C":
@   void asm_pack32to16 (uint16_t * vectorIn, uint16_t * vectorOut, uint32_t longitudVectorIn)
@
@ Parametros recibidos:
@   r0: vector de entrada
@   r1: vector de salida
@	r2: largo del vector
@
@
.thumb_func
    asm_pack32to16:
        asm_pack32to16loop:
	    LDR R3, [R0]
	    LSR R3, 16
	    STRH R3, [R1]
	    ADD R0,4
	    ADD R1,2
	    SUBS R2, 1
		BNE asm_pack32to16loop
		BX LR       @ vuelve adonde fue llamada (especificamente, si "pc"
                    @ es la direccion, en el codigo del programa, de la
                    @ instruccion "bl asm_sum" usada para saltar a
                    @ esta funcion, entonces "lr" contiene ese "pc" + 4).
                    @ el valor de retorno debe quedar en el registro r0.
                    @ En este caso, r0 es el resultado de r0 + r1.

        @ Otras alternativas para el retorno
        @ mov pc,lr
        @ bx lr
        @ push {lr} ... pop {pc}


@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Prototipo en "C":
@   int32_t asm_max (int32_t * vectorIn, uint32_t longitud);
@
@ Parametros recibidos:
@   r0: vector de entrada
@   r1: longitud
@
@ Valor de retorno:
@   r0: resultado de la posición de valor máximo en el arreglo
@
.thumb_func
    asm_max:
    	PUSH {R4-R5}
    	LDR R2, [R0]
    	MOV R4, #0
    	MOV R5, R1
    asm_maxloop:
	    LDR R3, [R0]
	    CMP R3, R2
		BMI finalizarmaxloop
	    MOV R4, R1
		MOV R2, R3 //guardo valor maximo
	finalizarmaxloop:
	    ADD R0,4
	    SUBS R1, 1
		BNE asm_maxloop
		SUB R5, R4
		MOV R0, R5
		POP {R4-R5}
				BX LR       @ vuelve adonde fue llamada (especificamente, si "pc"
                    @ es la direccion, en el codigo del programa, de la
                    @ instruccion "bl asm_sum" usada para saltar a
                    @ esta funcion, entonces "lr" contiene ese "pc" + 4).
                    @ el valor de retorno debe quedar en el registro r0.
                    @ En este caso, r0 es el resultado de r0 + r1.

        @ Otras alternativas para el retorno
        @ mov pc,lr
        @ bx lr
        @ push {lr} ... pop {pc}


@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Prototipo en "C":
@   int32_t asm_downsampleM (int32_t * vectorIn, int32_t * vectorOut, uint32_t longitud, uint32_t N);
@
@ Parametros recibidos:
@   r0: vector de entrada
@   r1: vector de salida
@	r2: longitud del vector
@	r3: N número a decimar cada N muestras
@
.thumb_func
    asm_downsampleM:
    	PUSH {R4,R5}
    	MOV R4, 0
    	MOV R5, 0
    	SUB R3,1
    asm_downsampleMloop:
		CMP R3,R4
		ADD R4,#1
		BNE finalizar1downsampleMloop
		MOV R4,#0
	finalizar1downsampleMloop:
		LDR R5, [R0]
		STR R5, [R1]
		ADD R1, #4
	finalizar2downsampleMloop:
		ADD R0, #4
        SUBS R2, #1
		BNE asm_downsampleMloop
		POP {R4,R5}
		BX LR       @ vuelve adonde fue llamada (especificamente, si "pc"
                    @ es la direccion, en el codigo del programa, de la
                    @ instruccion "bl asm_sum" usada para saltar a
                    @ esta funcion, entonces "lr" contiene ese "pc" + 4).
                    @ el valor de retorno debe quedar en el registro r0.
                    @ En este caso, r0 es el resultado de r0 + r1.

        @ Otras alternativas para el retorno
        @ mov pc,lr
        @ bx lr
        @ push {lr} ... pop {pc}


@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Prototipo en "C":
@   int32_t asm_invertir (uint16_t * vector, uint32_t longitud);
@
@ Parametros recibidos:
@   r0: vector de entrada y salida
@   r1: longitud
@
@
.thumb_func
    asm_invertir:
    	PUSH {R4}
    	MOV R2, R0
    	ADD r2, r2,r1,LSL #1
    	SUB R2, 2
		LSR R1,#1 //divido por 2,
    asm_invertirloop:
    	LDRH R3, [R0]
    	LDRH R4, [R2]
    	STDH R4, [R0]
    	STDH R3, [R2]
		ADD R0, #2
        SUB R2, #2
        SUB R1, #1
		BNE asm_invertirloop
		POP {R4}
		BX LR       @ vuelve adonde fue llamada (especificamente, si "pc"
                    @ es la direccion, en el codigo del programa, de la
                    @ instruccion "bl asm_sum" usada para saltar a
                    @ esta funcion, entonces "lr" contiene ese "pc" + 4).
                    @ el valor de retorno debe quedar en el registro r0.
                    @ En este caso, r0 es el resultado de r0 + r1.

        @ Otras alternativas para el retorno
        @ mov pc,lr
        @ bx lr
        @ push {lr} ... pop {pc}


@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Prototipo en "C":
@   int32_t asm_eco (int16_t * vector, uint32_t longitud, uint32_t samples, uint32_t eco_start);
@
@ Parametros recibidos:
@   r0: vector de entrada y salida
@   r1: longitud
@	r2: frecuencia de sampleo
@	r3:	donde se empieza a generar el eco
@
.thumb_func
    asm_eco:
    	PUSH {R4-R8}
    	MOV R4, 0
    	MOV R6, 0
    	MUL R4, R2, R3  //samples*eco_start
    	MOV R5, #1000
    	SDIV R4,R4, R5
		SUB R1, R4
    	ADD R6, R0, R4, LSL 1
    asm_ecoloop:
    	LDRH R7, [R0]
    	LDRH R8, [R6]
		ADD R7, R8, R7, ASR 1
		STDH R7, [R6]
		ADD R6, 2
    	ADD R0,2
        SUB r1, 1
		BNE asm_ecoloop
		POP {R4-R8}
		BX LR       @ vuelve adonde fue llamada (especificamente, si "pc"
                    @ es la direccion, en el codigo del programa, de la
                    @ instruccion "bl asm_sum" usada para saltar a
                    @ esta funcion, entonces "lr" contiene ese "pc" + 4).
                    @ el valor de retorno debe quedar en el registro r0.
                    @ En este caso, r0 es el resultado de r0 + r1.

        @ Otras alternativas para el retorno
        @ mov pc,lr
        @ bx lr
        @ push {lr} ... pop {pc}

