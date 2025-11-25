# Análise de Dados com R
# Dr Carolina Correia
# 27 e 28 de Novembro de 2025

# Exercícios foram extraídos do livro
# R para Ciência de Dados (2ª edição)
# Autores: Hadley Wickham, Mine Çetinkaya-Rundel, e Garrett Grolemund.
# https://pt.r4ds.hadley.nz


# Isto é um comentário.
# Comentários nõo sõo interpretados como comandos, opções ou argumentos.

# Este arquivo de text .R é um script
# Um script é um arquivo de texto

# A ordem dos comandos é importante



#### 01 Setup/Configurações ####

# A primeira coisa que vamos fazer é abrir o projeto curso-R no RStudio
# No canto superior direito, clique em 'Project: None'
# e depois clique em 'curso-R' na lista

# Clique em Tools > Global Options > Remova a seleção de 'Restore .RData'
# Em 'Save workspace to .RData on exit', mude a opção para 'Never'

# Tools > Global Options > Appearance

# Tools > Global Options > Code
# Selecione a opção: Use native pipe operator |>

#### 02 Princípios básicos de programação ####

# Para executar o código, mova o cursor para linha desejada e
# pressione as teclas:
# Ctrl Enter no Windows ou Linux
# Cmd Enter no macOS
# Uma outra maneira é clicar no botão 'Run' acima

# Você pode usar o R para fazer cálculos básicos:
1 / 200 * 30
# Note que o separador decimal no resultado é um ponto, não uma vírgula

# Precisa esperar que o símbolo > apareça no console antes de executar
# o próximo comando. Normalmente é tão rápido que você nem nota

20 + 20

sin(pi / 2) # Calcular o seno de π (pi)
# Note que os dois parenteses saã adicionados automaticamente,
# o RStudio faz isso para você

# Existem 3 maneiras de definir variáveis em R:
x <- 3 * 4 # Esta é a maneira recomendada, usando variável <- valor
x = 1
2 -> x
y <- 3

x == 2
x != 2

# Note que o valor de x não é impresso, ele é apenas armazenado
# O objeto 'x' recebe o valor 12
# Se você quiser ver o valor, digite 'x' no console ou execute 'x' no script
x

x + y

# Note que o ambiente agora mostra 'x' e o seu valor

# Para atribuir um valor de texto, precisamos colocar o texto entre aspas
x <- "olá mundo"

# Atalho de teclado para inserir operador de atribuição <-
# Windows: Alt+ ou Alt-
# macOS: Option+ ou Option-

# Criar um vetor numérico com a função concatenar c()
primos <- c(2, 3, 5, 7, 11, 13)
primos

# Criar um vetor de caracteres
risco <- c("alto", "médio", "baixo")
risco

# Converter vetor de caracteres para vetor de fatores
risco <- as.factor(risco)
levels(risco)

# Matriz
m <- matrix(1:6, nrow = 2, ncol = 3)
m

# Data frame
df <- data.frame(col1 = 1:4, col2 = c(T, T, F, F))
df

# Lista
l <- list(a = 1:2, b = 1:3, c = 1:4)
l

# Voltar para os slides

#### 03 Instalar os pacotes necessários ####

# Se você seguiu as instruções enviadas duas semanas atrás,
# o Tidyverse já vai estar instalado no seu computador

# Remova as hashtags abaixo para transformar os comentários em commandos e 
# executar as funções para instalar os pacotes, caso você não tenha feito isso antes
#install.packages("tidyverse", dependencies = TRUE)
#install.packages("writexl", dependencies = TRUE)
#install.packages("dados")

#### 04 Carregar os pacotes necessários ####

# Toda vez que você iniciar uma sessão no R, você vai precisar carregar
# os pacotes que você vai usar na sua análise

library(readxl) # Este pacote faz parte do Tidyverse, então já está instalado
library(tidyverse) # Conjunto de pacotes
library(writexl) # Este pacote permite exportar dados do R para uma planilha de Excel
library(dados) # Este pacote contém conjuntos de dados úteis para praticar

#### 05 Carregar dados que já foram limpos/transformados ####

# Nota: o fluxo de trabalho mais comum no R seria:
# 1) Importar dados de uma planilha para o R
# 2) Arrumar/organizar (data tidying)
# 3) Transformar os dados (data wrangling)
# 4) Visualizar os dados

# Para facilitar o aprendizado e devido ao curso ser curto, vamos
# começar pela visualização dos dados

# Vamos dar uma olhada no data frame pinguins, que faz parte do pacote dados:
pinguins
# Dados aparecem no console:
# por padrão, mostra somente as 10 primeiras linhas da tabela

