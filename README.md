[![Travis-CI Build Status](https://travis-ci.org/rstudio/tensorflow.svg?branch=master)](https://travis-ci.org/rstudio/tensorflow)

## RTesouroDescomplicado

[RTesouroDescomplicado�](https://github.com/lojadedados/RTesouroDescomplicado) � um software open source utilizado para cria��o de gr�ficos utilizando as informa��es do [Tesouro Direto](http://www.tesouro.fazenda.gov.br/tesouro-direto/). A visualiza��o � feita utilizando a API [DyGraph for R](https://rstudio.github.io/dygraphs/).


## Instalando RTesouroDescomplicado

Voc� pode instalar o pacote RTesouroDescomplicado atrav�s dos seguintes passos:

```r
install.packages("devtools")
library(devtools)
devtools::install_github("lojadedados/RTesouroDescomplicado")
```

Se voc� instalar RTesouroDescomplicado em um ambiente Virtual R, voc� precisa assegurar que est� usando o mesmo ambiente para acessar as funcionalidades descritas a seguir.

## Verificando a Instala��o

Voc� pode verificar se instalou [RTesouroDescomplicado�](https://github.com/lojadedados/RTesouroDescomplicado) corretamente atrav�s da seguinte sequ�ncia de comandos:

```r
library(RTesouroDescomplicado)
RTesouroDescomplicado::getTitulosPublicos()
```
Ap�s executar o comando, a seguinte sa�da deve ser apresentaca, confirmando que o pacote foi instalado corretamente:
```R
[1] "Tesouro IGPM+ com Juros Semestrais"     "Tesouro IPCA+"                         
[3] "Tesouro IPCA+ com Juros Semestrais"     "Tesouro Prefixado"                     
[5] "Tesouro Prefixado com Juros Semestrais" "Tesouro Selic"
```

## Utiliza��o

O pacote [RTesouroDescomplicado�](https://github.com/lojadedados/RTesouroDescomplicado) disponibiliza tr�s m�todos bastante �teis para consumo/visualiza��o de informa��es do tesouro direto. S�o eles:

```R
[1] RTesouroDescomplicado::getTitulosPublicos()
[2] RTesouroDescomplicado::getVencimentosTitulosPublicos()
[3] RTesouroDescomplicado::getGrafico()
```

### RTesouroDescomplicado::getTitulosPublicos()

M�todo utilizado para identificar quais t�tulos p�blicos est�o dispon�veis para compra e venda de a��es.

### RTesouroDescomplicado::getVencimentosTitulosPublicos()

M�todo utilizado para identificar quais as datas de vencimento do t�tulo p�blico que est� sendo avaliado. Possui os seguintes par�metros:

#### tituloPublico
Nome do Titulo Publico. As op��es est�o dispon�veis atrav�s da chamada RTesouroDescomplicado::getTitulosPublicos()


### RTesouroDescomplicado::getGrafico()

M�todo utilizado para gerar a visuali��o das informa��es do T�tulo Publico. Possui os seguintes par�metros:

#### tituloPublico
Nome do Titulo Publico. As op��es est�o dispon�veis atrav�s da chamada do m�todo RTesouroDescomplicado::getTitulosPublicos()

#### dataVencimento
Data de vencimento do titulo. As op��es est�o dispon�veis atrav�s da chamada do m�todo RTesouroDescomplicado::getVencimentosTitulosPublicos()

#### janelaLonga
Per�odo para avalia��o da Janela mais longa para as m�dias moveis exponenciais

#### janelaCurta
Per�odo para avalia��o da Janela mais curta para as m�dias moveis exponenciais

#### tipoInfo
Informa��o que ser� plotada no gr�fico. Um dos seguintes: Taxa.Compra.Manha, Taxa.Venda.Manha, PU.Compra.Manha, PU.Venda.Manha, PU.Base.Manha

## Exemplo de Visualiza��o
```r
janelaCurta = 10
janelaLonga = 100
tipoInfo = "PU.Base.Manha"
tituloPublico <- "Tesouro IPCA+"
dataVencimento <- "15/08/2024"
getGrafico(tituloPublico,dataVencimento,janelaLonga,janelaCurta,tipoInfo)
```

![Tesouro Descomplicado View 1](https://github.com/lojadedados/rtesourodescomplicado/blob/master/img/tdvis.png)



## Documenta��o

Veja o website do pacote para informa��es adicionais e aplicativos que consomem o pacote: <https://github.com/lojadedados/RTesouroDescomplicado>

O pacote RTesouroDescomplicado suporta o recurso auto completar do c�digo quando executado na IDE RStudio. Para utiliza��o dessa funcionalidade, sugerimos fortemente a instala��o da[Vers�o Atual](https://www.rstudio.com/products/rstudio/download/preview/) do RStudio.
