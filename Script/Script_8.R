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