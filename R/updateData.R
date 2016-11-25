#' @title update data
#' @description Funcao para atualizar dados do tesouro direto que estao na pasta data com o nome 'precotaxatesourodireto.csv'
#' @author Rodrigo Almeida - rodrigo@lojadedados.com.br
#' @export
updateData <- function() {

  #FIXME melhorar para tratar o caso de chamadas concorrentes (sugestão, criar um arquivo .lock para indicar que já há uma atualizaçaõ em execução)

  url <- "https://www.tesourotransparente.gov.br/ckan/dataset/df56aa42-484a-4a59-8184-7676580c81e3/resource/796d2059-14e9-44e3-80c9-2d9e30b405c1/download/PrecoTaxaTesouroDireto.csv"
  s <- read.csv2(url)

  # garantindo que o diretório para download dos dados existirá
  dataDir <- "data"
  if (!dir.exists(dataDir)) {

    dir.create(path = dataDir, showWarnings = FALSE, mode = "777")
  }

  write.table(x = s, file = file("data/precotaxatesourodireto.csv", open = "wt"), sep = ",")

  format(Sys.time(), "%d/%m/%Y %R")
}
