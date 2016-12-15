#' @title exists data
#' @description Funcao para verificar se já existe localmente os dados do Tesouro Direto que estão na pasta data com o nome 'selic.csv'
#' @author Rodrigo Almeida
#' @return TRUE se já existe localmente os dados do Tesouro Direto, FALSE caso contrário
#' @export
existsDataSelic <- function() {

  file.exists("data/selic.csv")

}
