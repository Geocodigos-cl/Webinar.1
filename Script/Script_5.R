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