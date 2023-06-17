# AdM
Repositorio creado para la clase de Adquitectura de Microprocesadores


Preguntas orientadoras
1. <b>Describa brevemente los diferentes perfiles de familias de
microprocesadores/microcontroladores de ARM. Explique alguna de sus diferencias características.</b>
<br/><em>Respuesta:</em>

> <b>Cortex-A</b>: Esta familia esta desarrollador para uso de aplicaciones.
> <br/>
> <b>Cortex-R</b>: Esta familia esta dedicada especificamente para proyectos en Tiempo Real y Sistemas Criticos.
> <br/>
> <b>Cortex-M</b>: El uso especifico para uso de microcontroladores.

Cortex M
1. <b>Describa brevemente las diferencias entre las familias de procesadores Cortex M0, M3 y M4. </b>
<br/><em>Respuesta:</em>

> <em>Entres la familia de Cortex M, se puede explicar lo siguiente: </em>
> <br/>
> <b>Cortex-M0</b>: <em>Son utilizados por su bajo consumo y costo.</em>
> <br/>
> <b>Cortex-M3, Cortex-M4</b>: <em>están diseñados para tener una mejor performance.  Si la aplicación requieres matemáticas de punto flotante ya que estos los procesadores M4 utiliza las capacidades DSP o FPU.</em>

2. <b>¿Por qué se dice que el set de instrucciones Thumb permite mayor densidad de código? Explique</b>
<br/><em>Respuesta:</em>

> <em>El conjunto de instrucciones Thumb es un subconjunto de las instrucciones ARM de 32 bits más utilizadas. Las instrucciones de pulgar tienen una longitud de 16 bits cada una y tienen una instrucción ARM de 32 bits correspondiente que tiene el mismo efecto en el modelo de procesador. Las instrucciones Thumb funcionan con la configuración de registro ARM estándar, lo que permite una excelente nteroperabilidad entre los estados ARM y Thumb.</em>

3. <b>¿Qué entiende por arquitectura load-store? ¿Qué tipo de instrucciones no posee este tipo de arquitectura?</b>
<br/><em>Respuesta: </em>

> <em>En la arquitectura Load Store se trabaja solo con los datos de los registros con el fin de evitar el acceso frecuente a memoria, lo cual ayuda a mejorar la velocidad, ya que, la memoria es más lenta. Por lo tanto, solo las instrucciones load y store accede a la memoria.  En cambio, el resto de las instrucciones de la ISA trabajan únicamente con los registros (no tienen acceso a la memoria).  Entonces podemos decir, que este tipo de arquitecturas no tienen instrucciones que traigan datos de memoria y hagan operaciones con esos valores (o hagan operaciones y guarden en memoria).</em>

4. <b>¿Cómo es el mapa de memoria de la familia?</b>
<br/><em>Respuesta: </em>

><em>El mapa de memoria es un bloque continuo de direcciones donde todos los perifericos del microcontrolador estan mapeados. Como máximo puede direccionar hasta 2^32 = 4G de direcciones.</em>

5. <b>¿Qué ventajas presenta el uso de los “shadowed pointers” del PSP y el MSP?</b>
<br/><em>Respuesta: </em><br/>

><em>El MSP es el Main Stack Pointer y es usado durante la ejecución del programa en modo privilegiado. En cambio, el PSP es el Processor Stack Pointer y es usado por las tareas cuando se ejecutan en modo no privilegiado. Este es el típico uso de los Stack Pointers cuando se ejecuta un sistema operativo. Si el programa es simple y no tiene S.O., entonces en general únicamente se usa el MSP. Con respecto al uso  de “shadowed pointers” se refiere a que el PSP o el MSP se leen directamente desde el registro SP. Dependiendo de cómo este seteado un bit determinado de control (SPSEL), cuando el procesador lee el registro SP, esta leyendo el MSP o el PSP</em>

6. <b>Describa los diferentes modos de privilegio y operación del Cortex M, sus relaciones y como se conmuta de uno al otro. Describa un ejemplo en el que se pasa del modo privilegiado a no priviligiado y nuevamente a privilegiado.</b>
<br/><em>Respuesta: </em><br/>

><em>El modo privilegiado de ejecución tiene acceso a todos los recursos del sistema mientras que el modo no privilegiado tiene el acceso restringido. Para conmutar de modo privilegiado a modo no privilegiado se realiza mediante software (seteando el bit de control correspondiente). En cambio, para pasar de modo no privilegiado a modo privilegiado si o si se necesita que ocurra una excepción para que el procesador entre en modo Handler y desde dicho modo es posible setear el bit de control para que la ejecución del programa se eleve a modo privilegiado. Un ejemplo de esto es cuando un sistema operativo ejecuta un task. Mientras el scheduler está activo, se ejecuta en modo privilegiado, pero antes de pasarle el control a un task, cambia a modo no privilegiado para restringir el acceso al sistema por parte del task. Cuando el Task finaliza su ejecución, se puede generar una excepción para que entre el modo Handler y luego se llame al Scheduler nuevamente, pero de forma privilegiada. Esto es útil cuando se usa en conjunto con el MPU para restringir el acceso a memoria por parte de los Tasks.</em>

7. <b>¿Qué se entiende por modelo de registros ortogonal? Dé un ejemplo</b>
<br/><em>Respuesta:</em><br/>

><em>Los registros ortogonales son aquellos que modificando el valor de uno, no se afecta el comportamiento que controla el otro registro. Es decir, son totalmente independientes.</em>

8. <b>¿Qué ventajas presenta el uso de intrucciones de ejecución condicional (IT)? Dé un ejemplo</b>
<br/><em>Respuesta:</em><br/>

