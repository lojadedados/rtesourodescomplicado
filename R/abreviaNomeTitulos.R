#' @title abreviaNomeTitulos
#' @author Filipe Marques
#' @description os dados vem da seguinte url: http://www.tesourotransparente.gov.br/ckan/dataset/taxas-dos-titulos-ofertados-pelo-tesouro-direto
#' @keywords tesouro direto, dados abertos, titulos publicos
#' @description Retorna array com nomes dos títulos públicos abreviados
#' @export
#' @param titulosPublicos: array com os nomes dos títulos Públicos
abreviaNomeTitulos <- function(titulosPublicos) {

    # removendo a palavra 'Tesouro '
    titulosPublicos <- gsub("Tesouro ", "", titulosPublicos)

    # removendo a palavra 'com '
    titulosPublicos <- gsub("com ", "", titulosPublicos)

    # abreviando a palavra 'Semestrais '
    titulosPublicos <- gsub("Semestrais", "Sem.", titulosPublicos)

}
