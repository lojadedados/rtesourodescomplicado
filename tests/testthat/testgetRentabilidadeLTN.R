library(rtesourodescomplicado)
context("Testes do Metodo getRentabilidadeLTN")


test_that("Testando o metodo getRentabilidadeLTN", {
  #se nao carregou os dados ainda, deve carregar
  if (!file.exists('data/precotaxatesourodireto.csv')) {
    updateData()
  }

  dataVencimento <- "01/01/2019"
  dataCompra <- "10/08/2016"
  valorInvestido <- 1000

  s <- rtesourodescomplicado::getRentabilidadeLTN(dataCompra = dataCompra,
                                                  dataVencimento = dataVencimento,
                                                  valorInvestido = valorInvestido)


  expect_equal(class(s),"data.frame")

  expect_equal(s$Dias.Uteis, 597)


})
