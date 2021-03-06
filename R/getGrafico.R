#' @title getGrafico
#' @description Funcao para geracao de grafico do Tesouro
#' @author Rodrigo Almeida
#' @export
#' @import dygraphs
#' @param tituloPublico: Titulo Publico
#' @param dataVencimento: Data de vencimento do titulo (formato format = "%Y-%m-%d")
#' @param janelaLonga de avaliação da media movel exponencial
#' @param janelaCurta de avaliação da media movel exponencial
#' @param tipoInfo: Um dos seguintes: Taxa.Compra.Manha, Taxa.Venda.Manha, PU.Compra.Manha, PU.Venda.Manha, PU.Base.Manha
#' @param dataLimiteInferiorEixoX: data Limite Inferior a ser apresentada no Eixo X (formato format = "%Y-%m-%d")
#' @param dataLimiteSuperiorEixoX: data Limite Superior a ser apresentada no Eixo X (formato format = "%Y-%m-%d")
#' @param MME12: Apresentar Media Movel de 12 dias
#' @param MME26: Apresentar Media Movel de 26 dias
getGrafico <- function(tituloPublico,
                       dataVencimento,
                       janelaLonga,
                       janelaCurta,
                       tipoInfo,
                       dataLimiteInferiorEixoX = "2015-01-01",
                       dataLimiteSuperiorEixoX = "2016-11-15",
                       MMECurta,
                       MMELonga) {

        # recupera a informacao
        precotaxatesourodireto <- getData()

        # padronizando o uso das datas como asDate
        dataVencimento <- as.Date(dataVencimento, format = "%Y-%m-%d")


        # data inferior de referencia para range do eixo X (por padrao 01/01/2015)
        dtLimiteInferior <- as.Date(dataLimiteInferiorEixoX, format = "%Y-%m-%d")

        # data superior de referencia para range do eixo X (por padrao 15/11/2016)
        dtLimiteSuperior <- as.Date(dataLimiteSuperiorEixoX, format = "%Y-%m-%d")

        # Principalmente os casos onde trabalhamos com titulos vencidos antes de 2015
        if (dataVencimento < dtLimiteInferior) {
            dtLimiteInferior <- dataVencimento - 365
            dtLimiteSuperior <- dataVencimento
        }


        # as.Date(as.character(Data.Base), format = "%Y-%m-%d")
        #recupera o valor do titulo para toda a distribuicao
        titulo <- filter(precotaxatesourodireto, Tipo.Titulo == tituloPublico &
                             Data.Vencimento == dataVencimento &
                             Data.Base > dtLimiteInferior)

        # Informacao que sera plotada no grafico
        infoApresentada <- switch (tipoInfo,
                                     Taxa.Compra.Manha = titulo$Taxa.Compra.Manha,
                                     Taxa.Venda.Manha = titulo$Taxa.Venda.Manha,
                                     PU.Compra.Manha = titulo$PU.Compra.Manha,
                                     PU.Venda.Manha = titulo$PU.Venda.Manha,
                                     PU.Base.Manha = titulo$PU.Base.Manha
          )


        # Serie Temporal para o Grafico
        saida  <- getXTSTD(titulo$Data.Base,
                       infoApresentada,
                       janelaLonga,
                       janelaCurta,
                       MMECurta,
                       MMELonga)

        labelGraficoY2 = paste(" + MMEs de ",janelaCurta," e ",janelaLonga," dias",sep = " ")
        tituloGrafico = paste(tituloPublico, dataVencimento,labelGraficoY2, sep = " ")


        labelInfo <- switch(tipoInfo,
                                   Taxa.Compra.Manha = "Taxa de Compra Manha",
                                   Taxa.Venda.Manha = "Taxa de Venda Manha",
                                   PU.Compra.Manha = "Preco Unitario de Compra Manha",
                                   PU.Venda.Manha = "Preco Unitario de Venda Manha",
                                   PU.Base.Manha = "Preco Unitario Base (Manha)"
        )


        labelResumida <- switch(tipoInfo,
                             Taxa.Compra.Manha = "Taxa de Compra",
                             Taxa.Venda.Manha = "Taxa de Venda",
                             PU.Compra.Manha = "Compra",
                             PU.Venda.Manha = "Venda",
                             PU.Base.Manha = "Base"
        )

        outputGrafico <- NULL

        if (MMECurta && MMELonga) {
          outputGrafico <-  dygraph(saida, main = tituloGrafico, group = "TD") %>%
            dyAxis("y", label = labelInfo, valueRange = getYRange(infoApresentada)) %>%
            dyAxis("y2", label = labelGraficoY2, valueRange = getYRange(infoApresentada)) %>%
            dySeries("Data.Apresentada", label = labelResumida) %>%
            dySeries("EMALonga", label = paste("MME ", janelaLonga)) %>%
            dySeries("EMACurta", label = paste("MME ", janelaCurta)) %>%
            dyOptions(drawPoints = TRUE, pointSize = 2,axisLineWidth = 1.5, fillGraph = TRUE, drawGrid = TRUE) %>%
            dyRangeSelector(dateWindow = c(dtLimiteInferior, dtLimiteSuperior)) %>%
            dyLegend(show = "follow", width = 200) %>%
            dyHighlight(highlightSeriesOpts = list(strokeWidth = 1))
        } else if (MMECurta) {
          outputGrafico <-  dygraph(saida, main = tituloGrafico, group = "TD") %>%
            dyAxis("y", label = labelInfo, valueRange = getYRange(infoApresentada)) %>%
            dyAxis("y2", label = labelGraficoY2, valueRange = getYRange(infoApresentada)) %>%
            dySeries("Data.Apresentada", label = labelResumida) %>%
            dySeries("EMACurta", label = paste("MME ", janelaCurta)) %>%
            dyOptions(drawPoints = TRUE, pointSize = 2,axisLineWidth = 1.5, fillGraph = TRUE, drawGrid = TRUE) %>%
            dyRangeSelector(dateWindow = c(dtLimiteInferior, dtLimiteSuperior)) %>%
            dyLegend(show = "follow", width = 200) %>%
            dyHighlight(highlightSeriesOpts = list(strokeWidth = 1))
        } else if (MMELonga) {
          outputGrafico <-  dygraph(saida, main = tituloGrafico, group = "TD") %>%
            dyAxis("y", label = labelInfo, valueRange = getYRange(infoApresentada)) %>%
            dyAxis("y2", label = labelGraficoY2, valueRange = getYRange(infoApresentada)) %>%
            dySeries("Data.Apresentada", label = labelResumida) %>%
            dySeries("EMALonga", label = paste("MME ", janelaLonga)) %>%
            dyOptions(drawPoints = TRUE, pointSize = 2,axisLineWidth = 1.5, fillGraph = TRUE, drawGrid = TRUE) %>%
            dyRangeSelector(dateWindow = c(dtLimiteInferior, dtLimiteSuperior)) %>%
            dyLegend(show = "follow", width = 200) %>%
            dyHighlight(highlightSeriesOpts = list(strokeWidth = 1))
        } else {
          # TODO: Ajustar grafico para não apresentar MMEs
          outputGrafico <-  dygraph(saida, main = tituloGrafico, group = "TD") %>%
            dyAxis("y", label = labelInfo, valueRange = getYRange(infoApresentada)) %>%
            dyAxis("y2", label = labelGraficoY2, valueRange = getYRange(infoApresentada)) %>%
            dySeries("Data.Apresentada", label = labelResumida) %>%
            dySeries("EMALonga", label = paste("MME ", janelaLonga)) %>%
            dySeries("EMACurta", label = paste("MME ", janelaCurta)) %>%
            dyOptions(drawPoints = TRUE, pointSize = 2,axisLineWidth = 1.5, fillGraph = TRUE, drawGrid = TRUE) %>%
            dyRangeSelector(dateWindow = c(dtLimiteInferior, dtLimiteSuperior)) %>%
            dyLegend(show = "follow", width = 200) %>%
            dyHighlight(highlightSeriesOpts = list(strokeWidth = 1))
        }

        outputGrafico

}
