#' @title getXTSTD Recupera DADOS no formato XTS para visualização
#' @author Rodrigo Almeida
#' @import xts TTR
#' @usage retorna nome dos titulos para Consulta
#' @param tituloPublico: Titulo Publico
#' @param dataVencimento: Data de vencimento do titulo
#' @param janelaLonga de avaliação da media movel exponencial
#' @param janelaCurta de avaliação da media movel exponencial
#' @param tipoInfo: Um dos seguintes: Taxa.Compra.Manha, Taxa.Venda.Manha, PU.Compra.Manha, PU.Venda.Manha, PU.Base.Manha
getXTSTD <- function(tituloPublico, dataVencimento, janelaLonga, janelaCurta, tipoInfo) {

  precotaxatesourodireto <- getData()
  titulo <- filter(precotaxatesourodireto, Tipo.Titulo == tituloPublico &
                     Data.Vencimento == dataVencimento)
  titulo <- titulo[,c(-1,-2,-3)]
  infoApresentada <- switch (tipoInfo,
          Taxa.Compra.Manha = titulo$Taxa.Compra.Manha,
          Taxa.Venda.Manha = titulo$Taxa.Venda.Manha,
          PU.Compra.Manha = titulo$PU.Compra.Manha,
          PU.Venda.Manha = titulo$PU.Venda.Manha,
          PU.Base.Manha = titulo$PU.Base.Manha
  )

  # Para o entendimento sobre medias moveis:
  # http://www.tororadar.com.br/investimento/analise-tecnica/medias-moveis

  ratioLonga <- 2/(janelaLonga + 1)
  saidaEMALonga <- EMA(infoApresentada, n = janelaLonga, ratio=ratioLonga)

  ratioCurta <- 2/(janelaCurta + 1)
  saidaEMACurta <- EMA(infoApresentada, n = janelaCurta, ratio=ratioCurta)

  resultado <- data.frame(Data.Base=as.POSIXct(strptime(x = as.character(titulo$Data.Base), format = "%d/%m/%Y")),
                          Data.Apresentada=as.factor(infoApresentada),
                          EMALonga=as.numeric(saidaEMALonga),
                          EMACurta=as.numeric(saidaEMACurta))

  saida <- xts(x = resultado[,-1], order.by = resultado[,1])
  saida
}
