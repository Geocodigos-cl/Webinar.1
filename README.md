## Webinar N°1
En este webinar se explicarán los elementos básicos de R y el GUI RStudio, los cuales
están enumerados en el siguiente orden.

#### Scrip N°1 Paquetes
##### Ejemplo de Paquete (Packages)
##### https://cran.r-project.org/
```r
install.packages("fun")
library(fun)
x11()
mine_sweeper(width = 100, height = 100, cheat = TRUE)
```
##### Paquete de Sodoku
```r
install.packages("sudoku")
library(sudoku)
playSudoku()

install.packages("devtools")
devtools::install_github("gaborcsardi/praise")
library(praise)
praise()
```
#### Scrip N°2 Operaciones y funciones básicas
```r
5+6

5 * 5^4 - 88 * 15

1/0
```
#### Scrip N°3 Variables y funciones
##### Creacion de una variable numerica
```r
result1 <- 5+6
```
##### Observar la variable (esta operacion se puede realizar en la consola)
```r
result1
```
##### Crear un vector en funcion de una sequencia
```r
seq1 <-  seq(1,100, by = 1)
```
##### Variables de numeros
```r
a <- c(1,3,5,7,9)
x <- c(1:7)
```
##### Variable de variables
```r
vec1 <- c(x,a)
vec2 <- c(a,x)
```
##### Variable (vector) de caracteres, que serán usados para nombres de filas en un 
##### marco de datos
```r
names <- c("a","b","c","d", "e", "f", "g")
```
##### Convertir a un vector de caracteres.
```r
vecChar <- as.character(c(a,x))
```
#### Scrip N°4 Data frame y Plots

##### Convertir el vector a un data frame.
```r
df <- as.data.frame(x, row.names = names )
```
##### Observar un resumen de un data frame.
```r
summary(df)
```
#####  c() coercionar dentro de un vector, 
```r
prec_avg <-  c(56,46,50,53,69,83,83,80,62,55,60,63)
```
##### Hacemos plot para observar creado
```r
plot(prec_avg,
     pch = 19,
     cex = 2,
     col = "red")
```
##### Agregar lineas en el plot
```r
lines(lowess(prec_avg, f = .2))
```
##### ggplot test df plot
```r
list1 <- sample(100)
list2 <- sample(100)

df <- data.frame(list1,list2)

install.packages("ggplot2")
library(ggplot2)

p1 <- ggplot(df, aes( x = list1, y = list2)) + geom_point(color = "red") + 
  geom_smooth(method = "lm", se = TRUE) 
```
#### Scrip N°4  Estructura de un data frame.
```r
df
```
#### Scrip N°5 Importar / exportar un data frame

##### Para trabajar esta informacion debemos seleccionar al carpeta de destino
##### donde se descargara el data frame externo. Para esto realizaremos:
```r
setwd("la/ruta/a/tu/carpeta/")

install.packages("RCurl")
library(RCurl)
```
##### Importar data frame (desde internet en este caso)
```r
df <- read.csv("https://raw.githubusercontent.com/wegmann/R_data/master/Steigerwald_sample_points_all_data_subset_withNames.csv")
```
##### Observar data frame
```r
head(df)
tail(df)
names(df)
class(df)
dim(df)
plot(df$TimeScan.mNDWImax)
```
##### Exportar data frame
# el nombre del archivo y su extension pueden variar.
```r
write.csv(df, "output.csv")
```
#### Scrip N°6 Creación de data frame

##### Indexando informacion en una sequencia 
```r
x <-seq(1,1000,10)
```
##### Seleccionando el o los valores de un vector
```r
x[24]
x[1:25]
```
##### Obteniendo el numero total de variables del vector (length significa largo)
```r
len <- length(x)
```
##### Extracción del ultimo valor
```r
x[len]
```
##### Extraccion de todo menos el ultimo valor
```r
x[-len]
```
##### Creamos una nueva variable con los numeros 1, 4 y 6
```r
idx <- c(1,4,6)
```
##### Realizamos una busqueda en el vector numero x en las posiciones dadas por la 
##### variable idx
```r
x[idx]
```
##### Busqueda de todos los números que no estás en las posiciones de la variable idx
```r
x[-idx]
```
##### Una consulta boolean
```r
xdata <- (x < 10) | (x >= 30)  # La respuesta es Verdadero o Falso
x[x<10|x>30]                   # Respuesta con limites

x2 <-  numeric(length(x))   # remplazar valores de vector
x2[x<=30] <-  1
x2[(x>30)&(x<500)] <-  2
x2[x>=500] <-  3
x2
```
#### Scrip N°7 Modificar data frame
```r
install.packages("car")
library(car)

x2 <-  recode(x,"0:50 = 1; 50:500 = 2; else = 3")

summary(x)
sum(x)
cumsum(x)

rev(x)
sort(x,decreasing=T)
```
##### Bonus, Datos en una matrix
```r
m1 <- matrix(x, nrow = 10, byrow)

m1[2,]
m1[,2]
m1[2,2]
```
##### Creación de una matrix desde un vector de datos 
##### -> convertir a Data Frame -> agregar nombres de columnas
```r
numbers_1 <- rnorm(1000, mean = 0, sd = 1)
mat_1 <- matrix(numbers_1, nrow = 250, ncol = 4)
mat_1

df_1 <- data.frame(mat_1)
names(df_1) <- c("var1","var2","var3","var4")

scatterplot(df_1$var1,df_1$var2)
boxplot(df_1)
```
##### Indexacion de un data frame (query data)
```r
test <-  data.frame(A=c(1,2,3), B=c("aB1","aB2","aB3"))
test
```
##### Todos hacen lo mismo
```r
test[,1]
test[,"A"]
test$A

test$A[1:2]
test[2:3,1:2]
```
##### Un poco más complejo
```r
df_1 <- data.frame(plot="location_name_1", measure1=runif(100) * 1000, 
                   measure2=round(runif(100)*100), value =rnorm(100,2,1),
                   ID=rep(LETTERS,100)[1:100])

df_2 <- data.frame(plot="location_name_2", measure1=runif(50) * 100, 
                   measure2=round(runif(50)*10), value =rnorm(50),
                   ID=rep(LETTERS,50)[1:50])
```
##### Pegar filas
```r
df <- rbind(df_1,df_2)
head(df)
```
##### Mirar data frame con una condición
```r
View(df[80:105,c("plot","measure1","measure2")])
```
#### Scrip N°8 Función plot y Parámetros plot
##### Hacemos plot para observar creado
```r
plot(prec_avg,
     pch = 19,
     cex = 2,
     col = "red")
```
##### Agregar lineas en el plot
```r
lines(lowess(prec_avg, f = .2))
```
##### ggplot test df plot
```r
list1 <- sample(100)
list2 <- sample(100)
```
##### Unir listas en un data frame
```r
df <- data.frame(list1,list2)
```
##### Gráficos y añadir elementos
```r
install.packages("ggplot2")
library(ggplot2)

p1 <- ggplot(df, aes( x = list1, y = list2)) + geom_point(color = "red") + 
  geom_smooth(method = "lm", se = TRUE)
```