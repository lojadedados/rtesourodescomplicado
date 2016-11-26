library(rtesourodescomplicado)
context("Testes do Metodo getRentabilidadeNTNBPrincipal")


test_that("Testando o metodo getRentabilidadeNTNBPrincipal", {
  #se nao carregou os dados ainda, deve carregar
  if (!file.exists('data/precotaxatesourodireto.csv')) {
    updateData()
  }

  dataCompra <- "10/08/2016"
  valorInvestido <- 1000
  dataVencimento <- "15/08/2024"

  s <- rtesourodescomplicado::getRentabilidadeNTNBPrincipal(dataCompra = dataCompra,
                                                      dataVencimento = dataVencimento,
                                                      valorInvestido = valorInvestido)


  expect_equal(class(s),"data.frame")

  expect_equal(s$Dias.Uteis, 2010)

  expect_equal(s$aliquota.IR, 0.15)

})
