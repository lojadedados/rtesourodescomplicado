library(rtesourodescomplicado)
context("Testes do Metodo getData")


test_that("Testando a recuperacao de Dados de Precos com o Metodo GetData", {
  #se nao carregou os dados ainda, deve carregar
  if (!file.exists('data/precotaxatesourodireto.csv')) {
    updateData()
  }
 # Verifica a existencia de 9 colunas no arquivo
 expect_equal(ncol(getData()),9)

})
