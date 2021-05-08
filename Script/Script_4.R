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