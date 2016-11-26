library(rtesourodescomplicado)
context("Testes do Metodo getVencimentosTitulosPublicos")


test_that("Testando o metodo getVencimentosTitulosPublicos", {
  #se nao carregou os dados ainda, deve carregar
  if (!file.exists('data/precotaxatesourodireto.csv')) {
    updateData()
  }


  # Verifica a existencia de 9 colunas no arquivo
  expect_equal(length(getVencimentosTitulosPublicos()),4)

  expect_equal(length(getVencimentosTitulosPublicos(titulo = "Tesouro IGPM+ com Juros Semestrais")),8)

  expect_equal(length(getVencimentosTitulosPublicos(titulo = "Tesouro Prefixado")),34)

  expect_equal(length(getVencimentosTitulosPublicos(titulo = "Tesouro IPCA+ com Juros Semestrais")),16)

})
