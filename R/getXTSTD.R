#' @title getXTSTD Recupera DADOS no formato XTS para visualização
#' @author Rodrigo Almeida
#' @import xts TTR
#' @usage retorna nome dos titulos para Consulta
#' @param dataBase: Data Base do Titulo Publico (serie temporal)
#' @param infoApresentada: Um dos seguintes: Taxa.Compra.Manha, Taxa.Venda.Manha, PU.Compra.Manha, PU.Venda.Manha, PU.Base.Manha
#' @param janelaLonga de avaliação da media movel exponencial
#' @param janelaCurta de avaliação da media movel exponencial
getXTSTD <- function(dataBase,
                     infoApresentada,
                     janelaLonga,
                     janelaCurta,
                     MMECurta,
                     MMELonga) {

  # Para o entendimento sobre medias moveis:
  # http://www.tororadar.com.br/investimento/analise-tecnica/medias-moveis

  ratioLonga <- 2/(janelaLonga + 1)
  saidaEMALonga <- EMA(infoApresentada, n = janelaLonga)

  ratioCurta <- 2/(janelaCurta + 1)
  saidaEMACurta <- EMA(infoApresentada, n = janelaCurta)

  Data.Apresentada <- as.factor(infoApresentada)
  EMALonga <- as.numeric(saidaEMALonga)
  EMACurta <- as.numeric(saidaEMACurta)

  resultado <- NULL
  # TODO: Ajustar grafico para não apresentar MMEs
  if (MMECurta && MMELonga) {
    resultado <- data.frame(dataBase,Data.Apresentada,EMALonga,EMACurta)
  } else if (MMECurta) {
    resultado <- data.frame(dataBase,Data.Apresentada,EMACurta)
  } else if (MMELonga) {
    resultado <- data.frame(dataBase,Data.Apresentada,EMALonga)
  } else {
    resultado <- data.frame(dataBase,Data.Apresentada,EMALonga,EMACurta)
  }



  saida <- xts(x = resultado[,-1], order.by = resultado[,1])
  saida
}