>información de prueba

9. <b>Describa brevemente las excepciones más prioritarias (reset, NMI, Hardfault).</b>
<br/><em>Respuesta:</em><br/>

><em>La excepción de reset es la que se produce cuando hay un reset del procesador. Es la más prioritaria de todas. La excepción de NMI es una excepción producida por una interrupción no enmascarable. La excepción de Hardfault agrupa otras excepciones como MemManage, BusFault y UsageFault cuando estas no tienen un handler definido específico para cada una de ellas. En general se produce por un problema del cual es difícil recuperarse.</em>


10. <b>Describa las funciones principales de la pila. ¿Cómo resuelve la arquitectura el llamado a funciones y su retorno?</b>
<br><em>Respuesta:</em><br/>
> <em>La función del stack es guardar el contexto de una función. Es decir, si el procesador está ejecutando una función y luego tiene un llamado a una función anidada, todas las variables en uso (que normalmente estarán en los registros del procesador), se guardan en la pila mediante PUSH para liberar los registros y recién ahí se puede llamar a la otra función que a su vez tendrá sus propias variables (que se guardaran en los registros del procesador para su uso). Cuando se retorna de esta subfunción, se traen las variables en uso por la función a la que se retorna haciendo POP de la pila.</em>


11. Describa la secuencia de reset del microprocesador.
<br><em>Respuesta:</em><br/>

> <em>Al ser presionado el boton de Reset el PC(Contador de Programa) sera cargado con 0X00000000, port tanto comenzara desde la direccion. 0x00000000. Cuando la direccion tenga un valor de Initial Stack Pointer,  esta la escrita en el MSP(Main Stack Pointer).  El valor sera inicializado en el pila.  Entonces el PC sera cargado con el Manejador de Direcciones Reset.  Despues que toma el control el manejador de direcciones reset, se inicializa el sismtea, se copian la inicializacion de las variables globales, variables staticas (.data) a SRAM, Se copia la data no inicializada (.bss) a la SRAM y lo inicializa en 0, posteriormente se llama el main(). </em>

12. ¿Qué entiende por “core peripherals”? ¿Qué diferencia existe entre estos y el resto de
los periféricos?
13. ¿Cómo se implementan las prioridades de las interrupciones? Dé un ejemplo
14. ¿Qué es el CMSIS? ¿Qué función cumple? ¿Quién lo provee? ¿Qué ventajas aporta?
15. Cuando ocurre una interrupción, asumiendo que está habilitada ¿Cómo opera el
microprocesador para atender a la subrutina correspondiente? Explique con un ejemplo
17. ¿Cómo cambia la operación de stacking al utilizar la unidad de punto flotante?
18. Explique las características avanzadas de atención a interrupciones: tail chaining y late
arrival.
19. ¿Qué es el systick? ¿Por qué puede afirmarse que su implementación favorece la
portabilidad de los sistemas operativos embebidos?
20. ¿Qué funciones cumple la unidad de protección de memoria (MPU)?
21. ¿Cuántas regiones pueden configurarse como máximo? ¿Qué ocurre en caso de haber
solapamientos de las regiones? ¿Qué ocurre con las zonas de memoria no cubiertas por las
regiones definidas?
22. ¿Para qué se suele utilizar la excepción PendSV? ¿Cómo se relaciona su uso con el resto
de las excepciones? Dé un ejemplo
23. ¿Para qué se suele utilizar la excepción SVC? Expliquelo dentro de un marco de un
sistema operativo embebido.


ISA
1. ¿Qué son los sufijos y para qué se los utiliza? Dé un ejemplo
<br/><em>Respuesta:</em><br/>

><em>Los sufijos en las instrucciones de assembly producen que las mismas se ejecuten . </em>

2. ¿Para qué se utiliza el sufijo ‘s’? Dé un ejemplo
<br/><em>Respuesta:</em><br/>

><em>El sufijo 'S' al final de una instrucción le indica al procesador que el resultado de la misma debe afectar a los flags del registro APSR. Esto es útil cuando alguna instrucción posterior debe tener una ejecución condicionada por el resultado de una operación anterior.
Un ejemplo de esto podría ser la implementación de un bucle, en el cual se decrementa un contador que al llegar a 0 produce un salto que produce la salida del mismo (o ingnora la instrucción de salto hacia atrás del bucle). En este caso a la instrucción SUB que
decrementa la variable contador debe agregársele el sufijo 'S', para que al llegar a 0 el flag Z del registro APSR se ponga en 1, utilizando el mismo como referencia de la instrucción condicional que controla el bucle. </em>

3. ¿Qué utilidad tiene la implementación de instrucciones de aritmética saturada? Dé un
ejemplo con operaciones con datos de 8 bits.

4. Describa brevemente la interfaz entre assembler y C ¿Cómo se reciben los argumentos
de las funciones? ¿Cómo se devuelve el resultado? ¿Qué registros deben guardarse en la
pila antes de ser modificados?
<br/><em>Respuesta:</em><br/>

><em>Cuando se llama a una función en asembler el compilador utiliza predeterminadamente los registros r0 al r3. Al momento de devolver se devuelve mediante el registro r0. Al salir de la función los registros r0 al r3 recuperan su estado. Si se desea utilizar otros registros se deben preservar.</em>

5. ¿Qué es una instrucción SIMD? ¿En qué se aplican y que ventajas reporta su uso? Dé un
ejemplo.
<br/><em>Respuesta:</em><br/>

><em>Una instrucción SIMD es una instrucción que puede procesar múltiples datos en una sola operación. El mayor uso es para procesar imagenes.</em>
