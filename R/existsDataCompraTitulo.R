#' @title exists data
#' @description Funcao para verificar se já existe localmente os dados do Tesouro Direto que estão na pasta data com o nome 'comprataxatesourodireto.csv'
#' @author Rodrigo Almeida
#' @return TRUE se já existe localmente os dados do Tesouro Direto, FALSE caso contrário
#' @export
existsDataCompraTitulo <- function() {

  file.exists("data/compratesourodireto.csv")

}
