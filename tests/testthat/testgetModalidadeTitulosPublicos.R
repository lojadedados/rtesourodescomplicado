library(rtesourodescomplicado)
context("Testes do Metodo getModalidadeTitulosPublicos")


test_that("Testando o metodo getModalidadeTitulosPublicos", {
  #se nao carregou os dados ainda, deve carregar
  if (!file.exists('data/precotaxatesourodireto.csv')) {
    updateData()
  }
  # Verifica a existencia de 9 colunas no arquivo
  expect_equal(ncol(getModalidadeTitulosPublicos()),2)

  expect_match(as.character(getModalidadeTitulosPublicos()[4,2]), "Prefixado", ignore.case = TRUE)

  expect_match(as.character(getModalidadeTitulosPublicos()[4,1]), "Tesouro Prefixado", ignore.case = TRUE)

  expect_match(as.character(getModalidadeTitulosPublicos()[6,1]), "Tesouro Selic", ignore.case = TRUE)

  expect_match(as.character(getModalidadeTitulosPublicos()[6,2]), "Selic", ignore.case = TRUE)

})
