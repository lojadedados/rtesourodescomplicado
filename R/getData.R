#' @title get data
#' @description Funcao para recuperar dados do tesouro direto que estao na pasta data com o nome 'precotaxatesourodireto.csv'
#' @author Rodrigo Almeida
#' @export
getData <- function() {

    dataCarregamentoTesouroDireto <<- format(Sys.Date(), "%d/%m/%Y %H:%M")

    read.csv2("data/precotaxatesourodireto.csv", sep = ",")
}

