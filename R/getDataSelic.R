#' @title get data Selic
#' @description Funcao para recuperar dados Selic
#' @author Rodrigo Almeida
#' @export
#' @param updateDataSeNaoDisponivel: TRUE se deseja fazer download do arquivo de dados caso o mesmo não esteja disponível, FALSE caso o arquivo já esteja disponível.
getDataSelic <- function(updateDataSeNaoDisponivel = FALSE) {

  if (!existsDataSelic() && !isTRUE(updateDataSeNaoDisponivel)) {
    stop("O arquivo de dados não está disponível. Utiliza a função updateData() ou utilize getDataSelic(updateDataSeNaoDisponivel = TRUE) para fazer o download do mesmo.")
  }


  if (isTRUE(updateDataSeNaoDisponivel)) {
    if (!existsDataSelic()) {
      updateData();
    }
  }

  dataCarregamentoSelic <<- format(Sys.Date(), "%d/%m/%Y %H:%M")

  tdData <- read.csv2("data/selic.csv", sep = ";")
  colnames(tdData) <- c("data","taxa")


  #tdData$Data.Vencimento <- as.POSIXct(strptime(x = as.character(tdData$Data.Vencimento), format = "%d/%m/%Y"))
  #TODO verificar se em algum outro local, utilizamos data de forma errada
  #tdData$Data.Base <- as.POSIXct(strptime(x = as.character(tdData$Data.Base), format = "%d/%m/%Y"))

  tdData$data <- as.Date(tdData$data, format = "%d/%m/%Y")



  #ordenando pela data
  tdData <- tdData[order(tdData$data),]

  tdData

}
