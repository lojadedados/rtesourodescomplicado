#' @title getYRange define o intervalo do eixo Y que será visualizado no grafico
#' @author Rodrigo Almeida
#' @usage retorna intervalo que sera apresentado no eixo Y
#' @param infoApresentada: Informacao Apresentada na Serie
#' @return intervaloY: Intervalo do Eixo Y
getYRange <- function(infoApresentada) {

  avaliacao <- as.numeric(levels(infoApresentada))[infoApresentada]

  minY = min(avaliacao)
  maxY = max(avaliacao)
  c(minY,maxY)

}
