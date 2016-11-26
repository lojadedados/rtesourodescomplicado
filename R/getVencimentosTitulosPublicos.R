#' @title Prepara Dados
#' @author Rodrigo Almeida
#' @import dplyr
#' @description os dados vem da seguinte url: http://www.tesourotransparente.gov.br/ckan/dataset/taxas-dos-titulos-ofertados-pelo-tesouro-direto
#' @keywords tesouro direto, dados abertos
#' @description Retorna data.frame com as datas de vencimento dos papeis LFT, LTN, NTN-F, NTN-B Principal, NTN-B, NTN-C
#' @export
#' @usage retorna planilha do tesouro direto
# dados do tesouro lidos atrav?s de s  <- read.csv2("data/precotaxatesourodireto.csv")
getVencimentosTitulosPublicos <- function(titulo = 'Tesouro IPCA+')  {
  precotaxatesourodireto <-  getData()
  vencimentosTitulosPublicos <- precotaxatesourodireto %>% filter(precotaxatesourodireto$Tipo.Titulo == titulo)
  vencimentosTitulosPublicos$Data.Vencimento <- droplevels(as.factor(vencimentosTitulosPublicos$Data.Vencimento))
  as.array(levels(vencimentosTitulosPublicos$Data.Vencimento))
}
