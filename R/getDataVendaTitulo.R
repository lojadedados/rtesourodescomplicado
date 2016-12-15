#' @title get data
#' @description Funcao para recuperar dados do tesouro direto que estao na pasta data com o nome 'vendatesourodireto.csv'
#' @author Rodrigo Almeida
#' @export
#' @param updateDataSeNaoDisponivel: TRUE se deseja fazer download do arquivo de dados caso o mesmo não esteja disponível, FALSE caso o arquivo já esteja disponível.
getDataVendaTitulo <- function(updateDataSeNaoDisponivel = FALSE) {

  if (!existsData() && !isTRUE(updateDataSeNaoDisponivel)) {
    stop("O arquivo de dados não está disponível. Utiliza a função updateData() ou utilize getData(updateDataSeNaoDisponivel = TRUE) para fazer o download do mesmo.")
  }


  if (isTRUE(updateDataSeNaoDisponivel)) {
    if (!existsDataCompraTitulo()) {
      updateData();
    }
  }

  dataCarregamentoVendaTesouroDireto <<- format(Sys.Date(), "%d/%m/%Y %H:%M")

  tdData <- read.csv2("data/vendatesourodireto.csv", sep = ";")


  #tdData$Data.Vencimento <- as.POSIXct(strptime(x = as.character(tdData$Data.Vencimento), format = "%d/%m/%Y"))
  #TODO verificar se em algum outro local, utilizamos data de forma errada
  #tdData$Data.Base <- as.POSIXct(strptime(x = as.character(tdData$Data.Base), format = "%d/%m/%Y"))

  tdData$Vencimento.do.Titulo <- as.Date(tdData$Vencimento.do.Titulo, format = "%d/%m/%Y")
  tdData$Data.Venda <- as.Date(tdData$Data.Venda, format = "%d/%m/%Y")


  #ordenando pela data Base
  tdData <- tdData[order(tdData$Data.Venda),]


  Tipo.Titulo.Abreviado <- abreviaNomeTitulos(tdData$Tipo.Titulo)

  cbind(tdData, Tipo.Titulo.Abreviado)

}

