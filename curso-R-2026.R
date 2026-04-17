# Análise de Dados com R
# Dr Carolina Correia
# 10 e 11 de Abril de 2026

# Exercícios foram extraídos do livro
# R para Ciência de Dados (2ª edição)
# Autores: Hadley Wickham, Mine Çetinkaya-Rundel, e Garrett Grolemund.
# https://pt.r4ds.hadley.nz


# Isto é um comentário.
# Comentários não são interpretados pelo R como comandos, opções ou argumentos.

# Este arquivo de texto .R é um script
# Um script é um arquivo de texto

# A ordem dos comandos é importante
# O R vai executar os comandos linha por linha, do topo para final do arquivo


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

# Para executar o código, mova o cursor do mouse para a linha desejada e
# pressione as teclas:
# Ctrl, Enter no Windows ou Linux
# Cmd, Enter no macOS
# Uma outra maneira é clicar no botão 'Run' acima

# Você pode usar o R para fazer cálculos básicos:
1 / 200 * 30
# Note que o separador decimal no resultado que aparece no console
# é um ponto, não uma vírgula

# Precisa esperar que o símbolo > apareça no console antes de executar
# o próximo comando. Normalmente é tão rápido que você nem nota

20 + 20

sin(pi / 2) # Calcular o seno de π (pi)
# Note que os dois parenteses saã adicionados automaticamente,
# o RStudio faz isso para você

# Existem 3 maneiras de definir variáveis/objetos no R:
x <- 3 * 4 # Esta é a maneira recomendada, usando o formato: variável <- valor
x = 1
2 -> x # Esse tipo de atribuição pode ser usada ao final de um encadeamento ou no ggplot
y <- 3

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

x == 2 # Aqui checamos se o valor de x é igual a 2, o resultado será um valor lógico (verdadeiro ou falso)
x != 2 # Aqui checamos se o valor de x é diferente de 2, o resultado será um valor lógico (verdadeiro ou falso)

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

#### 03 Instalar os pacotes necessários ####

# Pacotes são instalados somente quando você atualiza sua versão do R

# Remova as hashtags nas linhas 114 a 116 para transformar os comentários
# em commandos e executar as funções para instalar os pacotes,
# caso você não tenha feito isso antes

#install.packages("tidyverse", dependencies = TRUE)
#install.packages("writexl", dependencies = TRUE)
#install.packages("dados")
#install.packages("skimr")

#### 04 Carregar os pacotes necessários ####

# Toda vez que você iniciar o R, você vai precisar carregar
# os pacotes que você vai usar na sua análise

library(tidyverse) # Conjunto de pacotes, inclui o ggplot
library(readxl) # Este pacote faz parte do Tidyverse, então já está instalado
library(writexl) # Este pacote permite exportar dados do R para uma planilha de Excel
library(dados) # Este pacote contém conjuntos de dados úteis para praticar
library(skimr) # Este pacote cria uma tabela de resumo estatístico dos dados

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

# Um tibble é uma tipo de data frame: uma coleção tabular (formato de tabela) de
# variáveis (nas colunas) e observações (nas linhas)

# Neste contexto, uma variável refere-se a um atributo de todos os pinguins,
# e uma observação refere-se a todos os atributos de um único pinguim

# Para saber mais detalhes sobre o data frame, use a ajuda:
?pinguins

# Para ver a tabela inteira (abre em nova aba no painel editor de script):
View(pinguins)

# Fechar aba pinguins

# Usando o pacote skmir, rapidamente vemos os tipos de variáveis numéricas
# e categóricas no conjunto de dados pinguins
skim(pinguins)
# O resultado também mostra o número de valores ausentes (n_missing) e
# distrubuição das variáveis e os pencentis


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

# Adicionar linha horizontal para valor de referência
ggplot(data = pinguins,
       mapping = aes(x = comprimento_nadadeira,
                     y = massa_corporal,
                     color = especie, shape = especie)) +
  geom_point() +
  geom_hline(yintercept = 4500)

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

