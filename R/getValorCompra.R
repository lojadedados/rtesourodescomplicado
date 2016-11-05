#' @title get Valor compra Manhã
#' @description Funcao para recuperar o valor da compra do titulo na data da compra
#' @author Rodrigo Almeida - rodrigo@lojadedados.com.br
#' @param: dataCompra: Data da Compra do titulo no formato YYYY-MM-DD
getValorCompra <- function(dataCompra, tituloPublico, dataVencimento) {
  precotaxatesourodireto <- getData()
  filtrado <- filter(precotaxatesourodireto, Data.Base == format(as.Date(dataCompra), "%d/%m/%Y") &
                       Tipo.Titulo == tituloPublico &
                       Data.Vencimento == dataVencimento)
  filtrado$PU.Compra.Manha
}
