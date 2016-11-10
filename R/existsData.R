#' @title exists data
#' @description Funcao para verificar se já existe localmente os dados do Tesouro Direto que estão na pasta data com o nome 'precotaxatesourodireto.csv'
#' @author Filipe Marques
#' @return TRUE se já existe localmente os dados do Tesouro Direto, FALSE caso contrário
#' @export
existsData <- function() {

  exists("data/precotaxatesourodireto.csv")

}
