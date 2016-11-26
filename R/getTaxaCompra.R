#' @title get Taxa do Papel no dia da Compra
#' @description Funcao para recuperar a taxa do papel no dia da Compra
#' @author Rodrigo Almeida (rodrigo.almeida@gmail.com)
#' @param: dataCompra: Data da Compra do titulo no formato DD/MM/YYYY
#' @param: tituloPublico
#' @param: dataVencimento: Data de Vencimento no formato DD/MM/YYYY
#' @export
getTaxaCompra <- function(dataCompra, tituloPublico, dataVencimento) {
  dado <- getData()
  dataCompra <- as.Date(dataCompra, format = "%d/%m/%Y")
  dataVencimento <- as.Date(dataVencimento, format = "%d/%m/%Y")
  filtrado <- filter(dado, Data.Base == dataCompra &
                       Tipo.Titulo == tituloPublico &
                       Data.Vencimento == dataVencimento)
  filtrado$Taxa.Compra.Manha
}
