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

><em>Reducción del tamaño del código: Las instrucciones de ejecución condicional permiten ejecutar una secuencia de instrucciones solo si se cumple una determinada condición. Esto evita la necesidad de instrucciones de salto (jump) adicionales y reduce el número total de instrucciones necesarias para lograr una funcionalidad específica, lo que a su vez reduce el tamaño del código.
Ahorro de ciclos de reloj: Al evitar saltos adicionales, las instrucciones de ejecución condicional también ayudan a reducir el tiempo de ejecución al minimizar la cantidad de ciclos de reloj necesarios para completar una operación. Esto puede resultar en un mejor rendimiento y tiempos de respuesta más rápidos en aplicaciones sensibles al tiempo.
Mayor legibilidad del código: El uso de instrucciones de ejecución condicional puede mejorar la legibilidad del código, ya que permite expresar lógica condicional de manera más concisa y directa. El código se vuelve más claro y fácil de entender, lo que facilita el mantenimiento y la depuración.</em>

9. <b>Describa brevemente las excepciones más prioritarias (reset, NMI, Hardfault).</b>
<br/><em>Respuesta:</em><br/>

><em>La excepción de reset es la que se produce cuando hay un reset del procesador. Es la más prioritaria de todas. La excepción de NMI es una excepción producida por una interrupción no enmascarable. La excepción de Hardfault agrupa otras excepciones como MemManage, BusFault y UsageFault cuando estas no tienen un handler definido específico para cada una de ellas. En general se produce por un problema del cual es difícil recuperarse.</em>


10. <b>Describa las funciones principales de la pila. ¿Cómo resuelve la arquitectura el llamado a funciones y su retorno?</b>
<br><em>Respuesta:</em><br/>
> <em>La función del stack es guardar el contexto de una función. Es decir, si el procesador está ejecutando una función y luego tiene un llamado a una función anidada, todas las variables en uso (que normalmente estarán en los registros del procesador), se guardan en la pila mediante PUSH para liberar los registros y recién ahí se puede llamar a la otra función que a su vez tendrá sus propias variables (que se guardaran en los registros del procesador para su uso). Cuando se retorna de esta subfunción, se traen las variables en uso por la función a la que se retorna haciendo POP de la pila.</em>

11. <b>Describa la secuencia de reset del microprocesador.</b>
<br><em>Respuesta:</em><br/>

> <em>Al ser presionado el boton de Reset el PC(Contador de Programa) sera cargado con 0X00000000, port tanto comenzara desde la direccion. 0x00000000. Cuando la direccion tenga un valor de Initial Stack Pointer,  esta la escrita en el MSP(Main Stack Pointer).  El valor sera inicializado en el pila.  Entonces el PC sera cargado con el Manejador de Direcciones Reset.  Despues que toma el control el manejador de direcciones reset, se inicializa el sismtea, se copian la inicializacion de las variables globales, variables staticas (.data) a SRAM, Se copia la data no inicializada (.bss) a la SRAM y lo inicializa en 0, posteriormente se llama el main(). </em>

12. <b>¿Qué entiende por “core peripherals”? ¿Qué diferencia existe entre estos y el resto de los periféricos?</b>
<br><em>Respuesta:</em><br/>

