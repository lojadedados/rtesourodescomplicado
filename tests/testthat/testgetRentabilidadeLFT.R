library(rtesourodescomplicado)
context("Testes do Metodo getRentabilidadeLFT")


test_that("Testando o metodo getRentabilidadeLFT", {
  #se nao carregou os dados ainda, deve carregar
  if (!file.exists('data/precotaxatesourodireto.csv')) {
    updateData()
  }

  dataCompra <- "10/08/2016"
  valorInvestido <- 1000
  dataVencimento <- "01/03/2021"

  s <- rtesourodescomplicado::getRentabilidadeLFT(dataCompra = dataCompra,
                                                            dataVencimento = dataVencimento,
                                                            valorInvestido = valorInvestido)


  expect_equal(class(s),"data.frame")

  expect_equal(s$Dias.Uteis, 1140)


})
