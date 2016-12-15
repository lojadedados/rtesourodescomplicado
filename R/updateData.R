#' @title update data
#' @description Funcao para atualizar dados do tesouro direto que estao na pasta data
#' @author Rodrigo Almeida - rodrigo@lojadedados.com.br
#' @import gsheet
#' @export
updateData <- function() {

  #FIXME melhorar para tratar o caso de chamadas concorrentes (sugestão, criar um arquivo .lock para indicar que já há uma atualizaçaõ em execução)
  urlSelic <- "docs.google.com/spreadsheets/d/18bWTy4ECTnJC6r6p5QwulW5_X4Gmiv0-0WnCqCtV_uI"

  url <- "https://www.tesourotransparente.gov.br/ckan/dataset/df56aa42-484a-4a59-8184-7676580c81e3/resource/796d2059-14e9-44e3-80c9-2d9e30b405c1/download/PrecoTaxaTesouroDireto.csv"
  urlVendasTesouro <- "https://www.tesourotransparente.gov.br/ckan/dataset/f0468ecc-ae97-4287-89c2-6d8139fb4343/resource/e5f90e3a-8f8d-4895-9c56-4bb2f7877920/download/VendasTesouroDireto.csv"
  urlRecompraTesouro <- "https://www.tesourotransparente.gov.br/ckan/dataset/f30db6e4-6123-416c-b094-be8dfc823601/resource/30c2b3f5-6edd-499a-8514-062bfda0f61a/download/RecomprasTesouroDireto.csv"
  s <- read.csv2(url)
  vendas <- read.csv2(urlVendasTesouro)
  compra <- read.csv2(urlRecompraTesouro)
  selic <- gsheet2tbl(urlSelic)


  # garantindo que o diretório para download dos dados existirá
  dataDir <- "data"
  if (!dir.exists(dataDir)) {

    dir.create(path = dataDir, showWarnings = FALSE, mode = "777")
  }

  write.table(x = s, file = file("data/precotaxatesourodireto.csv", open = "wt"), sep = ",")
  write.table(x = vendas, file = file("data/vendatesourodireto.csv", open = "wt"), sep = ";")
  write.table(x = compra, file = file("data/compratesourodireto.csv", open = "wt"), sep = ";")
  write.table(x = selic, file = file("data/selic.csv", open = "wt"), sep = ";")

  format(Sys.time(), "%d/%m/%Y %R")
}
