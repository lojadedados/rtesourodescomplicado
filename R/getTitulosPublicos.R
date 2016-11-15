#' @title getTitulosPublicos
#' @author Filipe Marques
#' @description os dados vem da seguinte url: http://www.tesourotransparente.gov.br/ckan/dataset/taxas-dos-titulos-ofertados-pelo-tesouro-direto
#' @keywords tesouro direto, dados abertos, titulos publicos
#' @description Retorna array com o título (formato: Nome + data de vencimento) dos Títulos Públicos, papeis LFT, LTN, NTN-F, NTN-B Principal, NTN-B, NTN-C
#' LFT: Selic
#' LTN: Prefixado
#' NTN-F: Prefixado com Juros Semestrais
#' NTN-B Principal: IPCA
#' NTN-B: IPCA com Juros Semestrais
#' NTN-C: Títulos vinculados ao IGPM
#' @export
#' @param nomesAbreviados: True se a função deve retornar os nomes dos títulos de forma abreviada (exemplo: "Semestrais" -> "Sem."), FALSE caso contrário.
#' @param dadosTesouro: Dados do tesouro lidos a partir da planilha csv 'precotaxatesourodireto.csv'
getTitulosPublicos <- function(nomesAbreviados = TRUE) {
  precotaxatesourodireto <- getData(updateDataSeNaoDisponivel = TRUE)

  # adicionando a coluna de nome completo concatenada com data de vencimento
  retorno <- tituloPublico <- paste(precotaxatesourodireto$Tipo.Titulo, precotaxatesourodireto$Data.Vencimento)

  if (isTRUE(nomesAbreviados)) {
    tituloPublicoAbreviado <- abreviaNomeTitulos(tituloPublico)

    # adicionando a coluna nome abreviado concatenada com data de vencimento
    retorno <- data.frame(tituloPublico, tituloPublicoAbreviado)
  }

  # Adicionando a coluna de data de vencimento
  retorno$Data.Vencimento <- precotaxatesourodireto$Data.Vencimento

  unique(retorno)
}
