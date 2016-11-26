#' @title get Valor Rentabilidade Tesouro Prefixado (LTN)
#' @description Funcao para calcular previsao de rentabilidade de titulo LTN
#' @author Rodrigo Almeida <rodrigo.almeida@gmail.com>
#' @param dataCompra: Data da Compra do titulo no formato dd/mm/yyyy
#' @param tituloPublico: Nome do Titulo Publico (Tesouro Prefixado)
#' @param dataVencimento: Data de Vencimento do titulo no formato dd/mm/yyyy
#' @param valorInvestido: Valor total investido no periodo
#' @param txAdmBanco: taxa de administracao do banco ou financeira para o periodo (%a.a) (por padrao 0.1%)
#' @param txCustodia: Taxa de Custodia (por padrao 0.3%)
#' @param txAdministracaoEntrada: Taxa de Administracao na Entrada do Investimento
#' @export
getRentabilidadeLTN <- function(dataCompra,
                                tituloPublico = "Tesouro Prefixado",
                                dataVencimento,
                                valorInvestido,
                                txAdmBanco = 0.1/100,
                                txCustodia = 0.3/100,
                                txAdministracaoEntrada = 1) {

  txCompra <- getTaxaCompra(dataCompra,tituloPublico,dataVencimento)
  txCompra <- as.character(txCompra)
  txCompra <- as.double(txCompra)/100

  dataCompra <- as.Date(dataCompra, format = "%d/%m/%Y")
  dataVencimento <- as.Date(dataVencimento, format = "%d/%m/%Y")
  # calendario para calculo de dias uteis
  create.calendar("Brazil/ANBIMA", holidaysANBIMA, weekdays=c("saturday", "sunday"))

  Dias.Corridos <- difftime(dataVencimento , dataCompra , units = c("days"))
  Dias.Uteis <- bizdays(dataCompra, dataVencimento, "Brazil/ANBIMA")
  valor.Investido <- valorInvestido
  tx.Adm.Entrada <- txAdministracaoEntrada
  Valor.Investido.Real <- valor.Investido + tx.Adm.Entrada
  Valor.Bruto.Resgate <- valor.Investido * ((1 + txCompra)^(Dias.Uteis/252))
  Rentabilidade.Bruta <- (Valor.Bruto.Resgate/Valor.Investido.Real)^(Dias.Uteis/252)-1
  Taxa.Custodia.Resgate <- (((Valor.Bruto.Resgate-valor.Investido)/2)+valor.Investido)*((1+txCustodia)^(Dias.Uteis/252)-1)
  Taxa.Administracao.Resgate <- (((Valor.Bruto.Resgate-valor.Investido)/2)+valor.Investido)*((1+txAdmBanco)^((Dias.Uteis/252)/252)-1)
  aliquota.IR <- getAliquotaIR(Dias.Uteis)
  Desconto.IR <-(Valor.Bruto.Resgate - valor.Investido - Taxa.Custodia.Resgate - Taxa.Administracao.Resgate)*aliquota.IR
  Resgate.Liquido <- Valor.Bruto.Resgate - Taxa.Custodia.Resgate - Taxa.Administracao.Resgate - Desconto.IR
  Rentabilidade.Liquida <- (Resgate.Liquido/Valor.Investido.Real)^(252/Dias.Uteis)-1

  dtFrame <- data.frame(Dias.Corridos,
                        Dias.Uteis,
                        valor.Investido,
                        tx.Adm.Entrada,
                        Valor.Investido.Real,
                        Valor.Bruto.Resgate,
                        Rentabilidade.Bruta,
                        Taxa.Custodia.Resgate,
                        Taxa.Administracao.Resgate,
                        aliquota.IR,
                        Desconto.IR,
                        Resgate.Liquido,
                        Rentabilidade.Liquida)

  dtFrame

}
