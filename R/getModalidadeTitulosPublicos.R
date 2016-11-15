#' @title getModalidadeTitulosPublicos
#' @author Rodrigo Almeida
#' @description os dados vem da seguinte url: http://www.tesourotransparente.gov.br/ckan/dataset/taxas-dos-titulos-ofertados-pelo-tesouro-direto
#' @keywords tesouro direto, dados abertos, titulos publicos
#' @description Retorna array com modalidade dos Títulos Públicos, papeis LFT, LTN, NTN-F, NTN-B Principal, NTN-B, NTN-C
#' LFT: Selic
#' LTN: Prefixado
#' NTN-F: Prefixado com Juros Semestrais
#' NTN-B Principal: IPCA
#' NTN-B: IPCA com Juros Semestrais
#' NTN-C: Títulos vinculados ao IGPM
#' @export
#' @usage retorna nome dos títulos para Consulta
#' @param nomesAbreviados: True se a função deve retornar os nomes dos títulos de forma abreviada (exemplo: "Semestrais" -> "Sem."), FALSE caso contrário.
#' @param dadosTesouro: Dados do tesouro lidos a partir da planilha csv 'precotaxatesourodireto.csv'
getModalidadeTitulosPublicos <- function(nomesAbreviados = TRUE) {
  precotaxatesourodireto <- getData(updateDataSeNaoDisponivel = TRUE)
  # [1] "Tesouro IGPM+ com Juros Semestrais"     "Tesouro IPCA+"
  # [3] "Tesouro IPCA+ com Juros Semestrais"     "Tesouro Prefixado"
  # [5] "Tesouro Prefixado com Juros Semestrais" "Tesouro Selic"
  retorno <- modalidadeTituloPublico <- levels(precotaxatesourodireto$Tipo.Titulo)

  if (isTRUE(nomesAbreviados)) {
    modalidadeTituloPublicoAbreviado <- abreviaNomeTitulos(modalidadeTituloPublico)

    retorno <- data.frame(modalidadeTituloPublico, modalidadeTituloPublicoAbreviado)

  }
  unique(retorno)
}
