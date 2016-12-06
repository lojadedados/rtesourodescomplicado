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
  dataVencimento <- "2024-08-15"
  MMECurta = TRUE
  MMELonga = TRUE

  s <- getGrafico(tituloPublico, dataVencimento, janelaLonga, janelaCurta, tipoInfo, dataLimiteInferiorEixoX = "2015-01-01",
                  dataLimiteSuperiorEixoX = "2016-11-15", MMECurta, MMELonga)

  expect_equal(as.character(class(s))[1],"dygraphs")

})
