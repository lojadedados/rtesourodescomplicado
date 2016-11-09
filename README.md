[![Travis-CI Build Status](https://travis-ci.org/rstudio/tensorflow.svg?branch=master)](https://travis-ci.org/rstudio/tensorflow)

## RTesouroDescomplicado

[RTesouroDescomplicado™](https://github.com/lojadedados/RTesouroDescomplicado) é um software open source utilizado para criação de gráficos utilizando as informações do [Tesouro Direto](http://www.tesouro.fazenda.gov.br/tesouro-direto/). A visualização é feita utilizando a API [DyGraph for R](https://rstudio.github.io/dygraphs/).


## Instalando RTesouroDescomplicado

Você pode instalar o pacote RTesouroDescomplicado através dos seguintes passos:

```r
install.packages("devtools")
library(devtools)
devtools::install_github("lojadedados/RTesouroDescomplicado")
```

Se você instalar RTesouroDescomplicado em um ambiente Virtual R, você precisa assegurar que está usando o mesmo ambiente para acessar as funcionalidades descritas a seguir.

## Verificando a Instalação

Você pode verificar se instalou [RTesouroDescomplicado™](https://github.com/lojadedados/RTesouroDescomplicado) corretamente através da seguinte sequência de comandos:

```r
library(RTesouroDescomplicado)
RTesouroDescomplicado::getTitulosPublicos()
```
Após executar o comando, a seguinte saída deve ser apresentaca, confirmando que o pacote foi instalado corretamente:
```R
[1] "Tesouro IGPM+ com Juros Semestrais"     "Tesouro IPCA+"                         
[3] "Tesouro IPCA+ com Juros Semestrais"     "Tesouro Prefixado"                     
[5] "Tesouro Prefixado com Juros Semestrais" "Tesouro Selic"
```

## Utilização

O pacote [RTesouroDescomplicado™](https://github.com/lojadedados/RTesouroDescomplicado) disponibiliza três métodos bastante úteis para consumo/visualização de informações do tesouro direto. São eles:

```R
[1] RTesouroDescomplicado::getTitulosPublicos()
[2] RTesouroDescomplicado::getVencimentosTitulosPublicos()
[3] RTesouroDescomplicado::getGrafico()
```

### RTesouroDescomplicado::getTitulosPublicos()

Método utilizado para identificar quais títulos públicos estão disponíveis para compra e venda de ações.

### RTesouroDescomplicado::getVencimentosTitulosPublicos()

Método utilizado para identificar quais as datas de vencimento do título público que está sendo avaliado. Possui os seguintes parâmetros:

#### tituloPublico
Nome do Titulo Publico. As opções estão disponíveis através da chamada RTesouroDescomplicado::getTitulosPublicos()


### RTesouroDescomplicado::getGrafico()

Método utilizado para gerar a visualição das informações do Título Publico. Possui os seguintes parâmetros:

#### tituloPublico
Nome do Titulo Publico. As opções estão disponíveis através da chamada do método RTesouroDescomplicado::getTitulosPublicos()

#### dataVencimento
Data de vencimento do titulo. As opções estão disponíveis através da chamada do método RTesouroDescomplicado::getVencimentosTitulosPublicos()

#### janelaLonga
Período para avaliação da Janela mais longa para as médias moveis exponenciais

#### janelaCurta
Período para avaliação da Janela mais curta para as médias moveis exponenciais

#### tipoInfo
Informação que será plotada no gráfico. Um dos seguintes: Taxa.Compra.Manha, Taxa.Venda.Manha, PU.Compra.Manha, PU.Venda.Manha, PU.Base.Manha

## Exemplo de Visualização
```r
janelaCurta = 10
janelaLonga = 100
tipoInfo = "PU.Base.Manha"
tituloPublico <- "Tesouro IPCA+"
dataVencimento <- "15/08/2024"
getGrafico(tituloPublico,dataVencimento,janelaLonga,janelaCurta,tipoInfo)
```

![Tesouro Descomplicado View 1](https://github.com/lojadedados/rtesourodescomplicado/blob/master/img/tdvis.png)



## Documentação

Veja o website do pacote para informações adicionais e aplicativos que consomem o pacote: <https://github.com/lojadedados/RTesouroDescomplicado>

O pacote RTesouroDescomplicado suporta o recurso auto completar do código quando executado na IDE RStudio. Para utilização dessa funcionalidade, sugerimos fortemente a instalação da[Versão Atual](https://www.rstudio.com/products/rstudio/download/preview/) do RStudio.
