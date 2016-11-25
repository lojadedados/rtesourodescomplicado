#' @title getYRange define o intervalo do eixo Y que será visualizado no grafico
#' @author Rodrigo Almeida
#' @usage retorna intervalo que sera apresentado no eixo Y
#' @param infoApresentada: Informacao Apresentada na Serie
#' @return intervaloY: Intervalo do Eixo Y
#' @export
getYRange <- function(infoApresentada) {

  avaliacao <- as.numeric(levels(infoApresentada))[infoApresentada]

  minY = min(avaliacao)
  maxY = max(avaliacao)
  maxY = maxY + 0.1 * (maxY - minY)
  c(minY,maxY)

}