> <em>En el contexto de los microcontroladores STM32, el término "core peripherals" se refiere a los periféricos integrados que están directamente relacionados con el funcionamiento del núcleo (core) del microcontrolador. Estos periféricos son esenciales para el funcionamiento básico del microcontrolador y están presentes en todos los modelos de la familia STM32.
Los core peripherals incluyen:
- NVIC (Nested Vectored Interrupt Controller): Es responsable de administrar las interrupciones y prioridades de interrupción en el microcontrolador STM32.
- SysTick: Es un temporizador de sistema de 24 bits que se utiliza para generar interrupciones periódicas y se utiliza comúnmente como base de tiempo en sistemas en tiempo real.
- SCB (System Control Block): Es una parte del núcleo del microcontrolador que contiene registros y funciones relacionadas con el control del sistema, como el reinicio, la configuración de la excepción, la administración de la pila y otras funciones de control.
- MPU (Memory Protection Unit): Es una unidad que se utiliza para proteger diferentes regiones de memoria contra accesos no autorizados.
- NVIC (Nested Vectored Interrupt Controller): Es responsable de administrar las interrupciones y prioridades de interrupción en el microcontrolador STM32.
Estos core peripherals son fundamentales para el funcionamiento básico del microcontrolador y están presentes en todos los modelos STM32. Se consideran esenciales porque proporcionan capacidades básicas del núcleo del microcontrolador y son necesarios para la operación correcta del sistema.
Por otro lado, los periféricos no pertenecientes al núcleo (non-core peripherals) son módulos adicionales integrados en el microcontrolador STM32 que brindan funcionalidades específicas según las necesidades de la aplicación. Estos periféricos pueden variar entre los diferentes modelos de STM32 y pueden incluir interfaces como UART, SPI, I2C, ADC, DAC, temporizadores, controladores de PWM, controladores Ethernet, controladores USB, entre otros. La presencia y variedad de estos periféricos no es uniforme en todos los modelos de STM32 y depende de la serie y el modelo específico.
En resumen, la diferencia entre los core peripherals y los periféricos no pertenecientes al núcleo radica en su función y su importancia para el funcionamiento básico del microcontrolador. Los core peripherals son esenciales y están presentes en todos los modelos de STM32, mientras que los periféricos no pertenecientes al núcleo brindan funcionalidades adicionales y varían entre los diferentes modelos de STM32 según sus características y requisitos de aplicación.</em>

13. <b>¿Cómo se implementan las prioridades de las interrupciones? Dé un ejemplo</b>
<br><em>Respuesta:</em><br/>

><em>, las prioridades de las interrupciones se implementan utilizando el controlador de interrupciones NVIC (Nested Vectored Interrupt Controller). El NVIC permite configurar la prioridad de cada fuente de interrupción y gestionar la asignación de recursos durante el procesamiento de interrupciones. A continuación, se muestra un ejemplo simplificado de cómo se implementan las prioridades de las interrupciones en STM32:
Configuración de prioridades: En primer lugar, se debe configurar la prioridad de las interrupciones en el NVIC. Esto se hace mediante la escritura en los registros correspondientes del NVIC. Cada fuente de interrupción tiene su propio registro de prioridad en el NVIC. En STM32, se utilizan varios bits en estos registros para establecer la prioridad de cada interrupción. Cuantos más bits se asignen para la prioridad, mayor será la granularidad de prioridad que se puede lograr. Por ejemplo, un STM32 puede tener 4 bits para establecer la prioridad, lo que permite hasta 16 niveles de prioridad diferentes.
Prioridad global: En STM32, también se puede configurar una prioridad global en el NVIC. Esto implica establecer un nivel de prioridad máximo para todas las interrupciones. Si una interrupción tiene una prioridad igual o inferior a la prioridad global, se enmascarará y no interrumpirá la ejecución actual.
Procesamiento de interrupciones: Cuando ocurre una interrupción, el NVIC compara la prioridad de la interrupción activa con la prioridad global y las prioridades de otras interrupciones en curso. Si la interrupción activa tiene una prioridad mayor que las interrupciones en curso y la prioridad global, se atiende inmediatamente. De lo contrario, se encola y se manejará una vez que se haya completado el procesamiento de interrupciones en curso.</em>


14. <b>¿Qué es el CMSIS? ¿Qué función cumple? ¿Quién lo provee? ¿Qué ventajas aporta?</b>
<br><em>Respuesta:</em><br/>

