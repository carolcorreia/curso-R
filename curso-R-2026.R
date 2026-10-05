# Análise de Dados com R
# Dr Carolina Correia
# 18 e 19 de setembro de 2026

# Exercícios foram extraídos do livro
# R para Ciência de Dados (2ª edição)
# Autores: Hadley Wickham, Mine Çetinkaya-Rundel, e Garrett Grolemund.
# https://r4ds.hadley.nz (Inglês)
# https://pt.r4ds.hadley.nz (Português)


# Isto é um comentário.
# Comentários não são interpretados pelo R como comandos, opções ou argumentos.

# Este arquivo de texto .R é um script
# Um script é um arquivo de texto

# A ordem dos comandos é importante
# O R vai executar os comandos linha por linha,
# do topo para o final do arquivo


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

# Para executar o código, mova o cursor do mouse
# para a linha desejada e pressione as teclas:
# Ctrl, Enter no Windows ou Linux
# Cmd, Enter no macOS
# Uma outra maneira é clicar no botão 'Run' acima

# Você pode usar o R para fazer cálculos básicos:
1 / 200 * 30
# Note que o separador decimal no resultado que
# aparece no console é um ponto, não uma vírgula.

# Precisa esperar que o símbolo > apareça no console
# antes de executar o próximo comando.
# Normalmente é tão rápido que você nem nota.

20 + 20

sin(pi / 2) # Calcular o seno de π (pi)
# Note que os dois parenteses são adicionados
# automaticamente, o RStudio faz isso para você.

# Existem 3 maneiras de definir variáveis/objetos no R:
x <- 3 * 4 # 1) Esta é a maneira recomendada, usando o formato:
# variável/objeto <- valor

x = 1 # 2) Melhor evitar usar esta maneira de atribuir

2 -> x # 3) Esse tipo de atribuição é melhor ser usada ao
# final de um encadeamento ou ao final de um no ggplot

y <- 3

# Note que o valor de x não é mostrado no console,
# ele é armazenado no objeto x
# O objeto 'x' recebe o valor 12
# Se você quiser ver o valor, digite 'x' no console
# ou execute 'x' no script abaixo
x

x + y
# Note que o ambiente agora mostra 'x' e o seu valor

# Para atribuir um valor de texto,
# precisamos colocar o texto entre aspas:
x <- "olá mundo"

# Atalho de teclado para inserir operador de atribuição <-
# Windows: Alt+ ou Alt-
# macOS: Option+ ou Option-

x == 2 # Aqui perguntamos ao R se o valor de x é igual a 2,
# o resultado será um valor lógico (verdadeiro ou falso)

x != 2 # Aqui perguntamos ao R se o valor de x é diferente de 2,
# o resultado será um valor lógico (verdadeiro ou falso)

# Criar um vetor numérico com a função c()
primos <- c(2, 3, 5, 7, 11, 13)
primos

# Criar um vetor de caracteres
risco <- c("alto", "médio", "baixo")
risco

# Converter vetor de caracteres para vetor de fatores
risco <- as.factor(risco)
levels(risco)

# Criar vetor de caracteres com ordem específica
risco <- ordered(risco, 
                 levels = c("baixo", "médio", "alto")) 
levels(risco)

# Matriz
m <- matrix(1:6, nrow = 2, ncol = 3)
m

# Data frame
df <- data.frame(col1 = 1:4, 
                 col2 = c("manga", "laranja", 
                          "uva", "morango"))
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
#install.packages("palmerpenguins")

#### 04 Carregar os pacotes necessários ####

# Toda vez que você iniciar o R, você vai precisar carregar
# os pacotes que você vai usar na sua análise

library(tidyverse) # Conjunto de pacotes, inclui o ggplot

library(readxl) # Este pacote faz parte do Tidyverse,
# então já está instalado

library(writexl) # Este pacote permite exportar dados do R
# para uma planilha de Excel

library(tibble) # Este pacote faz parte do Tidyverse,
# então já está instalado