# Pinguins contém um tibble de 344 linhas (observações) e 8 colunas (variáveis)
# Apenas as seis primeiras colunas aparecem no console
# Já podemos ver que alguns valores estão ausentes: NA
# Em cinza, abaixo das linhas vemos que existem mais 334 linhas e mais 2 colunas
# O nome e tipo de dados das duas colunas também é listado:
# sexo <fatores> e ano <números inteiros>

# Para ver a tabela inteira (abre em nova aba no painel editor de script):
View(pinguins)

# Fechar aba

# Um tibble é uma tipo de data frame: uma coleção tabular (formato de tabela) de
# variáveis (nas colunas) e observações (nas linhas)

# Neste contexto, uma variável refere-se a um atributo de todos os pinguins,
# e uma observação refere-se a todos os atributos de um único pinguim

# Para saber mais detalhes sobre o data frame, use a ajuda:
?pinguins

#### 06 Gráfico de dispersão com o pacote ggplot2 ####

# Primeira camada: o conjunto de dados a ser usado no gráfico
ggplot(data = pinguins)
# Cria um gráfico vazio porquê ainda não dissemos como fazer a visualização

# Vamos especificar quais variáveis devem ser mapeadas nos eixos x e y
ggplot(data = pinguins,
       mapping = aes(x = comprimento_nadadeira,
                     y = massa_corporal))
# Porém, ainda não definimos como representar as observações do data frame
# em nosso gráfico.

# Precisamos definir um geom: A geometria que um gráfico usa para representar
# os dados. Mais detalhes sobre geoms nos materiais de apoio

# A função geom_point() adiciona uma camada de pontos ao seu gráfico,
# o que cria um gráfico de dispersão
ggplot(data = pinguins,
       mapping = aes(x = comprimento_nadadeira,
                     y = massa_corporal)) +
  geom_point()

# Vemos que uma mensagem de aviso (warning message) apareceu no console
# Observações que estão faltando/em branco e foram marcadas como NA foram removidas do gráfico

# O gráfico aparece na aba de Plots, no painel output/saída

# Agora vamos adicionar atributos estéticos
ggplot(data = pinguins,
       mapping = aes(x = comprimento_nadadeira,
                     y = massa_corporal,
                     color = especie)) + # Mapear as espécies por cor
  geom_point()

# Mapear as espécies por cor e forma
ggplot(data = pinguins,
       mapping = aes(x = comprimento_nadadeira,
                     y = massa_corporal,
                     color = especie, shape = especie)) +
  geom_point()

# Visualizar mais de 3 variáveis
ggplot(pinguins,
       aes(x = comprimento_nadadeira,
           y = massa_corporal)) +
  geom_point(aes(color = especie, shape = ilha))

# Lembrar das camadas de um ggplot: dados, estética, geometria,
# facetas, estatística, coordenadas, tema

#### 07 Gráfico de barras com o pacote ggplot2 ####

# Vamos visualizar a distribuição de uma variável categórica
ggplot(pinguins, aes(x = especie)) +
  geom_bar()

# Vamos ordenar os níveis da variável categórica
# Para isso, é necessário transformar a variável em um fator
# (como o R lida com dados categóricos) e, em seguida,
# reordenar os níveis desse fator
ggplot(pinguins, aes(x = fct_infreq(especie))) +
  geom_bar()

# Visualizar a relação entre duas variáveis categóricas
ggplot(pinguins, aes(x = ilha, fill = especie)) +
  geom_bar()

#### 08 Gráfico de boxplot ####

# Distribuição da massa corporal por espécie
ggplot(pinguins, aes(x = especie, y = massa_corporal)) +
  geom_boxplot()

#### 09 Gráfico de densidade ####

# Distribuição da massa corporal por espécie
ggplot(pinguins, aes(x = massa_corporal, color = especie)) +
  geom_density(linewidth = 0.75)

#### 10 Dividindo o gráfico em facetas ####

ggplot(pinguins, aes(x = comprimento_nadadeira, y = massa_corporal)) +
  geom_point(aes(color = especie, shape = especie)) +
  facet_wrap(~ilha)

# Fim do dia 1
# Não esqueça de salvar o script antes de fechar o RStudio
# Não precisa salvar o workspace

#### 11 Customizar gráficos ####

# Adicionar/mudar rótulos (labels) com a função labs()
ggplot(pinguins, aes(x = comprimento_nadadeira, y = massa_corporal)) +
  geom_point(aes(color = especie, shape = especie)) +
  facet_wrap(~ilha) +
  labs(x = "Comprimento da nadadeira em milímetros",
       y = "Massa corporal em gramas",
       color = "Espécie",
       shape = "Espécie",
       title = "Pinguins",
       subtitle = "Distribuição de três espécies de pinguins nas Ilhas Biscoe, Dream e Torgersen",
       caption = "Dados da tabela pinguin, presente no pacote dados")

