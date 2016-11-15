#' @title get data
#' @description Funcao para recuperar dados do tesouro direto que estao na pasta data com o nome 'precotaxatesourodireto.csv'
#' @author Rodrigo Almeida
#' @export
#' @param updateDataSeNaoDisponivel: TRUE se deseja fazer download do arquivo de dados caso o mesmo não esteja disponível, FALSE caso o arquivo já esteja disponível.
getData <- function(updateDataSeNaoDisponivel = FALSE) {

    if (!existsData() && !isTRUE(updateDataSeNaoDisponivel)) {
      stop("O arquivo de dados não está disponível. Utiliza a função updateData() ou utilize getData(updateDataSeNaoDisponivel = TRUE) para fazer o download do mesmo.")
    }


    if (isTRUE(updateDataSeNaoDisponivel)) {
      if (!existsData()) {

        updateData();
      }
    }

    dataCarregamentoTesouroDireto <<- format(Sys.Date(), "%d/%m/%Y %H:%M")

    tdData <- read.csv2("data/precotaxatesourodireto.csv", sep = ",")

    Tipo.Titulo.Abreviado <- abreviaNomeTitulos(tdData$Tipo.Titulo)

    cbind(tdData, Tipo.Titulo.Abreviado)

}

