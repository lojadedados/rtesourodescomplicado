#' @title get Aliquota do Imposto de Renda
#' @description Funcao para recuperar aliquota IR
#' @author Rodrigo Almeida (rodrigo.almeida@gmail.com)
#' @param: diasUteis: quantidade de dias uteis
#' @export
getAliquotaIR <- function(diasUteis) {
  retorno <- 0
  if (diasUteis < 252/2) {
    retorno <- 0.225
  } else if (diasUteis < 252) {
    retorno <- 0.2
  } else if (diasUteis < 252*2) {
    retorno <- 0.175
  } else {
    retorno <- 0.15
  }

  retorno
}
