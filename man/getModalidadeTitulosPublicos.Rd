% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/getModalidadeTitulosPublicos.R
\name{getModalidadeTitulosPublicos}
\alias{getModalidadeTitulosPublicos}
\title{getModalidadeTitulosPublicos}
\usage{
retorna nome dos títulos para Consulta
}
\arguments{
\item{nomesAbreviados:}{True se a função deve retornar os nomes dos títulos de forma abreviada (exemplo: "Semestrais" -> "Sem."), FALSE caso contrário.}

\item{dadosTesouro:}{Dados do tesouro lidos a partir da planilha csv 'precotaxatesourodireto.csv'}
}
\description{
os dados vem da seguinte url: http://www.tesourotransparente.gov.br/ckan/dataset/taxas-dos-titulos-ofertados-pelo-tesouro-direto

Retorna array com modalidade dos Títulos Públicos, papeis LFT, LTN, NTN-F, NTN-B Principal, NTN-B, NTN-C
LFT: Selic
LTN: Prefixado
NTN-F: Prefixado com Juros Semestrais
NTN-B Principal: IPCA
NTN-B: IPCA com Juros Semestrais
NTN-C: Títulos vinculados ao IGPM
}
\author{
Rodrigo Almeida
}
\keyword{abertos,}
\keyword{dados}
\keyword{direto,}
\keyword{publicos}
\keyword{tesouro}
\keyword{titulos}

