#' @title getXTSTD Recupera DADOS no formato XTS para visualização
#' @author Rodrigo Almeida
#' @import xts TTR
#' @usage retorna nome dos titulos para Consulta
#' @param dataBase: Data Base do Titulo Publico (serie temporal)
#' @param infoApresentada: Um dos seguintes: Taxa.Compra.Manha, Taxa.Venda.Manha, PU.Compra.Manha, PU.Venda.Manha, PU.Base.Manha
#' @param janelaLonga de avaliação da media movel exponencial
#' @param janelaCurta de avaliação da media movel exponencial
getXTSTD <- function(dataBase, infoApresentada, janelaLonga, janelaCurta) {

  # Para o entendimento sobre medias moveis:
  # http://www.tororadar.com.br/investimento/analise-tecnica/medias-moveis

  ratioLonga <- 2/(janelaLonga + 1)
  saidaEMALonga <- EMA(infoApresentada, n = janelaLonga, ratio = 1/2)

  ratioCurta <- 2/(janelaCurta + 1)
  saidaEMACurta <- EMA(infoApresentada, n = janelaCurta, ratio = 1/2)

  Data.Base <- as.POSIXct(strptime(x = as.character(dataBase), format = "%d/%m/%Y"))
  Data.Apresentada <- as.factor(infoApresentada)
  EMALonga <- as.numeric(saidaEMALonga)
  EMACurta <- as.numeric(saidaEMACurta)

  resultado <- data.frame(Data.Base,Data.Apresentada,EMALonga,EMACurta)

  saida <- xts(x = resultado[,-1], order.by = resultado[,1])
  saida
}
