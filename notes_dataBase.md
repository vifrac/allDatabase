Notas sobre el curso de fundamentos de bases de datos en platzi
- https://platzi.com/clases/bd/
=============================

En este curso comenzaremos con lo basico, como instalar el Rails, en algunas ocaciones
el framework se instala con una serie de sencillas acciones, en otras ocaciones se debe
instalar con un ejecutable (caso windows).

```
  <!-- Este codigo solo se imprime, la sintaxis ruby no es evaluada cuando utilizamos las etiquetas '<%  %>' -->
  <% [1,2,3,4].each do |number| %>
    <p>Número: <%= number %></p>
  <% end %>

  <br>
  <!-- Este codigo se evalua, la sintaxis ruby es evaluada cuando utilizamos las etiquetas '<%=  %>'-->
  <%= [1,2,3,4].each do |number| %>
    <p>Número: <%= number %></p>
  <% end %>
```

| Comando * | Que significa | Que hace | ejemplo * | Notas |
| ------- | - | - | - | - |
| cd  | change directory | Cambiar de directorio | cd "ruta/que/queremos/abrir" | |

Instalacion 

/etc/init.d/mysql stop
apt-get remove --purge mariadb*
apt-get remove --purge mysql*
apt-get autoremove
apt-get autoclean
rm -rf /etc/mysql
rm -rf /var/lib/mysql*

- source /home/vifrac/Documentos/proyectosFedesoft/dataBase/script.sql 

- Bases de datos sql y NoSQL
    - Bases de datos Relacionales 
    - Base de datos clave-valor
    - Base de datos orientada a documentos
    - Base de datos orientada a grafos
- SQL
    - Que es SQL
- DBMS
    - Que es un Sistema de gestion de Bases de Datos
    - Arquitectura de de un SGBD
- Engine 
    - Que es un motor de bases de datos 
- Database
    - Que es una base de datos
- Diferencias sql, dbms, engine db 
## Lessons 11 - Las llaves

- Lesson 11 - Las llaves
    - Las llaves nos dan acceso a los datos de una entidad, su notación esla de numeral #.
    - Las llaves tienen que ser irrepetibles y obligatorias, por lo tanto el ID puede ser una llave.
    - Una llave puede ser compuesta, esta se compone de 2 numeros, entre ID y Numero de seguro social. (como un numero de teléfono móvil).
    - Las llaves foráneas son llaves que van a estar en nuestra tabla, que no necesariamente son nuestras llaves primarias pero van a permitir acceder a otra tabla donde ahí sean llaves primarias.
    - Una llave foranea tiene que ser llave primaria de una tabla (entidad).
    - Las llaves son fundamentales por que son obligatoriamente índices, los cuales permiten encontrar los datos cuando se necesitan de una forma rápida y ordenada.
    - Tupla/registro/fila: representa un objeto único de datos implícitamente estructurados en una tabla.
- Lesson 12 - Índices e Indexación
    - Las llaves primarias obligatoriamente van a ser índices.
    - Las Bases de Datos indexan con un algoritmo llamado:Árboles B+
    - Los Árboles B+ son una estructura que va a tener un tronco, tres raíces, de las cuales se van a ir derivando tres raíces más por cada una, hasta donde sea necesario.
    - Por defecto todas las Bases de Datos están indexadas, así no le pongamos índices. Lo que sucede es que la Base de Datos siempre obliga a indexar porque siempre tienen un atributo que está oculto, este atributo es RowID.
    - Otra manera de indexar va a ser por columnas, funciona como si estuviéramos trabajando en excel, se va a indexar por el tipo de dato, vamos a poner arriba el que ha sido mas utilizado.
- Lesson 13 - Constraints o Restricciones
    - Los diferentes tipos de restricción que existen son: PRIMARY KEY, UNIQUE, FOREIGN KEY, CHECK, DEFAULT
    - El campo no puede estar vacío = Not Null
    - El campo no se puede repetir = Unique
    - Validación por comparación Check (==, >=, <=, ><)
    - Una clave primaria implica un índice único.
    - Una clave primaria implica también NOT NULL, pero un índice único puede ser nulo.
    - Sólo puede haber una clave primaria, pero puede haber múltiples índices únicos.