library(palmerpenguins) # Este pacote contém dados que vamos usar

library(nycflights13) # Este pacote faz parte do dplyr que
# vem com o Tidyverse, então já está instalado

#### 05 Carregar dados que já foram limpos/transformados ####

# Nota: o fluxo de trabalho mais comum no R seria:
# 1) Importar dados de uma planilha para o R
# 2) Arrumar/organizar (data tidying)
# 3) Transformar os dados (data wrangling)
# 4) Visualizar os dados

# Para facilitar o aprendizado e devido ao curso ser curto, vamos
# começar pela visualização dos dados

# Vamos dar uma olhada no data frame penguins,
# que faz parte do pacote palmerpenguins:
penguins

# Dados aparecem no console como um tibble:
# por padrão, mostra somente as 10 primeiras linhas da tabela

# Penguins contém um tibble de 344 linhas (observações)
# e 8 colunas (variáveis)
# Apenas as 6 primeiras colunas aparecem no console
# Já podemos ver que alguns valores estão ausentes: NA
# Ao final do tibble vemos que existem mais 334 linhas
# e mais 2 colunas
# O nome e tipo de dados das 2 colunas também é listado:
# sex <fatores> e year <números inteiros>

# Um tibble é uma tipo de data frame:
# uma coleção tabular (formato de tabela) de
# variáveis (nas colunas) e observações (nas linhas)

# Neste contexto, uma variável refere-se a um atributo
# de todos os pinguins,
# e uma observação refere-se a todos os atributos
# de um único pinguim.

# Para saber mais detalhes sobre o data frame,
# digite penguins na aba help.

# Para ver a tabela inteira (abre em nova aba no painel editor de script):
View(penguins)

# Fechar aba pinguins


#### 06 Gráfico de dispersão com o pacote ggplot2 ####

# Primeira camada: o conjunto de dados a ser usado no gráfico
ggplot(data = penguins)
# Cria um gráfico vazio porquê ainda não dissemos
# como fazer a visualização

# Vamos checar os nomes da colunas no dataset penguins
colnames(penguins)

# Vamos especificar quais variáveis (colunas)
# devem ser mapeadas nos eixos x e y
ggplot(data = penguins,
       mapping = aes(x = flipper_length_mm, # comprimento da nadadeira em milímetros
                     y = body_mass_g)) # massa corporal em gramas

# Porém, ainda não definimos como representar as
# observações do data frame em nosso gráfico.

# Precisamos definir um geom: A geometria que um gráfico
# usa para representar os dados.

# A função geom_point() adiciona uma camada de pontos
# ao seu gráfico,
# o que cria um gráfico de dispersão
ggplot(data = penguins,
       mapping = aes(x = flipper_length_mm,
                     y = body_mass_g)) +
  geom_point()

# Vemos que uma mensagem de aviso (warning message) apareceu
# no console. Observações que estão faltando/em branco
# e foram marcadas como NA foram removidas do gráfico.

# O gráfico aparece na aba de Plots, no painel de output/saída

# Agora vamos adicionar atributos estéticos
ggplot(data = penguins,
       mapping = aes(x = flipper_length_mm,
                     y = body_mass_g,
                     color = species)) + # Mapear as espécies por cor
  geom_point()

# Mapear as espécies por cor e forma
ggplot(data = penguins,
       mapping = aes(x = flipper_length_mm,
                     y = body_mass_g,
                     color = species,
                     shape = species)) + # Mapear as espécies por formato do ponto
  geom_point()

# Adicionar linha horizontal para valor de referência
ggplot(data = penguins,
       mapping = aes(x = flipper_length_mm,
                     y = body_mass_g,
                     color = species,
                     shape = species)) +
  geom_point() +
  geom_hline(yintercept = 4500)

# Lembrar das camadas de um ggplot: dados, estética, geometria,
# facetas, estatística, coordenadas, tema

#### 07 Gráfico de barras com o pacote ggplot2 ####

