#'@title getGraficoComparativoCompraVenda
#' @description Funcao para geracao de grafico Comparando Volumes de Compra e Venda de títulos do Tesouro
#' @author Rodrigo Almeida
#' @export
#' @import highcharter dplyr xts
#' @param tituloPublico: Titulo Publico
#' @param dataVencimento: Data de vencimento do titulo (formato format = "%Y-%m-%d")
getGraficoComparativoCompraVenda <- function(tituloPublico,
                                             dataVencimento) {

    conjuntoTitulosComprados <- getDataCompraTitulo()
    conjuntoTitulosVendidos <- getDataVendaTitulo()

    #recupera o valor do titulo comprado para toda a distribuicao
    tituloComprado <- filter(conjuntoTitulosComprados, Tipo.Titulo == tituloPublico &
                             Vencimento.do.Titulo == dataVencimento)

    #recupera o valor do titulo comprado para toda a distribuicao
    tituloVendido <- filter(conjuntoTitulosVendidos, Tipo.Titulo == tituloPublico &
                            Vencimento.do.Titulo == dataVencimento)

    tituloComprado <- tituloComprado[, c(-1, -2, -4, -6)]
    tituloVendido <- tituloVendido[, c(-1, -2, -4, -5, -7)]

    colnames(tituloComprado) <- c("Data", "Valor")
    colnames(tituloVendido) <- c("Data", "Valor")

    tituloComprado$Valor <- as.numeric(as.character(tituloComprado$Valor))
    tituloVendido$Valor <- as.numeric(as.character(tituloVendido$Valor))


    dfTituloComprado <- data.frame(tituloComprado)
    dfTituloVendido <- data.frame(tituloVendido)

    xtsTituloComprado <- xts(x = dfTituloComprado[, -1], order.by = dfTituloComprado[, 1])
    xtsTituloVendido <- xts(x = dfTituloVendido[, -1], order.by = dfTituloVendido[, 1])


    titulo <- "Volume de Compra x Venda"
    subtitulo <- paste(tituloPublico, " com Vencimento em ", dataVencimento, sep = "")
    highchart(type = "stock") %>%
    hc_title(text = titulo) %>%
    hc_subtitle(text = subtitulo) %>%
    hc_add_series_xts(xtsTituloComprado, id = "Compra", name = "Compra") %>%
    hc_add_series_xts(xtsTituloVendido, id = "Venda", name = "Venda") %>%
    hc_add_theme(hc_theme_flat())


#    tituloPublico <- "Tesouro IPCA+"
#    dataVencimento <- "2035-05-15"
}
