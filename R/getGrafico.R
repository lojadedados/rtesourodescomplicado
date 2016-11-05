#' @title getGrafico
#' @description Funcao para geracao de grafico do Tesouro
#' @author Rodrigo Almeida
#' @export
#' @import dygraphs
#' @param tituloPublico: Titulo Publico
#' @param dataVencimento: Data de vencimento do titulo
#' @param janelaLonga de avaliação da media movel exponencial
#' @param janelaCurta de avaliação da media movel exponencial
#' @param tipoInfo: Um dos seguintes: Taxa.Compra.Manha, Taxa.Venda.Manha, PU.Compra.Manha, PU.Venda.Manha, PU.Base.Manha
getGrafico <- function(tituloPublico, dataVencimento, janelaLonga, janelaCurta, tipoInfo ) {
      saida  <- getXTSTD(tituloPublico,
                       dataVencimento,
                       janelaLonga,
                       janelaCurta,
                       tipoInfo)

      labelGraficoY2 = paste(" + Media Movel Exponencial com Janela de",janelaCurta,"e",janelaLonga,"dias",sep = " ")
      tituloGrafico = paste(tituloPublico, dataVencimento,labelGraficoY2, sep = " ")


      labelInfo <- switch (tipoInfo,
                                 Taxa.Compra.Manha = "Taxa de Compra Manha",
                                 Taxa.Venda.Manha = "Taxa de Venda Manha",
                                 PU.Compra.Manha = "Preco Unitario de Compra Manha",
                                 PU.Venda.Manha = "Preco Unitario de Venda Manha",
                                 PU.Base.Manha = "Preco Unitario Base (Manha)"
      )


      labelResumida <- switch (tipoInfo,
                           Taxa.Compra.Manha = "Taxa de Compra",
                           Taxa.Venda.Manha = "Taxa de Venda",
                           PU.Compra.Manha = "Compra",
                           PU.Venda.Manha = "Venda",
                           PU.Base.Manha = "Base"
      )

      dygraph(saida, main = tituloGrafico, group = "TD") %>%
        dyAxis("y", label = labelInfo, valueRange = c(1300, 2000)) %>%
        dyAxis("y2", label = labelGraficoY2, valueRange = c(1300, 2000)) %>%
        dySeries("Data.Apresentada", label = labelResumida) %>%
        dySeries("EMALonga", label = "Media Movel Longa (100 dias)") %>%
        dySeries("EMACurta", label = "Media Movel Curta (10 dias)") %>%
        dyOptions(drawPoints = TRUE, pointSize = 2,axisLineWidth = 1.5, fillGraph = TRUE, drawGrid = TRUE) %>%
        dyRangeSelector(dateWindow = c("2015-01-12", "2016-11-01")) %>%
        dyLegend(show = "follow", width = 200) %>%
        dyHighlight(highlightSeriesOpts = list(strokeWidth = 1))
}