# Vamos visualizar a distribuição de uma variável categórica
ggplot(penguins,
       aes(x = species)) +
  geom_bar()

# Vamos ordenar os níveis da variável categórica
# Para isso, é necessário transformar a variável em um fator
# (como o R lida com dados categóricos) e, em seguida,
# reordenar os níveis desse fator
ggplot(penguins,
       aes(x = fct_infreq(species))) +
  geom_bar()

# Visualizar a relação entre duas variáveis categóricas
ggplot(penguins,
       aes(x = island,
           fill = species)) +
  geom_bar()

#### 08 Gráfico de boxplot ####

# Distribuição da massa corporal por espécie
ggplot(penguins,
       aes(x = species,
           y = body_mass_g)) +
  geom_boxplot()

#### 09 Gráfico de densidade ####

# Distribuição da massa corporal por espécie
ggplot(penguins,
       aes(x = body_mass_g,
           color = species)) +
  geom_density(linewidth = 0.75)

#### 10 Dividir o gráfico em facetas ####

ggplot(penguins,
       aes(x = flipper_length_mm,
           y = body_mass_g)) +
  geom_point(aes(color = species, 
                 shape = species)) +
  facet_wrap(~island)

#### 11 Customizar gráficos ####

# Adicionar/mudar rótulos (labels) com a função labs()
ggplot(penguins, 
       aes(x = flipper_length_mm,
           y = body_mass_g)) +
  geom_point(aes(color = species,
                 shape = species)) +
  facet_wrap(~island) +
  labs(x = "Comprimento da nadadeira em milímetros",
       y = "Massa corporal em gramas",
       color = "Espécie",
       shape = "Espécie",
       title = "Pinguins",
       subtitle = "Distribuição de três espécies de pinguins nas Ilhas Biscoe, Dream e Torgersen",
       caption = "Dados da tabela pinguin, presente no pacote dados")

# Centralizar título e sub-título do gráfico
ggplot(penguins,
       aes(x = flipper_length_mm,
           y = body_mass_g)) +
  geom_point(aes(color = species,
                 shape = species)) +
  facet_wrap(~island) +
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
ggplot(penguins,
       aes(x = flipper_length_mm,
           y = body_mass_g)) +
  geom_point(aes(color = species,
                 shape = species)) +
  facet_wrap(~island) +
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
ggplot(penguins,
       aes(x = flipper_length_mm, 
           y = body_mass_g)) +
  geom_point(aes(color = species, 
                 shape = species)) +
  scale_color_manual(values = c("black", "#E427F5", "blue")) + # Cores podem ser especificadas através do nome em inglês ou do código HEX
  facet_wrap(~island) +
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
ggplot(penguins,
       aes(x = flipper_length_mm,
           y = body_mass_g)) +
  geom_point(aes(color = species,
                 shape = species)) +
  facet_wrap(~island) +
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
pinguins_dist <- ggplot(penguins, 
                        aes(x = flipper_length_mm,
                            y = body_mass_g)) +
  geom_point(aes(color = species,
                 shape = species)) +
  facet_wrap(~island) +
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

# Veja que o arquivo pinguins_distribuicao.png aparece
# na aba files/arquivos (caso você esteja no projeto).

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
estudantes <- readr::read_csv("estudantes.csv") # O primeiro argumento é o caminho para o arquivo

# o formato readr::read_csv() significa:
# nome_do_pacote::nome_da_função

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


#### 14 Importar dados de arquivo .xlsx para o R ####

# Primeiro, você precisa fazer o download da planilha de Excel que vamos usar:
# https://github.com/cienciadedatos/pt-r4ds/raw/traducao-pt-2ed/data/estudantes.xlsx

# Salve o arquivo estudantes.xlsx na pasta criada para o projeto curso-R
# O arquivo vai aparecer na aba de arquivos/files no painel output/saída

# Importe a planilha usando o pacote read_excel
estudantes <- readxl::read_excel("estudantes.xlsx")