><em>El CMSIS (Cortex Microcontroller Software Interface Standard) es una capa de software estándar desarrollada para los procesadores RISCpor ARM (Advanced RISC Machines) para facilitar el desarrollo de software en microcontroladores Cortex-M. El objetivo principal del CMSIS es proporcionar una interfaz coherente y portátil para los desarrolladores de software que trabajan con microcontroladores Cortex-M de ARM.
Las funciones principales del CMSIS son:
- Abstracción del hardware: CMSIS proporciona una capa de abstracción del hardware, lo que significa que los desarrolladores pueden escribir código que sea independiente del microcontrolador específico en el que se esté ejecutando. Esto facilita la portabilidad del código entre diferentes microcontroladores Cortex-M.
- APIs y definiciones de dispositivo: CMSIS incluye una serie de APIs y definiciones de dispositivo que permiten el acceso a los periféricos del microcontrolador de manera estandarizada. Proporciona funciones y estructuras de datos comunes para configurar y utilizar los periféricos, lo que simplifica el desarrollo de software.
- Configuración del sistema: CMSIS incluye un conjunto de funciones y definiciones que permiten la configuración y el control del sistema, como la configuración de los vectores de interrupción, la inicialización de la memoria y la configuración del reloj del sistema.
El CMSIS es proporcionado por ARM, el fabricante de la arquitectura Cortex-M. ARM ofrece el CMSIS como una biblioteca y un conjunto de archivos de encabezado que los desarrolladores pueden utilizar en sus proyectos.
Algunas de las ventajas que aporta el CMSIS son:
- Portabilidad: Al proporcionar una capa de abstracción del hardware y una interfaz coherente, el CMSIS facilita la portabilidad del código entre diferentes microcontroladores Cortex-M. Los desarrolladores pueden escribir código una vez y ejecutarlo en diferentes microcontroladores sin tener que realizar cambios significativos.
- Productividad: El CMSIS proporciona APIs y definiciones de dispositivo estandarizadas que simplifican el desarrollo de software. Los desarrolladores pueden utilizar estas funciones y estructuras de datos comunes en lugar de tener que escribir código específico para cada microcontrolador.
- Acceso a periféricos: CMSIS facilita el acceso a los periféricos del microcontrolador al proporcionar funciones y estructuras de datos comunes. Esto simplifica la configuración y el uso de los periféricos, lo que ahorra tiempo y reduce la posibilidad de errores.
En resumen, el CMSIS es una capa de software estándar desarrollada por ARM para microcontroladores Cortex-M. Proporciona una interfaz coherente y portátil, abstracción del hardware, APIs y definiciones de dispositivo, y funciones de configuración del sistema. El CMSIS simplifica el desarrollo de software, mejora la portabilidad del código y facilita el acceso a los periféricos del microcontrolador.</em>

15. <b>Cuando ocurre una interrupción, asumiendo que está habilitada ¿Cómo opera el microprocesador para atender a la subrutina correspondiente? Explique con un ejemplo</b>
<br><em>Respuesta:</em><br/>

><em>Cuando ocurre una interrupción en un microprocesador STM32 (asumiendo que está habilitada y configurada correctamente), el microprocesador realiza una serie de pasos para atender la subrutina correspondiente. A continuación, se presenta un ejemplo simplificado de cómo opera el microprocesador STM32 para atender una interrupción:
- Ocurre una interrupción, que puede ser generada por un evento externo (por ejemplo, una señal en un pin específico) o por un evento interno (por ejemplo, un temporizador que alcanza un valor determinado).
El microprocesador detiene la ejecución de la instrucción actual y guarda el estado actual del programa en la pila, lo cual incluye registros y la dirección de retorno.
- Se obtiene la dirección de inicio de la rutina de interrupción correspondiente desde la tabla de vectores de interrupción. En STM32, esta tabla se encuentra en la memoria de inicio y contiene las direcciones de inicio de las rutinas de interrupción para cada fuente de interrupción.
- El microprocesador salta a la dirección de inicio de la rutina de interrupción y comienza a ejecutar las instrucciones de dicha rutina.
- La rutina de interrupción realiza las tareas necesarias para atender la interrupción. Esto puede incluir la manipulación de registros, la gestión de eventos, el procesamiento de datos o cualquier otra acción requerida para responder a la interrupción específica.
Una vez que se completa la rutina de interrupción, se realiza la restauración del estado previo guardado en la pila. Esto implica la recuperación de los registros y la dirección de retorno.
El microprocesador retoma la ejecución del programa en el punto donde se interrumpió, es decir, la instrucción siguiente a la que fue interrumpida.
</em>

17. ¿Cómo cambia la operación de stacking al utilizar la unidad de punto flotante?
<br><em>Respuesta:</em><br/>

><em>Cuando se utiliza la unidad de punto flotante (FPU, por sus siglas en inglés) en un microcontrolador STM32 u otro procesador, la operación de stacking (apilamiento) se ve afectada debido a la necesidad de guardar y restaurar registros adicionales relacionados con la FPU. La FPU es responsable de realizar cálculos de punto flotante de alta precisión y tiene sus propios registros y estado.
Al utilizar la FPU, los registros de punto flotante, como los registros de datos de punto flotante (por ejemplo, S0, S1, S2, etc.) y los registros de control de punto flotante (por ejemplo, FPSR - Floating Point Status Register), también deben guardarse y restaurarse correctamente durante el cambio de contexto o el procesamiento de interrupciones. Esto se debe a que estos registros contienen información importante para mantener la coherencia y precisión de los cálculos de punto flotante.</em>

