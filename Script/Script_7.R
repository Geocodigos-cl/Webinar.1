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