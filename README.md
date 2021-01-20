README

Getting and Cleaning Data Course Project
2020
Datos: Human Activity Recognition Using Smartphones Dataset
Version 1.0


Cargar datos: Los datos los descargué directamente desde el link y el zip lo guardé en una carpeta. Cree un proyecto en R y hice una copia en github.

Conjunto de archivos: Los archivos son de "train" y "test", cada uno de ellos tiene asociado archivos de "sujeto" (Subject), "actividad" (Activity) y "caracteristicas" (Features). Por esta razón hay que descargar estos tres juegos de archivos. Por otro lado, caracteristicas es todo lo denotado con "X" y actividad es todas las variables denotadas con "Y"

Se cargan los archivos de Sujeto, Actividad y Característica

1. Fusiona los conjuntos de entrenamiento y prueba para crear un conjunto de datos.

Ahora se fusionar los datos de "train" y "test" uniendo las tablas de datos por las filas, se hace con la función rbind

Luego se le da nombre a las variables con la función name

Por ultimo, se unen todas las columnas usando la función cbind


Extrae solo las mediciones de la media y la desviación estándar de cada medición.

2. Extraer la Media y Desviación estándard de cada variable

Nombre de subconjunto de características (features) por medidas en la desviación estándar y media. Lo que se hará es seleccionar las variables que tienen media y desviación usando la función grep.

Extraerémos un Subconjunto los datos del marco de datos por nombres seleccionados de características (Features) con la función subset


3. Utiliza nombres de actividades descriptivos para nombrar las actividades en el conjunto de datos

Para esta actividad utilizamos el paquete data.table para utilizar la función setname
La funcipon merge nos permitirá unir los conjuntos de datos a través de la columna "activity"

4. Etiquete adecuadamente el conjunto de datos con nombres de variables descriptivos.

Los nombres de las variables están abreviadas, por ejemplo, 
t = time
Acc = Accelerometer
Gyro = Gyroscope
f = frequency
Mag = Magnitude
BodyBody = Body
Lo que se pide es reemplazarlas por los nombre completos en el marco de datos y se realiza con las funciones names y gsub


5. A partir del conjunto de datos del paso 4, crea un segundo conjunto de datos ordenado e independiente con el promedio de cada variable para cada actividad y cada tema.

Se crea un nuevo conjunto de datos agrupando por sujeto y actividad, luego se pide un resumen con la función funs, finalmente se escribe una nueba tabla con la función  write.table.
