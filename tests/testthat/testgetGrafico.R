library(rtesourodescomplicado)
context("Testes do Metodo getGrafico")


test_that("Testando a recuperacao de Dados de Precos com o Metodo getGrafico", {
  #se nao carregou os dados ainda, deve carregar
  if (!file.exists('data/precotaxatesourodireto.csv')) {
    updateData()
  }

  janelaCurta = 10
  janelaLonga = 100
  tipoInfo = "PU.Base.Manha"
  tituloPublico <- "Tesouro IPCA+"
  dataVencimento <- "15/08/2024"

  s <- getGrafico(tituloPublico, dataVencimento, janelaLonga, janelaCurta, tipoInfo)

  expect_equal(as.character(class(s))[1],"dygraphs")

})
