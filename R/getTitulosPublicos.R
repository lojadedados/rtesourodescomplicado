#' @title getTitulosPublicos
#' @author Rodrigo Almeida
#' @import dplyr
#' @description os dados vem da seguinte url: http://www.tesourotransparente.gov.br/ckan/dataset/taxas-dos-titulos-ofertados-pelo-tesouro-direto
#' @keywords tesouro direto, dados abertos, titulos publicos
#' @description Retorna data.frame com as datas de vencimento dos papeis LFT, LTN, NTN-F, NTN-B Principal, NTN-B, NTN-C
#' LFT: Tesouro Selic
#' LTN: Tesouro Prefixado
#' NTN-F: Tesouro Prefixado com Juros Semestrais
#' NTN-B Principal: Tesouro IPCA
#' NTN-B: Tesouro IPCA com Juros Semestrais
#' NTN-C: Títulos vinculados ao IGPM
#' @export
#' @usage retorna nome dos titulos para Consulta
#' @param dadosTesouro: Dados do tesouro lidos a partir da planilha csv 'precotaxatesourodireto.csv'
getTitulosPublicos <- function() {
  precotaxatesourodireto <- getData()
  # [1] "Tesouro IGPM+ com Juros Semestrais"     "Tesouro IPCA+"
  # [3] "Tesouro IPCA+ com Juros Semestrais"     "Tesouro Prefixado"
  # [5] "Tesouro Prefixado com Juros Semestrais" "Tesouro Selic"
  titulosPublicos <- levels(precotaxatesourodireto$Tipo.Titulo)
  as.array(titulosPublicos)
}