# Mudar cores
ggplot(pinguins, aes(x = comprimento_nadadeira, y = massa_corporal)) +
  geom_point(aes(color = especie, shape = especie)) +
  scale_color_manual(values = c("black", "#E427F5", "blue")) + # Cores podem ser especificadas através do nome em inglês ou do código HEX
  facet_wrap(~ilha) +
  labs(x = "Comprimento da nadadeira em milímetros",
       y = "Massa corporal em gramas",
       color = "Espécie",
       shape = "Espécie",
       title = "Pinguins",
       subtitle = "Distribuição de três espécies de pinguins nas Ilhas Biscoe, Dream e Torgersen",
       caption = "Dados da tabela pinguin, presente no pacote dados")

# Mudar tema estético
ggplot(pinguins, aes(x = comprimento_nadadeira, y = massa_corporal)) +
  geom_point(aes(color = especie, shape = especie)) +
  facet_wrap(~ilha) +
  labs(x = "Comprimento da nadadeira em milímetros",
       y = "Massa corporal em gramas",
       color = "Espécie",
       shape = "Espécie",
       title = "Pinguins",
       subtitle = "Distribuição de três espécies de pinguins nas Ilhas Biscoe, Dream e Torgersen",
       caption = "Dados da tabela pinguin, presente no pacote dados") +
  theme_linedraw()

#### 12 Exportar gráfico para arquivo de imagem PNG ####

# Passar o gráfico para um objeto
pinguins_dist <- ggplot(pinguins, aes(x = comprimento_nadadeira, y = massa_corporal)) +
  geom_point(aes(color = especie, shape = especie)) +
  facet_wrap(~ilha) +
  labs(x = "Comprimento da nadadeira em milímetros",
       y = "Massa corporal em gramas",
       color = "Espécie",
       shape = "Espécie",
       title = "Pinguins",
       subtitle = "Distribuição de três espécies de pinguins nas Ilhas Biscoe, Dream e Torgersen",
       caption = "Dados da tabela pinguin, presente no pacote dados") +
  theme_linedraw()

# Salvar o gráfico em um arquivo de imagem .png
ggsave("pinguins_distribuicao.png", # Nome do arquivo
       plot = pinguins_dist, # Nome do objeto que contém o gráfico no ambiente do R
       path = NULL, # NULL significa que o arquivo vai ser salvo na pasta do projeto (se você estiver com um projeto aberto). Você também pode definir a localização no seu computador, se quiser.
       width = 10, # Defina a largura da imagem (unidade de medida abaixo)
       height = 6, # Defina a altura da imagem (unidade de medida abaixo)
       units = "in", # Defina a unidade de medida (in - inches, cm - centímetros, mm - milímetros, in - polegadas/inches) 
       dpi = 300, # Defina a qualidade da imagem em pontor por polegada (dpi - dots per inch). 300 dpi é o mínimo de resolução para imprimir o gráfico com qualidade.
       limitsize = FALSE) # Diga à função ggsave() para não limitar o tamanho do arquivo ao salvar

# Veja que o arquivo pinguins_distribuicao.png aparece na aba files/arquivos (caso você esteja no projeto)

#### 13 Importar dados de arquivo .csv para o R ####

# Vamos usar o pacote readr, que faz parte do tidyverse

# Em um arquivo .csv, a primeira linha é o cabeçalho: fornece os nomes das colunas
# As linhas seguintes fornecem os dados.
# As colunas são separadas, ou delimitadas, por vírgulas
# CSV = comma-separated values

# Vá no link abaixo e clique no pequeno ícone com uma seta apontando para baixo,
# para fazer o download do arquivo .csv:
# https://github.com/cienciadedatos/pt-r4ds/blob/traducao-pt-2ed/data/estudantes.csv
# Guarde o arquivo na mesma pasta do seu projeto: curso-R
# O arquivo vai aparecer na aba de arquivos/files no painel output/saída

# Vamos usar o operador de atribuição para manter os dados no objeto 'estudantes'
# Importar o arquivo .csv:
estudantes <- read_csv("estudantes.csv") # O primeiro argumento é o caminho para o arquivo

# A mensagem no console mostra que essa tabela possui 6 linhas e 5 colunas
# A vírgula foi usada para interpretar como os dados estão delimitados
# 4 colunas foram importadas como tipo caractere, ou seja, como texto
# 1 coluna foi importada como tipo double (dbl), ou seja, como números decimais

