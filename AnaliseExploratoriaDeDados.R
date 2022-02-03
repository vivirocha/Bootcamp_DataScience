#Bootcamp - Cientista de dados - IGTI

#Cápitulo 1 - Análise exploratória de dados com recursos nativos do R.

#Iniciaremos criando um dataframe contendo o histórico de vendas de café.

dados <- data.frame(Vendas_Cafe = c(18, 20, 23, 23, 23, 23, 24, 25, 26, 26, 26, 26, 
                                     27, 28, 28, 
                                     29, 29, 30, 30, 31, 31, 33, 34, 35, 38, 39, 41, 44, 44, 46),
                    Preco_Cafe = c(4.77, 4.67, 4.75, 4.74, 4.63, 4.56, 4.59, 4.75, 4.75, 
                                   4.49, 4.41, 4.32, 4.68, 4.66, 4.42, 4.71, 4.66, 4.46, 4.36, 4.47, 
                                   4.43, 
                                   4.4, 4.61, 4.09, 3.73, 3.89, 4.35, 3.84, 3.81, 3.79),
                    Promocao = c("Nao", "Nao", "Nao", "Nao", "Nao", "Nao", "Nao", 
                                 "Nao", "Sim", 
                                 "Nao", "Sim", "Nao", "Nao", "Sim", "Sim", "Nao", "Sim", 
                                 "Sim", 
                                 "Sim", "Nao", "Nao", "Sim", "Sim", "Sim", "Nao", "Sim", 
                                 "Sim", 
                                 "Sim", "Sim", "Sim"),
                    Preco_Leite = c(4.74, 4.81, 4.36, 4.29, 4.17, 4.66, 4.73, 4.11, 4.21, 
                                    4.25, 
                                    4.62, 4.53, 4.44, 4.19, 4.37, 4.29, 4.57, 4.21, 4.77, 4, 
                                    4.31, 
                                    4.34, 4.05, 4.73, 4.07, 4.75, 4, 4.15, 4.34, 4.15))

# Utilizaremos o comando head para vermos os primeiros dados do dataframe.
head(dados)

# Utilizaremos $ para selecionar variáveis específicas dentro do nosso conjunto de dados.
summary(dados$Preco_Cafe)
#  Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# 3.730   4.353   4.480   4.426   4.668   4.770 

summary(dados$Vendas_Cafe)
# Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#18.00   25.25   28.50   30.00   33.75   46.00 

summary(dados$Preco_Leite)
#Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#4.000   4.175   4.325   4.374   4.607   4.810

# Utilizaremos o comando summary para verificarmos a estatística descritiva de todas as variáveis dos nossos dados.
summary(dados)

# Para verificarmos qual éo desvio padrão dos nossos dados, usaremos o comendo sd.
sd(dados$Preco_Cafe)
# 0.3220568
# Ou seja, o preço médio do café é 4.43 e o desvio padrão é 0.32.

sd(dados$Vendas_Cafe)
# 7.310833
# A média de quantidade de unidades vendidas de café é 30.00 e o desvio padrão é 7.31

sd(dados$Preco_Leite)
# 0.2558082
# O preço médio do leite é 4.37 e o desvio padrçao é 0.25

# Utilizaremos um gráfico do tipo histograma para visualizarmos a variável Preco_Cafe
hist(dados$Preco_Cafe)

"Como customizar o histograma: 
col = cor.
border = contorno das colunas.
main = Título principal do histograma.
col.main = cor do título do gráfico.
xlab = Título do eixo x.
ylab = Título do eixo y."

hist(dados$Preco_Cafe,
     col = "DeepSkyBlue",border = "blue",
     main = "Distribuição dos Preços Praticados para o café", col.main = "MidnightBlue",
     xlab = "Preços praticados",
     ylab = "Frequência")

"Se quisermos ver todos os histogramas na mesma página, distribuídos em 2 linhas e 2 colunas, 
precisamos utilizar o comando par para particionar os gráficos. Desta forma, conseguiremos analisar 
os três histogramas em uma única visualização."

par(mfrow=c(2,2))
hist(dados$Preco_Cafe,
     col = 'DeepSkyBlue', border = "blue",
     main = "Distribuição dos Preços Praticados para o café", col.main = "MidnightBlue",
     xlab = "Preços praticados",
     ylab = "Frequência")
hist(dados$Vendas_Cafe,
     col = 'Aquamarine', border = "blue",
     main = "Distribuição das vendas do Café", col.main = "MidnightBlue",
     xlab = "Preços praticados",
     ylab = "Frequência")
hist(dados$Preco_Leite,
     col = 'Orchid', border = "DeepPink",
     main = "Distribuição das vendas do Leite", col.main = "MidnightBlue",
     xlab = "Preços praticados",
     ylab = "Frequência")

#Para sairmos deste modo de visualização, basta inserir o comando dev.off.
dev.off()

# Relacionando os dados do preço do café com os dados de vendas do café.
plot(x = dados$Preco_Cafe,
     y = dados$Vendas_Cafe)

# Personalizando a plotagem:
# pch = tipo de "bolinha".
plot(x = dados$Preco_Cafe,
     y = dados$Vendas_Cafe,
     pch = 16,
     col = 'blue', border = "blue",
     xlab = 'Preço',
     ylab = "Quantidade vendida",
     main = "Relação entre o preço e as vendas do café", col.main = "MidnightBlue",)

# Colorindo os pontos de quando teve promoção
plot(x = dados$Preco_Cafe,
     y = dados$Vendas_Cafe,
     pch = 16,
     col = factor(dados$Promocao),
     xlab = 'Preço',
     ylab = "Quantidade vendida",
     main = "Relação entre o preço e as vendas do café")

# Add legenda
legend(x=4.4, y=45,
       c("Promoção", "Sem Promoção"),
       col = c("red", "black"),
       pch = c(16,16))

# Para add linhas ao gráfico, utilize grid().
grid()

# Criar uma nova variável que informará se a quantidade vendida está acima ou abaixo da média.
media <- mean(dados$Vendas_Cafe)

"Se as vendas do café estiverem acima da média, imprimir: Acima da Média, caso contrário, 
imprimir: Abaixo da média"

variavel <- ifelse(dados$Vendas_Cafe > media,
                   "Acima da média",
                   "Abaixo da média")

# Transformar a variável em fator.
variavel <- factor(variavel)

# Plotando a variável.
plot(variavel)

# Mostrar a quantidade de vendas abaixo da média e a quantidade de vendas acima da média.
table(variavel)
# Abaixo da média  Acima da média 
#19              11

# Boxplot das vendas
par(mfrow=c(1,2))
boxplot(dados$Vendas_Cafe,
        col = "Aquamarine", border = "blue",
        pch = 16,
        main = "Dados das Vendas de Café", col.main = "MidnightBlue")

# Boxplot do preço do café
boxplot(dados$Preco_Cafe,
        col = "Aquamarine", border = "blue",
        pch = 16,
        main = "Dados do Preço do Café", col.main = "MidnightBlue")
dev.off()

# Comparando quando houve e quando não houve promoção.
boxplot(dados$Vendas_Cafe~dados$Promocao,
        col = "blue", border = "black",
        pch = 16,
        xlab = "Promoção",
        ylab = "Vendas",
        main = "Vendas COM promoção vs Vendas SEM promoção",col.main = "MidnightBlue")
