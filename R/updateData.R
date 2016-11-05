#' @title update data
#' @description Funcao para atualizar dados do tesouro direto que estao na pasta data com o nome 'precotaxatesourodireto.csv'
#' @author Rodrigo Almeida - rodrigo@lojadedados.com.br
#' @export
updateData <- function() {
  url <- "https://www.tesourotransparente.gov.br/ckan/dataset/df56aa42-484a-4a59-8184-7676580c81e3/resource/796d2059-14e9-44e3-80c9-2d9e30b405c1/download/PrecoTaxaTesouroDireto.csv"
  s <- read.csv2(url)
  write.csv(x = s, file = "data/precotaxatesourodireto.csv", sep = ",")
  # TODO: Criar arquivo com a data da ultima atualizacao
}