# Vamos dar uma olhada nos dados
estudantes
# 6 estudantes e 5 variáveis para cada estudante

# Outra maneira de visualizar a tabela
View(estudantes)

# Já podemos notar que existem algumas coisas para organizar e transformar
# nessa tabela que importamos. Vamos ver isso daqui a pouco.

# Fechar aba

#### 14 Importar dados de arquivo .xlsx para o R ####

# Primeiro, você precisa fazer o download da planilha de Excel que vamos usar:
# https://github.com/cienciadedatos/pt-r4ds/raw/traducao-pt-2ed/data/estudantes.xlsx

# Salve o arquivo estudantes.xlsx na pasta criada para o projeto curso-R
# O arquivo vai aparecer na aba de arquivos/files no painel output/saída

# Importe a planilha usando o pacote read_excel
estudantes <- read_excel("estudantes.xlsx")

# Vamos dar uma olhada nos dados
estudantes
View(estudantes)

# A coluna idade foi importada como uma variável texto, quando, na realidade,
# deveria ser numérica.
# Podemos passar o argumento col_types para a função read_excel() e especificar
# os tipos das colunas das variáveis que estamos importando.
estudantes <- read_excel("estudantes.xlsx",
                         col_names = c("estudante_id", "nome_completo",
                                       "comida_favorita", "refeicao_plano", "idade"),
                         skip = 1,
                         na = c("", "N/A"),
                         col_types = c("numeric", "text",
                                       "text", "text", "numeric"))

estudantes

# Porém, apenas isso também não produz o resultado desejado.
# Definindo que idade deve ser numérica, nós transformamos a célula com
# um valor não-numérico (aquela com valor cinco) em um NA.

# Neste caso, primeiro você deve importar idade como "text":
estudantes <- read_excel("estudantes.xlsx",
                         col_names = c("estudante_id", "nome_completo",
                                       "comida_favorita", "refeicao_plano", "idade"),
                         skip = 1,
                         na = c("", "N/A"),
                         col_types = c("numeric", "text",
                                       "text", "text", "text"))

# Vamos ver os dados
estudantes

#### 15 Organizar dados: renomear colunas ####

# Os nomes das colunas estão com formato inconsistente
estudantes
# Note como o tibble lida com espaços nos nomes das colunas
# `ID Estudante`
# Data frames normais não aceitam espaços e os transformam em pontos
# ID.Estudante

# Vamos usar snake_case para manter tudo consistente, usando o
# argumento col_names da função read_excel()
estudantes <- read_excel("estudantes.xlsx",
                         col_names = c("estudante_id", "nome_completo",
                                       "comida_favorita", "refeicao_plano", "idade"))

# Vamos visualizar os dados novamente
estudantes
View(estudantes)

# O que era anteriormente a linha de cabeçalho passou a aparecer nos dados
# como a primeira linha das observações
# Você pode pular esta linha usando o argumento skip da função read_excel()
estudantes <- read_excel("estudantes.xlsx",
                         col_names = c("estudante_id", "nome_completo",
                                       "comida_favorita", "refeicao_plano", "idade"),
                         skip = 1)

# Vamos visualizar os dados novamente
estudantes
View(estudantes)

# Note que algumas observações no conjunto de dados estudantes
# precisam ser transformadas. Vamos ver isso na proxima seção

#### 16 Organizar dados: pivotar, exemplo simples ####

# Vamos criar um conjunto de dados bem simples com a função tribble()
# do pacote tibble (pertence ao tidyverse, então já foi instalada)
# ps = "pressão sanguínea"
df <- tribble(
  ~id,  ~ps1, ~ps2,
  "A",  100,  120,
  "B",  140,  115,
  "C",  120,  125
)

# Visualise os dados
df

# Nós queremos que nosso conjunto de dados possua três variáveis:
# id (já existe na primeira coluna)
# medicao (o nome das colunas ps1 e ps2)
# e valor (valor das células em ps1 e ps2)
# Para obter essa forma, precisamos pivotar df para um formato mais longo:
df |> # Cmd ou Ctrl Shift M é o atalho de teclado para o pipe nativo
  pivot_longer(
    cols = ps1:ps2,
    names_to = "medicao", # vamos evitar acentos aqui
    values_to = "valor"
  )

# Vou detalhar sobre o encadeamento com o pipe |> na próxima seção

# Veja que os dados agora estão em formato tidy longo
df
View(df)

#### 17 Organizar dados: pivotar, exemplo mais complexo ####

