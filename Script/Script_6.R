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