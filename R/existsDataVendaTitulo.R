#' @title exists data
#' @description Funcao para verificar se já existe localmente os dados do Tesouro Direto que estão na pasta data com o nome 'vendataxatesourodireto.csv'
#' @author Rodrigo Almeida
#' @return TRUE se já existe localmente os dados do Tesouro Direto, FALSE caso contrário
#' @export
existsDataVendaTitulo <- function() {

  file.exists("data/vendatesourodireto.csv")

}
