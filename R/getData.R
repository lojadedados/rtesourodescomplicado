#' @title get data
#' @description Funcao para recuperar dados do tesouro direto que estao na pasta data com o nome 'precotaxatesourodireto.csv'
#' @author Rodrigo Almeida
getData <- function() {

  if (!exists("dataCarregamentoTesouroDireto")) {
    dataCarregamentoTesouroDireto <<- Sys.Date()
  }

  # A cada dois dias, atualizar os dados do tesouro direto
  if ((!exists("precotaxatesourodireto")) || (difftime(Sys.Date(),dataCarregamentoTesouroDireto) > 2)) {
    dataCarregamentoTesouroDireto <<- Sys.Date()
    precotaxatesourodireto <- read.csv2("data/precotaxatesourodireto.csv", sep = ",")
  }

  precotaxatesourodireto
}