- Lesson 14 - Capas de abstracción del modelo Entidad-Relación
    - Capa Conceptual: En esta capa vamos a tener varias entidades, aún sin nombre definido. Las entidades van a tener cada una sus llaves primarias y sus atributos, además van a tener relaciones.
    - Para que existan las relaciones “muchos a muchos” se necesitan llaves foráneas en las entidades, por ende se crea una tabla intermedia entre las dos entidades fuertes, a esta tabla sele conoce como entidad debil o tabla pivote.
    - Capa Lógica: El modelo Entidad-Relación para poder procesar las relaciones “muchos a muchos” las va a partir en entidades que se llaman: Entidades Débiles.
    - Capa Física: Este modelo va a ser el paso del modelo lógico hacia la representación que ya va a tener la Base de Datos. En esta capa, ya cada uno de los datos empieza a entrar en las clasificaciones según su tipo de dato.
- Lesson 15 - Metodología básica de 9 pasos con Barker (Paso 1) Identificar Cuáles son las Entidades Resuelven Nuestro Problema
    - Barker (Paso 1), identificar las entidades, para ello es recomendado conocer el mercado para el cual se va a desarrollar la base de datos
    - Las entidades deven trabajarse (nombrase) en singular
- Lesson 16 - Metodología básica de 9 pasos con Barker (Paso 2): Identificación de las Relaciones de las Entidades.
- Lesson 17 - Metodología básica de 9 pasos con Barker (Paso 3): Entidades y Relaciones
- Lesson 18 - Metodología de Diseño (Correcciónes del paso 2 y 3)
- Lesson 19 - Metodología de Diseño (Paso 4): Asignar Atributos a las Entidades.
    - ¿Que atributos voy a necesitar?
    - ¿Cual va a ser la codificación que voy a utilizar?
    - ¿Como los voy a trabajar dependiendo del tipo de dato?
    - Hasta este punto no nos vamos a fijar en que motor de base de datos vamos a correr.
    - El tipo de dato va a ser obligatorio o no obligatorio, dando la posibilidad de que sea nulo o no nulo (Null o Not Null en SQL).
    - Vamos a tener un identificador único de cada tabla, una llave primaria. Mínimo una por tabla.
    - Para hacer mas fácil las consultas hay que tener una nomenclatura para cada tabla (como AV_ para avión) y así poder referirnos a los atributos que se repiten en varias tablas (como nombre).
    - Hay que revisar el tipo de dato que vamos a usar, los identificadores se pueden trabajar como serial, así la misma base de datos se va a encargar de que el valor de ese identificador sea único e irrepetible.
    - Definimos la obligatoriedad de los datos, las llaves primarias tienen que ser obligatorias.
    - Al calcular el tamaño de los espacios de memoria dejar una holgura de un 15 al 20 %
- Lesson 20 - Metodología de Diseño (Solución del paso 4): Terminando de Asignar Atributos a las Entidades
- Lesson 21 - Metodología de Diseño (Pasos 5, 6 y 7) 5. Generar un diagrama conceptual, 6. Modelo lógico, 7. Identificar nuevos atributos que generan nuestras entidades débiles.
- Lesson 22 - Metodología de Diseño (Paso 8): Construir el Diagrama del Modelo Físico
- Lesson 23 - Metodología de Diseño (Paso 9): Pasar al estándar de la base de datos (SQL)
- Lesson 25 - Atomicidad y consistencia
    - Atomicidad: En una transacción atómica, una serie de operaciones en la base de datos ocurren todas, o no ocurre ninguna. La atomicidad previene que las actualizaciones a la base ocurren de forma parcial, lo cual podría ocasionar mayores problemas que rechazar la transacción entera. En otras palabras, la atomicidad significa indivisibilidad e irreducibilidad.
    - Consistencia: Asegurar que paso de un estado válido a otro estado Válido (Que el tipo de datos que se toma para realizar una transacción termina en el tipo de dato al que se quiere llegar, o bien que el resultado de una transacción no viole una restricción de mi BD).
    - Rollback: Operación que devuelve a la base a algún estado previo (deshaciendo cambios), asegurando así la atomícidad en una transacción.
    - Commit: Operación que consigna un conjunto de cambios de forma permanente, transacción efectiva (correcta) y finalizada.
- Lesson 26 - Aislamiento y durabilidad
    - Aislamiento: Esta propiedad asegura que una operación no puede afectar a otras. Esto asegura que la realización de dos transacciones sobre la misma información sean independientes y no generen ningún tipo de error. Esta propiedad define cómo y cuándo los cambios producidos por una operación se hacen visibles para las demás operaciones concurrentes. El aislamiento puede alcanzarse en distintos niveles, siendo el parámetro esencial a la hora de seleccionar SGBDs.
    - Durabilidad: (Persistencia). Esta propiedad asegura que una vez realizada la operación, ésta persistirá y no se podrá deshacer aunque falle el sistema y que de esta forma los datos sobrevivan de alguna manera.
