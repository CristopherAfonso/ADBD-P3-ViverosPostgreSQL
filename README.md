# Administración y Diseño de Bases de Datos
## Práctica 3 - Viveros (Modelo Relacional, PostgreSQL)
## Autores
- Cristopher Manuel Afonso Mora (alu0101402031@ull.edu.es)
- Laura Del Mar Jerez Ramirez (alu0101688619@ull.edu.es)
## Enunciado de la Práctica
### Objetivos
Los principales objetivos de esta práctica son los siguientes:
- Practicar el paso de modelos entidad-relación a modelos relacionales.
- Aprender a utilizar PostgreSQL para la realización de operaciones básicas.
### Descripción
Partiendo del modelo entidad-relación sobre viveros ya elaborado, realice el modelo relacional asociado a este escenario. Siéntase libre para modificar el modelo entidad-relación creado si considera que puede mejorarlo.

Debe generar un script SQL para PostgreSQL con las siguientes características:
1. Debe crear una base de datos **viveros**.
2.  Debe construir las tablas del modelo relacional. Elija para cada tabla los tipos de atributos más adecuados, las restricciones tipo **CHECK** así como las restricciones necesarias para realizar las operaciones de eliminación o actualización de forma oportuna (en cascada, por defecto, etc.).
3.  Debe definir correctamente los atributos de las tablas que sean derivados (calculados) en el modelo entidad-relación.
4.  Incluya al menos 5 filas en cada una de las tablas creadas. Las inserciones deben abordar todos los escenarios posibles en las tablas involucradas.
5.  Incluya ejemplos representativos de las operaciones **DELETE**.
6.  Antes de realizar la entrega, compruebe que puede importar correctamente el script SQL generado en **PostgreSQL**.

### Recursos
- [PostgreSQL](https://www.postgresql.org/)
- [Draw.io](https://www.drawio.com/)
## Entrega
### Imagen del Modelo Entidad-Relación de los viveros
![](https://github.com/CristopherAfonso/ADBD-P3-ViverosPostgreSQL/blob/main/images/ModeloEntidadRelacion.jpg)

### Imágenes del diseño relacional realizado
#### Diseño Relacional Hecho Digital
![](https://github.com/CristopherAfonso/ADBD-P3-ViverosPostgreSQL/blob/main/images/Dise%C3%B1oRelacionalDigital.jpeg)
#### Diseño Relacional A Mano
![](https://github.com/CristopherAfonso/ADBD-P3-ViverosPostgreSQL/blob/main/images/Dise%C3%B1oRelacionalTablas.jpeg)
![](https://github.com/CristopherAfonso/ADBD-P3-ViverosPostgreSQL/blob/main/images/Dise%C3%B1oRelacionalFilas.jpeg)

### Imágenes con la salida de un **SELECT** de cada tabla de la base de datos
![](https://github.com/CristopherAfonso/ADBD-P3-ViverosPostgreSQL/blob/main/images/Tablas1_5.png)
![](https://github.com/CristopherAfonso/ADBD-P3-ViverosPostgreSQL/blob/main/images/Tablas6_10.png)