18. Explique las características avanzadas de atención a interrupciones: tail chaining y late arrival.
<br><em>Respuesta:</em><br/>

><em>Las características avanzadas de atención a interrupciones conocidas como tail chaining (encadenamiento de cola) y late arrival (llegada tardía) son técnicas utilizadas en algunos controladores de interrupciones para mejorar la eficiencia y el rendimiento del procesamiento de interrupciones. A continuación, se explica cada una de estas características:
Tail Chaining (Encadenamiento de cola): El tail chaining es una técnica que permite que múltiples interrupciones se procesen de manera secuencial sin la necesidad de regresar al controlador de interrupciones entre cada una. En lugar de completar completamente una interrupción antes de pasar a la siguiente, el procesador puede comenzar a atender la siguiente interrupción mientras aún está en modo de atención de interrupción. Esto se logra mediante el uso de interrupciones anidadas y el enrutamiento adecuado de las interrupciones en el controlador de interrupciones.
En el contexto del tail chaining, una vez que se ha completado una parte crítica de una interrupción (por ejemplo, guardar el estado o realizar una acción específica), en lugar de retornar al controlador de interrupciones y esperar a que se produzca la siguiente interrupción, el procesador puede continuar con la atención de la siguiente interrupción sin pasar por el controlador de interrupciones. Esto reduce la latencia y mejora el tiempo de respuesta global del sistema para múltiples interrupciones en cadena.
Late Arrival (Llegada tardía): La llegada tardía es una característica que permite al controlador de interrupciones aceptar nuevas interrupciones mientras se está procesando una interrupción actual. En lugar de descartar las nuevas interrupciones si ya se está atendiendo una interrupción en curso, el controlador de interrupciones las encola y las atiende tan pronto como sea posible, una vez que se haya completado el procesamiento de la interrupción actual.</em>

19. <b>¿Qué es el systick? ¿Por qué puede afirmarse que su implementación favorece la portabilidad de los sistemas operativos embebidos?</b>
<br><em>Respuesta:</em><br/>
><em>El SysTick es un temporizador incorporado en muchos microcontroladores, incluidos los microcontroladores STM32. Se utiliza comúnmente en sistemas operativos embebidos para proporcionar una base de tiempo precisa y periódica.
La implementación del temporizador SysTick en los microcontroladores STM32 y su inclusión en muchos otros microcontroladores favorece la portabilidad de los sistemas operativos embebidos por las siguientes razones:
- Estándar en la arquitectura ARM Cortex-M: El temporizador SysTick es una característica estándar en la arquitectura ARM Cortex-M, que es ampliamente utilizada en los microcontroladores STM32 y en otros microcontroladores basados en ARM. Esto significa que los sistemas operativos embebidos diseñados para esta arquitectura pueden aprovechar el temporizador SysTick sin depender de características o temporizadores específicos de un fabricante en particular.
- Funcionalidad consistente: El temporizador SysTick proporciona una funcionalidad básica y esencial de temporización en la mayoría de los microcontroladores que lo incluyen. Esto permite que los sistemas operativos embebidos se diseñen para aprovechar este temporizador sin depender de funcionalidades específicas de temporización ofrecidas por un microcontrolador en particular.
- Configuración flexible: El temporizador SysTick se puede configurar para generar una interrupción periódica con una base de tiempo ajustable. Esto brinda flexibilidad a los sistemas operativos embebidos para adaptarse a diferentes requisitos de temporización, como programar tareas, realizar sincronización o gestionar eventos.
</em>

20. <b>¿Qué funciones cumple la unidad de protección de memoria (MPU)?</b>
<br><em>Respuesta:</em><br/>