- Lesson 27 - Bases de Datos In-Memory (Cambio de árboles a columnar)
- Lesson 27 - Otros tipos de Bases de Datos en la industria
    - Una base de datos orientada a grafos representa la información como nodos de un grafo y sus relaciones con las aristas del mismo, de manera que se pueda usar teoría de grafos para recorrer la base de datos ya que esta puede describir atributos de los nodos (entidades) y las aristas (relaciones).
- Lesson 27 - Bases de Datos In-Memory con indexación de columnar
- Lesson 41 - Normalización, llevando mi proyecto hasta tercera forma normal (segunda forma normal)
    - La normalización es el proceso mediante el cual se transforman datos complejos a un conjunto de estructuras de datos más pequeñas, que además de ser más simples y más estables, son más fáciles de mantener. También se puede entender la normalización como una serie de reglas que sirven para ayudar a los diseñadores de bases de datos a desarrollar un esquema que minimice los problemas de lógica. Cada regla está basada en la que le antecede. La normalización se adoptó porque el viejo estilo de poner todos los datos en un solo lugar, como un archivo o una tabla de la base de datos, era ineficiente y conducía a errores de lógica cuando se trataban de manipular los datos.
    - Primera Forma Normal:
        - Se refiere a simplicidad, es decir crear elementos en su mínima expresión.
        - Todos los atributos son atómicos. Un atributo es atómico si los elementos del dominio son simples e indivisibles.
        - La tabla contiene una clave primaria única.
        - La clave primaria no contiene atributos nulos.
        - No debe existir variación en el número de columnas.
        - Los Campos no clave deben identificarse por la clave (Dependencia Funcional)
        - Debe Existir una independencia del orden tanto de las filas como de las columnas, es decir, si los datos cambian de orden no deben cambiar sus significados
        - Esta forma normal elimina los valores repetidos dentro de una Base de Datos.
    - Segunda Forma Normal: La regla de la Segunda Forma Normal establece que todas las dependencias parciales se deben eliminar y separar dentro de sus propias tablas. Una dependencia parcial es un término que describe a aquellos datos que no dependen de la llave primaria de la tabla para identificarlos.
        - se relaciona con redundancia y dependencia pues lo que pretende es evitar datos repetidos
        - Dependencias Funcionales (Llaves foráneas) No tener datos que no son llaves que dependan entre si.
    - Tercera Forma Normal: Una tabla está normalizada en esta forma si todas las columnas que no son llave son funcionalmente dependientes por completo de la llave primaria y no hay dependencias transitivas.
        - habla de transitividad, es decir no puede haber campos que dependen indirectamente de una llave.
        - Comentamos anteriormente que una dependencia transitiva es aquella en la cual existen columnas que no son llave que dependen de otras columnas que tampoco son llave.
        - Cuando las tablas están en la Tercera Forma Normal se previenen errores de lógica cuando se insertan o borran registros. Cada columna en una tabla está identificada de manera única por la llave primaria,y no deben haber datos repetidos. Esto provee un esquema limpio y elegante, que es fácil de trabajar y expandir.
    - En cuarta Forma Normal: obligatoriamente no podemos repetir datos en una tabla, solo tenemos combinaciones únicas y todas las llaves van a poder ser si o si obligatoriamente llaves primarias.
    - En quinta Forma Normal: es importante tener 2 tablas que están en 4FN, cada dependencia de union (join) va a estar hecho por claves candidatas y no va puede estar hecho por condiciones que no se vayan a cumplir.
- Lesson 44 - DDL: Data Definition Language y DML: Data Manipulation Language
    - DDL: Data Definition Language
        - create table Permite crear una tabla.
        - create view Permite crear una vista.
        - create procedure Permite crear un proceso.
        - create index Permite crear un índice.
        - create schema Permite crear un esquema.
        - Nota:Alter aplica para “table, view y procedure”. Alter = Alterar.
    - DML: Data Manipulation Language
        - select Permite seleccionar uno o muchos atributos de una o muchas tablas.
        - join Permite combinar registros de dos o más tablas.
        - insert Permite insertar en una table una nueva tupla.
        - update Permite actualizar uno o muchos atributos.
        - delete Permite eliminar uno o muchos atributos.
        - replace Permite reemplazar un atributo.