# Como pivotar quando temos muitas variáveis nos nomes de colunas:

# Vamos usar o conjunto de dados dados_oms, que é a fonte da tabela1
?dados_oms
dados_oms
View(dados_oms)

# novos, descrevem se os casos são novos. Combinado com o diagnóstico vai indicar se é uma nova recaída
# fpp/fpn/ep/recaida, descrevem o método utilizado para o diagnóstico
# h/m é o gênero - genero (codificado como uma variável binária nesse conjunto de dados)
# 014/1524/2534/3544/4554/5564/65 é o intervalo de idade - idade (014 representa 0-14, por exemplo).

dados_oms_tidy <- dados_oms |> 
  pivot_longer(
    cols = !(pais:ano),
    names_to = c("tipo_de_caso", "diagnostico", "genero_idade"), 
    names_sep = "_",
    values_to = "contagem")

dados_oms_tidy
View(dados_oms_tidy)
unique(dados_oms_tidy$contagem)

# Separar os valores da coluna genoro_idade é um processo mais avançado
# Infelizmente não temos tempo neste curso

#### 18 Transformar dados ####

# Vamos usar um conjunto de dados do pacote dados: vôos que partiram de Nova York em 2013
?voos
voos
View(voos)

# dttm é do tipo date-time (data e hora)
# As operações possíveis sobre uma coluna dependem muito do seu “tipo”

# Notas sobre o pacote dplyr:
# 1) O primeiro argumento é sempre um data frame
# Os demais argumentos descrevem sobre quais colunas a operação será executada,
# utilizando o nome das variáveis (sem aspas, mesmo sendo texto)
# 3) A saída/resultado é sempre um novo data frame

# Filtrar somente os voos que saíram atrasados com mais de 120 minutos
voos |> 
  filter(atraso_saida > 120)

# Filtrar somente os voos que partiram em janeiro ou fevereiro
voos |> 
  filter(mes %in% c(1, 2)) |> 
  View()

# Organise todos os voos no data frame pela coluna atraso_saida (menor para maior)
voos |> 
  arrange(!desc(atraso_saida)) 
# Você usa o operador logico ! antes da função desc()

# Organise todos os voos no data frame pela coluna atraso_saida (maior para menor)
voos |> 
  arrange(desc(atraso_saida))

# Achar todos os pares únicos de origens e destinos
voos |> 
  distinct(origem, destino)

# Manter todas as colunas quandoprocurar todos os pares únicos de origens e destinos
voos |> 
  distinct(origem, destino, .keep_all = TRUE) |> 
  View()
# Não é uma coincidência que todos esses vôos distintos sejam em 1º de janeiro:
# distinct() irá achar a primeira ocorrência de uma linha única no conjunto de
# dados e decartar todas as demais

# Contar número total de voos que partiram da origem x e chegaram ao destino y
voos |>
  count(origem, destino, sort = TRUE)
# A nova coluna n contém o resultado da contagem

# Selecionar somente as colunas ano, mês e dia
voos |> 
  select(ano, mes, dia)

# Vamos usar mais um conjunto de dados do pacote dados:
# tabela1: Registros de tuberculose da Organização Mundial da Saúde (primeira variante)
# Veja mais informações usando a ajuda:
?tabela1

# Vamos ver os dados
tabela1
View(tabela1)

# Os dados da tabela1 serão muito mais fáceis de transformar dentro do tidyverse
# porque já estão organizados no no formato tidy

# Calcular a taxa de incidência de tuberculose por cada 10.000 pessoas
tabela1 |> 
  mutate(taxa = casos / populacao * 10000)

tabela1

# Visualizar mudanças ao longo do tempo
ggplot(tabela1, aes(x = ano, y = casos)) +
  geom_line(aes(group = pais), color = "grey50") +
  geom_point(aes(color = pais, shape = pais)) +
  scale_x_continuous(breaks = c(1999, 2000)) # quebras (breaks) no eixo-x em 1999 e 2000

# Calcular o total de casos de tuberculose por ano
tabela1 |> 
  group_by(ano) |> 
  summarize(total_casos = sum(casos))

# Lembrete: para guardar o resultado em um objeto ude o operador de atribuição
total_TB_ano <- tabela1 |> 
  group_by(ano) |> 
  summarize(total_casos = sum(casos))

total_TB_ano


#### 19 Exportar dados (organizados e transformados) para arquivo CSV ou Excel ####

total_TB_ano

# Exportar como arquivo .csv
write_csv(total_TB_ano, "total_TB_ano.csv")

# Exportar como arquivo de Excel
write_xlsx(total_TB_ano, "total_TB_ano.xlsx")