#### 10 Dividir o gráfico em facetas ####

ggplot(pinguins, aes(x = comprimento_nadadeira, y = massa_corporal)) +
  geom_point(aes(color = especie, shape = especie)) +
  facet_wrap(~ilha)

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

# Centralizar título e sub-título do gráfico
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
  theme(plot.title = element_text(hjust = 0.5), # Centralizar título (hjust é ajustamento horizontal)
        plot.subtitle = element_text(hjust = 0.5)) # Centralizar sub-título

# Mudar o tamanho e tipo de fonte
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
  theme(plot.title = element_text(hjust = 0.5),
        plot.subtitle = element_text(hjust = 0.5),
        text = element_text(size = 16, # tamanho da fonte
                            family = "Arial")) # família da fonte

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
       caption = "Dados da tabela pinguin, presente no pacote dados") +
  theme(plot.title = element_text(hjust = 0.5),
        plot.subtitle = element_text(hjust = 0.5))

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
  theme_linedraw() + # Precisa sempre vir antes de theme(), se inverter a ordem da funções não vai funcionar
  theme(plot.title = element_text(hjust = 0.5),
        plot.subtitle = element_text(hjust = 0.5))
 


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
       dpi = 300, # Defina a qualidade da imagem em pontos por polegada (dpi - dots per inch). 300 dpi é o mínimo de resolução para imprimir o gráfico com qualidade.
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

# Fechar aba estudantes

skim(estudantes)

#### 14 Importar dados de arquivo .xlsx para o R ####

# Primeiro, você precisa fazer o download da planilha de Excel que vamos usar:
# https://github.com/cienciadedatos/pt-r4ds/raw/traducao-pt-2ed/data/estudantes.xlsx

# Salve o arquivo estudantes.xlsx na pasta criada para o projeto curso-R
# O arquivo vai aparecer na aba de arquivos/files no painel output/saída

# Importe a planilha usando o pacote read_excel
estudantes <- read_excel("estudantes.xlsx")

# Vamos dar uma olhada nos dados
View(estudantes)
skim(estudantes)
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
                                       "comida_favorita", "refeicao_plano", 
                                       "idade"))

# Vamos visualizar os dados novamente
estudantes
View(estudantes)

# O que era anteriormente a linha de cabeçalho passou a aparecer nos dados
# como a primeira linha das observações
# Você pode pular esta linha usando o argumento skip da função read_excel()
estudantes <- read_excel("estudantes.xlsx",
                         col_names = c("estudante_id", "nome_completo",
                                       "comida_favorita", "refeicao_plano", 
                                       "idade"),
                         skip = 1) # Pula linhas na hora de importar a tabela

# Vamos visualizar os dados novamente
estudantes
View(estudantes)

# A coluna idade foi importada como uma variável texto (chr), quando na 
# realidade, deveria ser numérica.
# O argumento col_names permite que a gente passe um novo nome para as colunas
# Podemos passar o argumento col_types para a função read_excel() e especificar
# os tipos das colunas das variáveis que estamos importando.
estudantes <- read_excel("estudantes.xlsx",
                         col_names = c("estudante_id", "nome_completo",
                                       "comida_favorita", "refeicao_plano", 
                                       "idade"),
                         skip = 1, 
                         na = c("", "N/A"), # Determina quais valores devem ser considerados como ausentes
                         col_types = c("numeric", "text",
                                       "text", "text", "numeric"))

estudantes

# Porém, apenas isso também não produz o resultado desejado.
# Definindo que idade deve ser numérica, nós transformamos a célula com
# um valor não-numérico (aquela com valor cinco) em um NA.

# Neste caso, primeiro você deve importar idade como "text":
estudantes <- read_excel("estudantes.xlsx",
                         col_names = c("estudante_id", "nome_completo",
                                       "comida_favorita", "refeicao_plano", 
                                       "idade"),
                         skip = 1,
                         na = c("", "N/A"),
                         col_types = c("numeric", "text",
                                       "text", "text", "text"))

