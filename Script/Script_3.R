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