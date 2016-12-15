#'@title getGraficoComparativoCompraVenda
#' @description Funcao para geracao de grafico Comparando Volumes de Compra e Venda de títulos do Tesouro
#' @author Rodrigo Almeida
#' @export
#' @import highcharter xts
getGraficoSelic <- function() {

  conjuntoSelic <- getDataSelic()
  selicFiltrado <- filter(conjuntoSelic, data >= "2000-01-01")

  dfSelic <- data.frame(selicFiltrado)

  xtsSelic <- xts(x = dfSelic[, -1], order.by = dfSelic[, 1])


  titulo <- "Taxa Selic"
  subtitulo <- "Indicadores Selic a partir do ano 2000"

  highchart(type = "stock") %>%
    hc_title(text = titulo) %>%
    hc_subtitle(text = subtitulo) %>%
    hc_add_series_xts(xtsSelic, id = "Taxa", name = "Taxa") %>%
    hc_add_theme(hc_theme_flat())
}