# Vamos ver os dados
estudantes

# Primeiro precisamos substituir o valor de texto "cinco"
# com o valor de texto 5
# A função replace() do base R não aceita a tabela inteira (data frame)
# como dados. Portanto, precisamos passar somente a coluna 'idade' em
# formato de vetor.
# Por isso, usamos o formato nome_tabela$nome_coluna
estudantes$idade <- replace(estudantes$idade, # Passar a coluna idade como vetor
                            estudantes$idade == "cinco", # Determinar a condição para a substituição
                            5) # Determinar o novo valor após a substituição

# Precisamos atribuir o resultado da função replace() para
# a coluna idade.
# Por isso usamos estudantes$idade <- replace()

# Vamos ver os dados após a substituição
estudantes

# O passo final é converter a coluna idade de texto (chr) para número
estudantes$idade <- as.numeric(estudantes$idade)

# Vamos ver os dados após a conversão
estudantes

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

# Visualize os dados
df

# Nós queremos que nosso conjunto de dados possua três variáveis:
# id (já existe na primeira coluna)
# medicao (o nome das colunas ps1 e ps2)
# e valor (valor das células em ps1 e ps2)
# Para obter essa forma, precisamos pivotar df para um formato mais longo:

pressao_longo <- df |> # Cmd ou Ctrl Shift M é o atalho de teclado para o pipe nativo
  pivot_longer(cols = ps1:ps2,
               names_to = "medicao", # Etiquetas/nomes das colunas ps1 a ps2 para nova coluna chamada 'medicao'
               values_to = "valor") # Valores das células das colunas ps1 a ps2 para nova coluna chamada 'valor'
  
# Vamos evitar acentos nos nomes das colunas
# No exemplo acima, o pipe nativo passa os dados de df para a função pivot_longer()
# O resultado de pivot_longer() é então atribuído ao objeto pressao_longo

# Veja que os dados agora estão em formato tidy longo
pressao_longo

#### 17 Organizar dados: pivotar para formato longo ####

# Exemplo 1: temos os dados nos nomes das colunas, tornando a tabela
# muito larga horizontalmente.
# Para estar no formato tidy, a tabela precisa ser longa verticalmente


# Vamos usar a tabela billboard, que marca a posição das músicas
# na billboard no ano 2000:
billboard
# As três primeiras colunas (artist, track e date.entered) são
# variáveis que descrevem a música. (artista, música, data adicionada)
# Em seguida, temos 76 colunas (wk1-wk76) que descrevem
# a posição da música em cada semana1. (wk = week = semana)
# Aqui, o nome das colunas é uma variável (a semana, wk) e o valor da célula
# é outra (a posicao).

# Para transformar esses dados em tidy, vamos usar a função pivot_longer():
billboard_tidy <- billboard |>
  pivot_longer(
    cols = starts_with("wk"), # seleciona todas as colunas que começam com as letras wk
    names_to = "week", # nomeia a nova coluna que vai conter a informação das semanas como week
    values_to = "rank") # nomeia a nova coluna que vai conter a informação da posição das músicas em rank

billboard_tidy
colnames(billboard_tidy)

# Usar o encadeamento para criar uma nova tabela contendo
# somente os top 10 artistas
billboard_tidy |>
  dplyr::group_by(artist) |> # Agrupar dados pela coluna 'artist'
  dplyr::summarize(total = n()) |> # Calcular o total de aparições por artista
  dplyr::arrange(desc(total)) |> # Ordenar o total do maior para o menor valor (descendente)
  dplyr::slice_head(n = 10) -> top10_artists
# slice_head() seleciona as primeiras 10 linhas da tabela
# -> top10_artists atribui o resultado para uma nova variável/objeto

# Veja a nova tabela com 10 linhas e 2 colunas
top10_artists

# Crie um gráfico de barras com a nova tabela
ggplot(data = top10_artists,
       aes(x = artist,
           y = total)) +
  geom_col() # ordem alfabética por padrão