# Vamos dar uma olhada nos dados
View(estudantes)

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
estudantes <- readxl::read_excel("estudantes.xlsx",
                                 col_names = c("estudante_id", 
                                               "nome_completo",
                                               "comida_favorita", 
                                               "refeicao_plano", 
                                               "idade"))

# Vamos visualizar os dados novamente
estudantes
View(estudantes)

# O que era anteriormente a linha de cabeçalho passou a aparecer nos dados
# como a primeira linha das observações
# Você pode pular esta linha usando o argumento skip da função read_excel()
estudantes <- readxl::read_excel("estudantes.xlsx",
                                 col_names = c("estudante_id", 
                                               "nome_completo",
                                               "comida_favorita", 
                                               "refeicao_plano",
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
estudantes <- readxl::read_excel("estudantes.xlsx",
                                 col_names = c("estudante_id", 
                                               "nome_completo",
                                               "comida_favorita", 
                                               "refeicao_plano", 
                                               "idade"),
                                 skip = 1, 
                                 na = c("", "N/A"), # Determina quais valores devem ser considerados como ausentes
                                 col_types = c("numeric", 
                                               "text",
                                               "text", 
                                               "text", 
                                               "numeric"))

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
View(estudantes)

#### 16 Organizar dados: pivotar, exemplo simples ####

# Vamos criar um conjunto de dados bem simples com a função tribble()
# do pacote tibble (pertence ao tidyverse, então já foi instalada)
# ps = "pressão sanguínea"
df <- tibble::tribble(
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
  tidyr::pivot_longer(cols = ps1:ps2,
                      names_to = "medicao", # Etiquetas/nomes das colunas ps1 a ps2 para nova coluna chamada 'medicao'
                      values_to = "valor") # Valores das células das colunas ps1 a ps2 para nova coluna chamada 'valor'
  
# Vamos evitar acentos nos nomes das colunas
# No exemplo acima, o pipe nativo passa os dados de df para a função pivot_longer()
# O resultado de pivot_longer() é então atribuído ao objeto pressao_longo

# Veja que os dados agora estão em formato tidy longo
pressao_longo

#### 17 Organizar dados: pivotar para formato longo, exemplo 1 ####

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
billboard_tidy <- billboard |> # Este é o pipe
  tidyr::pivot_longer(
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

#### 18 Organizar dados: pivotar para formato longo, exemplo 2 ####

# Como pivotar para formato longo quando temos muitas
# variáveis nos nomes das colunas:

# Vamos usar o dataset who2 que vem com o pacote tidyr
?who2 # Leia com atenção a descrição das colunas
# (não confunda com o dataset who)

View(who2)
who2
colnames(who2)

# O conjunto de dados who2 foi coletado pela Organização Mundial
# da Saúde e contém informações sobre diagnósticos de
# tuberculose. Há duas colunas que já são variáveis
# e são fáceis de interpretar: country (país) e year (ano).
# Elas são seguidas por 56 colunas como:
# sp_m_014, sn_m_014, ep_m_4554 e rel_m_3544

# Podemos perceber um padrão aqui: cada nome de coluna é
# composto por três partes separadas por _

# A primeira parte, rel/sn/sp/ep, descreve o método usado
# para o diagnóstico:
# rel = recidiva, sn = esfregaço pulmonar negativo,
# sp = esfregaço pulmonar positivo, ep = extrapulmonar;

# A segunda parte, m/f, é o sexo (codificado como uma
# variável binária neste conjunto de dados):
# f = female, m = male;

# E a terceira parte, 014/1524/2534/3544/4554/5564/65,
# é a faixa etária:
# 014 = 0-14 anos de idade, 1524 = 15-24 anos,
# 2534 = 25-34 anos, 3544 = 35-44 anos de idade,
# 4554 = 45-54 anos, 5564 = 55-64 anos, 65 = 65 anos ou mais

# Neste caso, temos seis informações registradas no who2:
# (1) o país e (2) o ano (já em colunas);
# (3) o método de diagnóstico, (4) a categoria de sexo e
# (5) a categoria de faixa etária
# (1 a 5 contidas nos nomes das outras colunas);
# e (6) a contagem de pacientes nessa categoria
# (valores das células).

# Para organizar essas seis informações em
# seis colunas separadas, usamos pivot_longer()
# com um vetor de nomes de colunas para names_to
# e um vetor de nomes de colunas para names_sep
# dividindo os nomes das variáveis originais em partes
# para names_sep,
# bem como um vetor de nomes de colunas para values_to:
who2 |> 
  pivot_longer(
    cols = !(country:year), # o ! exclui as colunas country e year, já que não precisamos pivotá-las
    names_to = c("diagnosis", "gender", "age"), 
    names_sep = "_", # usa o símbolo _ como separdor
    values_to = "count"
  ) -> who2_pivot

View(who2_pivot) # Veja o resultado da pivotagem longa

View(who2) # Compare com a tabela original

#### 19 Organizar dados: pivotar para formato largo ####

# Quando precisamos de pacotes que não usam o formato tidy,
# muitas vezes vamos precisar transformar uma tabela de dados
# para o formato largo (horizontalmente)

# Vamos usar o conjunto de dados do Centers of Medicare
# and Medicaid (USA) que coleta dados sobre as experiências
# dos pacientes nos EUA (faz parte to pacote tidyr)
?cms_patient_experience # abre a ajuda
cms_patient_experience
View(cms_patient_experience)

# Para ver o conjunto único de valores usamos a função distinct()
cms_patient_experience |> 
  distinct(measure_cd, measure_title)

# Para pivotar do formato longo para o formato largo, usamos a função pivot_wider()
cms_patient_experience |> 
  pivot_wider(
    names_from = measure_cd,
    values_from = prf_rate) -> cms_pat_exp_pivot

View(cms_pat_exp_pivot) # veja o resultado da pivotagem larga

#### 20 Transformar dados: parte 1 ####

# Notas sobre o pacote dplyr:
# 1) O primeiro argumento é sempre um data frame
# Os demais argumentos descrevem sobre quais colunas a operação será executada,
# utilizando o nome das variáveis (sem aspas, mesmo sendo texto)
# 3) A saída/resultado é sempre um novo data frame

# Vamos usar um conjunto de dados do pacote nycflights13
# São dados de vôos que partiram de aeroportos em Nova York
# no ano de 2013
?flights
View(flights)

colnames(flights)

# Filtrar somente os voos que saíram atrasados
# com mais de 120 minutos
flights |> 
  filter(dep_delay > 120)

# Filtrar somente os voos que partiram em janeiro ou fevereiro
flights |> 
  filter(month %in% c(1, 2)) |> # filter atua nas linhas
  View()

# voos que atrasaram mais de 120 minutos no primeiro
# trimestre do ano
atraso_trimestre_1 <- dplyr::filter(flights,
                                    dep_delay >= 120,
                                    month %in% c(1, 2, 3))


View(atraso_trimestre_1)

# Ordene todos os voos no data frame pela
# coluna atraso_saida (maior para menor)
flights |> 
  arrange(desc(dep_delay)) 

# Achar todos os pares únicos de origens e destinos
flights |> 
  distinct(origin, dest)

# Manter todas as colunas quando procurar todos os
# pares únicos de origens e destinos
flights |> 
  distinct(origin, dest, .keep_all = TRUE) |> 
  View()

# Contar número total de voos que partiram da
# origem X e chegaram ao destino Y
flights |>
  count(origin, dest, sort = TRUE)
# A nova coluna "n" contém o resultado da contagem

# Selecionar somente as colunas ano, mês e dia
flights |> 
  select(year, month, day) # select atua nas colunas

# Top 10 destinos na tabela flights
flights |>
  count(dest, sort = TRUE) |>
  head(10)


# Vamos usar mais um conjunto de dados do pacote tidyr:
# table1: Registros de tuberculose da Organização Mundial da
# Saúde (primeira variante)
# Veja mais informações usando a ajuda:
?table1

# Vamos ver os dados
View(table1)
table1
# Os dados da table1 serão muito mais fáceis de
# transformar dentro do tidyverse,
# porque já estão organizados no formato tidy

# Calcular a taxa de incidência de tuberculose a cada 
# 100.000 pessoas e criar uma coluna categorizando
# em incidência alta ou baixa
table1 |> 
  dplyr::mutate(taxa = # nome da nova coluna
                  cases / population * 100000) |> # Calcula a incidência (não use separadores no número inteiro)
  dplyr::mutate(incidencia = # nome da nova coluna
                  case_when(taxa < 40 ~ "baixa", # Se o valor da variável taxa for menor do que 40, use o texto "baixa"
                            taxa > 40 ~ "alta", # # Se o valor da variável taxa for maior do que 40, use o texto "alta"
                            .default = NA)) # Se houver um valor ausente na coluna taxa, esse valor continua ausente na nova coluna incidencia
# A função mutate() do pacote dplyr sempre vai criar uma nova coluna

# Visualizar mudanças ao longo do tempo
ggplot(table1, aes(x = year, 
                   y = cases)) +
  geom_line(aes(group = country), 
            color = "grey50") +
  geom_point(aes(color = country, 
                 shape = country)) +
  scale_x_continuous(breaks = c(1999, 2000)) # quebras (breaks) no eixo-x em 1999 e 2000

# Calcular o total de casos de tuberculose por ano
table1 |> 
  group_by(year) |> 
  summarize(total_casos = sum(cases)) # a função sum() faz a adição doa valores

# Lembrete: para guardar o resultado em um objeto/variável
# use o operador de atribuição
total_TB_ano <- table1 |> 
  group_by(year) |> 
  summarize(casos_totais = sum(cases))

total_TB_ano

#### 21 Transformar dados: parte 2 ####

# Vamos fazer uniões entre tabelas do pacote nycflights13

# tibble 1
?flights
View(flights)

# tibble 2
?airlines
View(airlines)

# tibble 3
?planes
View(planes)


### Uniões de mutação (Mutating joins):
# Uma união de mutação (mutating join),
# permite combinar variáveis de dois data frames: primeiro ela
# combina as observações por suas chaves e depois copia as variáveis
# de um data frame para outro

# Selecionar apenas algumas colunas de flights
# para reduzir a complexidade
flights2 <- flights |> 
  dplyr::select(year, time_hour, origin, dest, tailnum, carrier)

flights2
View(flights2)

colnames(flights2) # Listar nomes das columnas em flights2
colnames(airlines) # Listar nomes das columnas em airlines

# Unir as tabelas flights 2 e airlines usando a coluna
# carrier como chave de união
flights2 |> 
  left_join(airlines, join_by(carrier)) 

# O resultado sempre terá as mesmas linhas da primeira tabela
# (nesse caso, flights2).
# O principal uso da função left_join() é adicionar metadados
# adicionais. Neste exemplo, adicionamos o
# nome completo da companhia aérea aos dados flights2

# Verificar se há valores ausentes (missing values)
flights2 |> 
  filter(is.na(tailnum)) |> 
  View()

# Quando left_join() não encontra uma correspondência para
# uma linha em X, ela preenche as novas variáveis com valores ausentes. Por exemplo,
# Não há informações sobre o avião com número de cauda N3ALAA, então o
# tipo, motores e assentos estarão ausentes:
flights2 |> 
  filter(tailnum == "N3ALAA") |> 
  left_join(planes |> select(tailnum, type, engines, seats)) |> 
  View()

#### 22 Exportar dados (organizados e transformados) para arquivo CSV ou Excel ####

total_TB_ano

# Exportar como arquivo .csv
readr::write_csv(total_TB_ano, 
                 "total_TB_ano.csv")

# Exportar como arquivo de Excel
writexl::write_xlsx(total_TB_ano,
                    "total_TB_ano.xlsx")