><em> La MPU se utiliza para proporcionar un mecanismo de protección de memoria en tiempo de ejecución, permitiendo controlar el acceso y la protección de las regiones de memoria en un sistema embebido. Las funciones principales de la MPU son las siguientes:
- Protección de memoria por regiones: La MPU divide la memoria en regiones, y cada región puede ser configurada con permisos específicos de acceso, como lectura, escritura o ejecución. Esto permite definir políticas de acceso a la memoria y proteger áreas críticas o sensibles contra accesos no autorizados o modificaciones no deseadas.
- Control de acceso granular: La MPU permite establecer permisos de acceso a nivel de dirección o rango de direcciones específicas dentro de cada región de memoria. Esto proporciona un control de acceso más granular, lo que significa que diferentes secciones de una región de memoria pueden tener diferentes permisos de acceso, según sea necesario.
- Protección de código y datos: La MPU se puede utilizar para proteger tanto el código ejecutable como los datos en memoria. Esto es particularmente útil para prevenir la ejecución de código malicioso o modificar datos críticos en tiempo de ejecución.
- Detección de violaciones de acceso: La MPU puede generar una excepción o interrupción cuando se produce una violación de acceso a una región de memoria protegida. Esto permite que el sistema operativo o el software embebido tomen medidas apropiadas cuando se intenta acceder a una región de memoria restringida, como finalizar el proceso o tomar medidas correctivas.
- Separación de contextos y seguridad: La MPU se puede utilizar para crear contextos de ejecución separados y protegidos en un sistema embebido. Esto es útil para implementar mecanismos de aislamiento y seguridad, donde diferentes partes del software se ejecutan en contextos protegidos y no pueden acceder ni interferir con otros contextos.</em>

21. <b>¿Cuántas regiones pueden configurarse como máximo? ¿Qué ocurre en caso de haber solapamientos de las regiones? ¿Qué ocurre con las zonas de memoria no cubiertas por las regiones definidas?</b>
<br><em>Respuesta:</em><br/>

><em>El número máximo de regiones que se pueden configurar en una Unidad de Protección de Memoria (MPU) depende del microcontrolador específico y su implementación. La cantidad de regiones varía según el modelo y el fabricante del microcontrolador. Algunos microcontroladores pueden admitir solo unas pocas regiones, mientras que otros pueden admitir un número significativamente mayor, como 8, 16 o más.
- En caso de solapamiento de regiones, el comportamiento y las consecuencias dependerán de la implementación de la MPU y las configuraciones específicas realizadas. Algunos microcontroladores pueden detectar el solapamiento de regiones y generar una excepción o un error para informar de la configuración incorrecta. Otros microcontroladores pueden priorizar una región específica en caso de solapamiento, lo que significa que los permisos de acceso y las configuraciones de una región pueden prevalecer sobre las de otra región solapada.
- Las zonas de memoria no cubiertas por las regiones definidas por la MPU generalmente heredan los permisos y las configuraciones de acceso del nivel de protección anterior, como el nivel de privilegio del procesador o el nivel de protección predeterminado. En otras palabras, si una zona de memoria no está cubierta por ninguna región definida por la MPU, el acceso a esa zona de memoria se rige por las políticas y los permisos de acceso establecidos en el nivel de protección inferior o predeterminado.
- Es importante destacar que el comportamiento exacto de la MPU en relación con el número de regiones, los solapamientos y las zonas de memoria no cubiertas puede variar según el microcontrolador y la implementación específica. Por lo tanto, es esencial consultar la documentación y las especificaciones del fabricante del microcontrolador para obtener detalles precisos sobre la MPU en un sistema embebido específico.
</em>

22. <b>¿Para qué se suele utilizar la excepción PendSV? ¿Cómo se relaciona su uso con el resto de las excepciones? Dé un ejemplo</b>
<br><em>Respuesta:</em><br/>

><em>La excepción PendSV (Pendable Service) se utiliza comúnmente en microcontroladores STM32 y otros sistemas embebidos para realizar tareas de planificación o cambio de contexto en un sistema operativo en tiempo real (RTOS, por sus siglas en inglés). Esta excepción se utiliza para solicitar la ejecución de una tarea pendiente (pendable task) de baja prioridad.
El uso de la excepción PendSV está estrechamente relacionado con el resto de las excepciones, especialmente con el uso del sistema operativo y su planificador de tareas. A continuación, se presenta un ejemplo que ilustra su uso en un sistema operativo embebido STM32:
El sistema operativo en tiempo real (RTOS) está en funcionamiento y ha creado múltiples tareas con diferentes prioridades. Cada tarea se ejecuta en su propio contexto y puede interrumpirse en cualquier momento.
Cuando una tarea de mayor prioridad debe ser suspendida o ceder el control a una tarea de menor prioridad, se genera una interrupción de PendSV.
El control pasa al vector de interrupción PendSV definido en el código del sistema operativo.
El planificador de tareas del sistema operativo verifica si hay una tarea pendiente de mayor prioridad para ejecutarse y realiza el cambio de contexto necesario.
El planificador de tareas actualiza los registros y la pila para la nueva tarea de mayor prioridad, guardando el contexto actual.
La ejecución de la nueva tarea de mayor prioridad comienza y el control se transfiere a esta tarea.</em>

