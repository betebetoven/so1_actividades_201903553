
# Completely Fair Scheduler (CFS) en Linux

**Universidad de San Carlos de Guatemala**  
**Curso:** Sistemas Operativos 1  
**Alberto Josué Hernández Armas**  
**Carnet:** 201903553  

## Introducción

El Completely Fair Scheduler (CFS) es el planificador predeterminado en Linux y se introdujo en la versión 2.6.23 del núcleo. CFS reemplaza a otros planificadores previos que usaban algoritmos menos eficientes en cuanto a la administración de los recursos de CPU, permitiendo una distribución de tiempos de ejecución justa entre los procesos.

## Características Principales de CFS

1. **Distribución Justa de CPU**  
   El CFS intenta distribuir el tiempo de CPU de manera equitativa entre todos los procesos. Define "justo" como el tiempo de CPU que cada proceso debería recibir en función de su peso relativo (importancia y prioridad), eliminando técnicas tradicionales basadas en el "round-robin".

2. **Cola de Red-Black Tree (Árbol Rojinegro)**  
   CFS utiliza una estructura de datos conocida como "árbol rojinegro" (red-black tree) para almacenar los procesos listos para ejecutarse. Esto permite que el tiempo de búsqueda del próximo proceso a ejecutar sea eficiente, reduciendo el tiempo a logarítmico con respecto al número de procesos en espera.

3. **Tiempo Virtual**  
   Cada proceso tiene un tiempo virtual, calculado como una aproximación al tiempo real que el proceso debería haber recibido de manera justa. El proceso con el tiempo virtual más bajo es el próximo a ejecutarse.

4. **Prioridades Relativas**  
   CFS considera las prioridades de los procesos, dando más tiempo de CPU a aquellos con mayores necesidades. Los procesos interactivos (como los que requieren interacción rápida con el usuario) suelen recibir una prioridad mayor.

5. **Justicia y Eficiencia en la Administración de Procesos**  
   En lugar de un enfoque de "timeslices" como en planificadores previos, CFS asigna "tiempos justos" de ejecución, maximizando la respuesta para los procesos interactivos y la eficiencia global del sistema.

## Funcionamiento de CFS

1. **Asignación de Tiempos de Ejecución**  
   El tiempo de CPU que cada proceso debe recibir se calcula con base en el "peso" del proceso y el número de procesos en ejecución. Los procesos de mayor prioridad reciben más tiempo en comparación con los de menor prioridad.

2. **Manejo de Contextos de Cambio**  
   CFS realiza cambios de contexto cuando un proceso ha agotado su tiempo asignado, o cuando un nuevo proceso con un tiempo virtual más bajo se vuelve disponible. Esto asegura que siempre se ejecuta el proceso que menos tiempo de CPU ha recibido en relación a su cuota justa.

3. **Selección de Procesos**  
   La estructura de árbol rojinegro permite que CFS seleccione el siguiente proceso de forma rápida y eficiente, garantizando que el cambio de contexto sea ágil, lo cual optimiza el rendimiento del sistema.

4. **Carga Justa Basada en Peso**  
   Cada proceso tiene un "peso" que define cuánta CPU debe recibir en proporción al resto. Este peso se ajusta dependiendo de la prioridad y permite que procesos de alta prioridad reciban más tiempo de CPU sin bloquear los procesos de baja prioridad.

## Conclusión

El Completely Fair Scheduler representa una mejora significativa en la administración de CPU en sistemas Linux. Con su enfoque basado en la justicia y la eficiencia, el CFS optimiza el rendimiento y mejora la experiencia del usuario al manejar procesos interactivos y tareas intensivas en CPU de forma equilibrada. Gracias a su estructura de árbol rojinegro y la administración de tiempos virtuales, CFS logra distribuir los recursos de forma justa entre los procesos, ajustando las prioridades sin sacrificar la eficiencia.
