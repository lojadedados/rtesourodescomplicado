library(rtesourodescomplicado)
context("Testes do Metodo getTitulosPublicos")


test_that("Testando a recuperacao de Dados de Precos com o Metodo getTitulosPublicos", {
  #se nao carregou os dados ainda, deve carregar
  if (!file.exists('data/precotaxatesourodireto.csv')) {
    updateData()
  }

  expect_equal(ncol(getTitulosPublicos()),3)

})
