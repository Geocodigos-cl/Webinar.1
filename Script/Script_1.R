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