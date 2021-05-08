# Paquetes
# Ejemplo de Paquete (Packages)
# https://cran.r-project.org/
install.packages("fun")
library(fun)
x11()
mine_sweeper(width = 100, height = 100, cheat = TRUE)

# Paquete de Sodoku
install.packages("sudoku")
library(sudoku)
playSudoku()

install.packages("devtools")
devtools::install_github("gaborcsardi/praise")
library(praise)
praise()

# Operaciones y funciones básicas

5+6

5 * 5^4 - 88 * 15

1/0

# Variables y funciones

# Creacion de una variable numerica
result1 <- 5+6
# Observar la variable (esta operacion se puede realizar en la consola)
result1

# Crear un vector en funcion de una sequencia
seq1 <-  seq(1,100, by = 1)

# Variables de numeros
a <- c(1,3,5,7,9)
x <- c(1:7)

# Variable de variables
vec1 <- c(x,a)
vec2 <- c(a,x)

# Variable (vector) de caracteres, que serán usados para nombres de filas en un 
# marco de datos
names <- c("a","b","c","d", "e", "f", "g")

# Convertir a un vector de caracteres.
vecChar <- as.character(c(a,x))

# Data frame y Plots

# Convertir el vector a un data frame.
df <- as.data.frame(x, row.names = names )

# Observar un resumen de un data frame.
summary(df)

#  c() coercionar dentro de un vector, 
prec_avg <-  c(56,46,50,53,69,83,83,80,62,55,60,63)

# Hacemos plot para observar creado
plot(prec_avg,
     pch = 19,
     cex = 2,
     col = "red") 
# Agregar lineas en el plot
lines(lowess(prec_avg, f = .2))

# ggplot test df plot

list1 <- sample(100)
list2 <- sample(100)

df <- data.frame(list1,list2)

install.packages("ggplot2")
library(ggplot2)

p1 <- ggplot(df, aes( x = list1, y = list2)) + geom_point(color = "red") + 
  geom_smooth(method = "lm", se = TRUE) 

# Estructura de un data frame.
# Plot de df y analisis en PPT
df

# Importar / exportar un data frame

# Para trabajar esta informacion debemos seleccionar al carpeta de destino
# donde se descargara el data frame externo. Para esto realizaremos:

setwd("la/ruta/a/tu/carpeta/")

install.packages("RCurl")
library(RCurl)

# Importar data frame (desde internet en este caso)
df <- read.csv("https://raw.githubusercontent.com/wegmann/R_data/master/Steigerwald_sample_points_all_data_subset_withNames.csv")

# Observar data frame
head(df)
tail(df)
names(df)
class(df)
dim(df)
plot(df$TimeScan.mNDWImax)

# Exportar data frame
# el nombre del archivo y su extension pueden variar.
write.csv(df, "output.csv")

# Creación de data frame

# Indexando informacion en una sequencia 
x <-seq(1,1000,10)

# Seleccionando el o los valores de un vector
x[24]
x[1:25]

# Obteniendo el numero total de variables del vector (length significa largo)
len <- length(x)
# Extracción del ultimo valor
x[len]
# Extraccion de todo menos el ultimo valor
x[-len]

# Creamos una nueva variable con los numeros 1, 4 y 6
idx <- c(1,4,6)
# Realizamos una busqueda en el vector numero x en las posiciones dadas por la 
# variable idx
x[idx]
# Busqueda de todos los números que no estás en las posiciones de la variable idx
x[-idx]

# Una consulta boolean
xdata <- (x < 10) | (x >= 30)  # La respuesta es Verdadero o Falso
x[x<10|x>30]                   # Respuesta con limites

x2 <-  numeric(length(x))   # remplazar valores de vector
x2[x<=30] <-  1
x2[(x>30)&(x<500)] <-  2
x2[x>=500] <-  3
x2

# Modificar data frame

install.packages("car")
library(car)

x2 <-  recode(x,"0:50 = 1; 50:500 = 2; else = 3")

summary(x)
sum(x)
cumsum(x)

rev(x)
sort(x,decreasing=T)

# Bonus, Datos en una matrix

m1 <- matrix(x, nrow = 10, byrow)

m1[2,]
m1[,2]
m1[2,2]

# Creación de una matrix desde un vector de datos 
# -> convertir a Data Frame -> agregar nombres de columnas

numbers_1 <- rnorm(1000, mean = 0, sd = 1)
mat_1 <- matrix(numbers_1, nrow = 250, ncol = 4)
mat_1

df_1 <- data.frame(mat_1)
names(df_1) <- c("var1","var2","var3","var4")

scatterplot(df_1$var1,df_1$var2)
boxplot(df_1)

# Indexacion de un data frame (query data)
test <-  data.frame(A=c(1,2,3), B=c("aB1","aB2","aB3"))
test

# Todos hacen lo mismo

test[,1]
test[,"A"]
test$A

test$A[1:2]
test[2:3,1:2]

# Un poco más complejo
df_1 <- data.frame(plot="location_name_1", measure1=runif(100) * 1000, 
                   measure2=round(runif(100)*100), value =rnorm(100,2,1),
                   ID=rep(LETTERS,100)[1:100])

df_2 <- data.frame(plot="location_name_2", measure1=runif(50) * 100, 
                   measure2=round(runif(50)*10), value =rnorm(50),
                   ID=rep(LETTERS,50)[1:50])

# Pegar filas
df <- rbind(df_1,df_2)
head(df)

# Mirar data frame con una condición
View(df[80:105,c("plot","measure1","measure2")])

# Función plot y Parámetros plot

# Hacemos plot para observar creado
plot(prec_avg,
     pch = 19,
     cex = 2,
     col = "red")

# Agregar lineas en el plot
lines(lowess(prec_avg, f = .2))

# ggplot test df plot
list1 <- sample(100)
list2 <- sample(100)

# Unir listas en un data frame
df <- data.frame(list1,list2)

# Gráficos y añadir elementos

install.packages("ggplot2")
library(ggplot2)

p1 <- ggplot(df, aes( x = list1, y = list2)) + geom_point(color = "red") + 
  geom_smooth(method = "lm", se = TRUE) 