23. <b>¿Para qué se suele utilizar la excepción SVC? Expliquelo dentro de un marco de un sistema operativo embebido.</b>
<br><em>Respuesta:</em><br/>

><em>la excepción SVC (Supervisor Call) se utiliza típicamente como una forma de realizar llamadas al sistema (system calls) desde el modo de usuario a modo privilegiado o supervisor (modo privilegiado del procesador).
En un entorno de sistema operativo embebido, el modo de usuario es el nivel de ejecución normal de las aplicaciones, mientras que el modo privilegiado es donde se ejecutan el kernel del sistema operativo y los controladores de dispositivo, que tienen acceso a recursos de hardware y funciones privilegiadas.
El SVC se utiliza para permitir que una aplicación en modo de usuario solicite servicios o funcionalidades especiales que solo están disponibles en modo privilegiado, como el acceso a recursos de hardware restringidos o la realización de operaciones de bajo nivel.
</em>

ISA
1. <b>¿Qué son los sufijos y para qué se los utiliza? Dé un ejemplo</b>
<br/><em>Respuesta:</em><br/>

><em>Los sufijos en las instrucciones de assembly producen que las mismas se ejecuten . </em>

2. <b>¿Para qué se utiliza el sufijo ‘s’? Dé un ejemplo</b>
<br/><em>Respuesta:</em><br/>

><em>El sufijo 'S' al final de una instrucción le indica al procesador que el resultado de la misma debe afectar a los flags del registro APSR. Esto es útil cuando alguna instrucción posterior debe tener una ejecución condicionada por el resultado de una operación anterior.
Un ejemplo de esto podría ser la implementación de un bucle, en el cual se decrementa un contador que al llegar a 0 produce un salto que produce la salida del mismo (o ingnora la instrucción de salto hacia atrás del bucle). En este caso a la instrucción SUB que
decrementa la variable contador debe agregársele el sufijo 'S', para que al llegar a 0 el flag Z del registro APSR se ponga en 1, utilizando el mismo como referencia de la instrucción condicional que controla el bucle. </em>

3. <b>¿Qué utilidad tiene la implementación de instrucciones de aritmética saturada? Dé un ejemplo con operaciones con datos de 8 bits. </b>

><em>La aritmética saturada es una técnica utilizada en el procesamiento de datos para evitar el desbordamiento o la pérdida de información cuando se realizan operaciones aritméticas. En lugar de permitir que el resultado supere el rango válido, la aritmética saturada "satura" el valor en los límites del rango permitido.  La implementación de instrucciones de aritmética saturada es útil en aplicaciones donde es crucial mantener los datos dentro de un rango específico, especialmente cuando se trabaja con datos de tamaño reducido, como los de 8 bits.  Por ejemplo, supongamos que tenemos dos números de 8 bits en formato de complemento a dos: A = 120 y B = 100. Si realizamos una suma sin aritmética saturada, el resultado sería 220, lo cual excede el rango de un byte sin signo (0-255) y causa un desbordamiento.  Sin embargo, si utilizamos aritmética saturada, el resultado se satura al rango válido. En este caso, la suma de A y B sería 255, que es el valor máximo representable con 8 bits sin signo.</em>

4. <b>Describa brevemente la interfaz entre assembler y C ¿Cómo se reciben los argumentos de las funciones? ¿Cómo se devuelve el resultado? ¿Qué registros deben guardarse en la pila antes de ser modificados?</b>
<br/><em>Respuesta:</em><br/>

><em>Cuando se llama a una función en asembler el compilador utiliza predeterminadamente los registros r0 al r3. Al momento de devolver se devuelve mediante el registro r0. Al salir de la función los registros r0 al r3 recuperan su estado. Si se desea utilizar otros registros se deben preservar.</em>

5. <b>¿Qué es una instrucción SIMD? ¿En qué se aplican y que ventajas reporta su uso? Dé un ejemplo.</b>
<br/><em>Respuesta:</em><br/>

><em>Una instrucción SIMD es una instrucción que puede procesar múltiples datos en una sola operación. El mayor uso es para procesar imagenes.</em>
