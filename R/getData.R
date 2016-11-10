#' @title get data
#' @description Funcao para recuperar dados do tesouro direto que estao na pasta data com o nome 'precotaxatesourodireto.csv'
#' @author Rodrigo Almeida
#' @export
getData <- function() {

  if (!exists("dataCarregamentoTesouroDireto")) {

    dataCarregamentoTesouroDireto <<- Sys.Date()
  }

  if ( !exists("precotaxatesourodireto") ) {

    dataCarregamentoTesouroDireto <<- Sys.Date()
    precotaxatesourodireto <- read.csv2("data/precotaxatesourodireto.csv", sep = ",")
  }

  precotaxatesourodireto
}