# Mude a ordem dos dados no gráfico
ggplot(data = top10_artists,
       aes(x = reorder(artist, desc(total)), # função reorder() aplicada na coluna 'artist'
           y = total)) +
  geom_col()

# Mude o ângulo das etiquetas das barras no eixo X
ggplot(data = top10_artists,
       aes(x = reorder(artist, desc(total)), 
           y = total)) +
  geom_col() +
  theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1))

# Mude o nome das etiquetas dos eixos X e Y
ggplot(data = top10_artists,
       aes(x = reorder(artist, desc(total)), 
           y = total)) +
  geom_col() +
  theme(axis.text.x = element_text(angle = 45, 
                                   vjust = 1, 
                                   hjust = 1)) +
  labs(x = "Artista",
       y = "Total de aparições")

# Exemplo 2: como pivotar para formato longo quando temos muitas
# variáveis nos nomes de colunas:

# Vamos usar o conjunto de dados dados_oms, que é a fonte da tabela1
?dados_oms # Leia com atenção a descrição das colunas

View(dados_oms)
skim(dados_oms)
dados_oms

# novos - descrevem se os casos são novos. Combinado com o diagnóstico vai indicar se é uma nova recaída
# fpp/fpn/ep/recaida - descrevem o método utilizado para o diagnóstico
# h/m é o gênero - genero (codificado como uma variável binária nesse conjunto de dados)
# 014/1524/2534/3544/4554/5564/65 é o intervalo de idade - idade (014 representa 0-14, por exemplo).

colnames(dados_oms)
View(dados_oms)

dados_oms_tidy <- dados_oms |> 
  pivot_longer(
    cols = !c(pais:ano), # Não inclua as colunas de 'pais' (país) até 'ano'
    names_to = c("diagnostico", "genero", "idade"),
    names_pattern = "novos_(.*)_(.)(.*)", # Aqui estamos usando expressões regulares (regular expressions)
    values_to = "total")

# No argumento names_pattern acima, a expressão regular tem 4 grupos
# que correspodem ao padrão do nome das colunas: novos_fpp_h014
# Grupo 1: Precisa começar com "novos_"
# Grupo 2: (.*)_ significa quaisquer caracteres repetidos múltiplas vezes e segudos de um underscore/underline (por exemplo: fpp_, fpn_)
# Grupo 3: (.) significa qualquer caractere que aparece somente uma vez (por exemplo: h, m)
# Grupo 4: (.*) significa quaisquer caracteres repetidos múltiplas vezes (por exemplo: 014, 1524)

# Leia mais sobre expressões regulares (regular expressions) aqui:
# https://pt.r4ds.hadley.nz/regexps.html

View(dados_oms_tidy)
skim(dados_oms_tidy)
dados_oms_tidy

#### 18 Organizar dados: pivotar para formato largo ####

# Quando precisamos de pacotes que não usam o formato tidy,
# muitas vezes vamos precisar transformar uma tabela de dados
# para o formato longo (horizontalmente)

# Vamos usar o conjunto de dados do Centers of Medicare and Medicaid (USA) 
# que coleta dados sobre as experiências dos pacientes
cms_patient_experience

# Para ver o conjunto único de valores usamos a função distinct()
cms_patient_experience |> 
  distinct(measure_cd, measure_title)

# Para pivotar do formato longo para o formato largo, usamos a função pivot_wider()
cms_patient_experience |> 
  pivot_wider(
    names_from = measure_cd,
    values_from = prf_rate)


#### 19 Transformar dados: parte 1 ####

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
  filter(mes %in% c(1, 2)) |> # filter atua nas linhas
  View()

# voos que atrasaram mais de 120 minutos no primeiro trimestre do ano
atraso_trimestre_1 <- dplyr::filter(voos,
                                    atraso_saida >= 120,
                                    mes %in% c(1, 2, 3))


View(atraso_trimestre_1)

# Ordene todos os voos no data frame pela coluna atraso_saida (maior para menor)
voos |> 
  arrange(desc(atraso_saida)) 

