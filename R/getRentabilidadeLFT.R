#' @title get Valor Rentabilidade Tesouro Selic (LFT)
#' @description Funcao para calcular previsão de rentabilidade de titulo LFT
#' @author Rodrigo Almeida <rodrigo.almeida@gmail.com>
#' @param dataCompra: Data da Compra do titulo no formato dd/mm/yyyy
#' @param tituloPublico: Nome do Titulo Publico
#' @param dataVencimento: Data de Vencimento do titulo no formato dd/mm/yyyy
#' @param valorInvestido: Valor total investido no periodo
#' @param txAdmBanco: taxa de administracao do banco ou financeira
#' @param txCustodia: Taxa de Custodia (por padrao 0.3%)
#' @param txSelic: taxa selic para periodo
#' @export
getRentabilidadeLFT <- function(dataCompra,
                                tituloPublico = "Tesouro Selic",
                                dataVencimento,
                                valorInvestido,
                                txAdmBanco = 0.1/100,
                                txCustodia = 0.3/100,
                                txSelic = 0.11) {

  dataCompra <- as.Date(dataCompra, format = "%d/%m/%Y")
  dataVencimento <- as.Date(dataVencimento, format = "%d/%m/%Y")

  # calendario para calculo de dias uteis
  create.calendar("Brazil/ANBIMA", holidaysANBIMA, weekdays=c("saturday", "sunday"))

  Dias.Corridos <- difftime(dataVencimento , dataCompra , units = c("days"))
  Dias.Uteis <- bizdays(dataCompra, dataVencimento, "Brazil/ANBIMA")
  Valor.Investido <- valorInvestido
  tx.Adm.Entrada <- txAdmBanco * Valor.Investido
  Valor.Investido.Real <- Valor.Investido + tx.Adm.Entrada
  Valor.Bruto.Resgate <- Valor.Investido*(1+txSelic)^(Dias.Uteis/252)
  Rentabilidade.Bruta <- (Valor.Bruto.Resgate/Valor.Investido.Real)^(252/Dias.Uteis)-1
  Taxa.Custodia.Resgate <- (((Valor.Bruto.Resgate-Valor.Investido)/2)+Valor.Investido)*((1+txCustodia)^(Dias.Uteis/252)-1)
  Taxa.Administracao.Resgate <- (((Valor.Bruto.Resgate-Valor.Investido)/2)+Valor.Investido)*((1+txAdmBanco)^((Dias.Uteis/252)/252)-1)
  aliquota.IR <- getAliquotaIR(Dias.Uteis)
  Desconto.IR <-(Valor.Bruto.Resgate - Valor.Investido - Taxa.Custodia.Resgate - Taxa.Administracao.Resgate)*aliquota.IR
  Resgate.Liquido <- Valor.Bruto.Resgate - Taxa.Custodia.Resgate - Taxa.Administracao.Resgate - Desconto.IR
  Rentabilidade.Liquida <- (Resgate.Liquido/Valor.Investido.Real)^(252/Dias.Uteis)-1

  dtFrame <- data.frame(Dias.Corridos,
                        Dias.Uteis,
                        Valor.Investido,
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