# Achar todos os pares únicos de origens e destinos
voos |> 
  distinct(origem, destino)

# Manter todas as colunas quando procurar todos os pares únicos de origens e destinos
voos |> 
  distinct(origem, destino, .keep_all = TRUE) |> 
  View()

# Contar número total de voos que partiram da origem x e chegaram ao destino y
voos |>
  count(origem, destino, sort = TRUE)
# A nova coluna "n" contém o resultado da contagem

# Selecionar somente as colunas ano, mês e dia
voos |> 
  select(ano, mes, dia) # select atua nas colunas

# Vamos usar mais um conjunto de dados do pacote dados:
# tabela1: Registros de tuberculose da Organização Mundial da Saúde (primeira variante)
# Veja mais informações usando a ajuda:
?tabela1

# Vamos ver os dados
View(tabela1)
skim(tabela1)
tabela1
# Os dados da tabela1 serão muito mais fáceis de transformar dentro do tidyverse
# porque já estão organizados no no formato tidy

# Calcular a taxa de incidência de tuberculose por 100.000 pessoas
# e criar uma coluna categorizando em incidência alta ou baixa
tabela1 |> 
  dplyr::mutate(taxa = # nome da nova coluna
                  casos / populacao * 100000) |> # Calcula a incidência (não use separadores no número inteiro)
  dplyr::mutate(incidencia = # nome da nova coluna
                  case_when(taxa < 40 ~ "baixa", # Se o valor da variável taxa for menor do que 40, use o texto "baixa"
                            taxa > 40 ~ "alta", # # Se o valor da variável taxa for maior do que 40, use o texto "alta"
                            .default = NA)) # Se houver um valor ausente na coluna taxa, esse valor continua ausente na nova coluna incidencia
# A função mutate() do pacote dplyr sempre vai criar uma nova coluna

# Visualizar mudanças ao longo do tempo
ggplot(tabela1, aes(x = ano, y = casos)) +
  geom_line(aes(group = pais), color = "grey50") +
  geom_point(aes(color = pais, shape = pais)) +
  scale_x_continuous(breaks = c(1999, 2000)) # quebras (breaks) no eixo-x em 1999 e 2000

# Calcular o total de casos de tuberculose por ano
tabela1 |> 
  group_by(ano) |> 
  summarize(total_casos = sum(casos)) # a função sum() faz a adição doa valores

# Lembrete: para guardar o resultado em um objeto/variável
# use o operador de atribuição
total_TB_ano <- tabela1 |> 
  group_by(ano) |> 
  summarize(casos_totais = sum(casos))

total_TB_ano

#### 20 Transformar dados: parte 2 ####

# Vamos fazer uniões entre tabelas

# tibble 1
companhias_aereas
View(companhias_aereas)
# tibble 2
aeroportos
View(aeroportos)
# tibble 3
avioes
View(avioes)
# tibble 4
clima
View(clima)

### Uniões de mutação (Mutating joins):
# Uma união de mutação (mutating join),
# permite combinar variáveis de dois data frames: primeiro ela
# combina as observações por suas chaves e depois copia as variáveis
# de um data frame para outro

# Selecionar apenas algumas colunas de voos para reduzir a complexidade
voos2 <- voos |> 
  select(ano, data_hora, origem, destino, cauda, companhia_aerea)
voos2

# Left join
voos2 |>
  left_join(companhias_aereas)

# O resultado sempre terá as mesmas linhas de x (nesse caso, voos2).
# O principal uso da função left_join() é adicionar metadados
# adicionais. Neste exemplo, adicionamos o
# nome completo da companhia aérea aos dados voos2

# verificar se há valores ausentes (missing values)
voos2 |> 
  filter(is.na(cauda))


#### 21 Exportar dados (organizados e transformados) para arquivo CSV ou Excel ####

total_TB_ano

# Exportar como arquivo .csv
write_csv(total_TB_ano, "total_TB_ano.csv")

# Exportar como arquivo de Excel
write_xlsx(total_TB_ano, "total_TB_ano.xlsx")





