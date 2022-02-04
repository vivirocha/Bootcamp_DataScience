#Bootcamp - Cientista de dados - IGTI

#Capitulo 1 - Analise exploratoria de dados com recursos nativos do R.

#Iniciaremos criando um dataframe contendo o historico de vendas de cafe.

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

# Utilizaremos $ para selecionar variaveis especificas dentro do nosso conjunto de dados.
summary(dados$Preco_Cafe)
#  Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# 3.730   4.353   4.480   4.426   4.668   4.770 

summary(dados$Vendas_Cafe)
# Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#18.00   25.25   28.50   30.00   33.75   46.00 

summary(dados$Preco_Leite)
#Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#4.000   4.175   4.325   4.374   4.607   4.810

# Utilizaremos o comando summary para verificarmos a estatistica descritiva de todas as variaveis dos nossos dados.
summary(dados)

# Para verificarmos qual e o desvio padrao dos nossos dados, usaremos o comendo sd.
sd(dados$Preco_Cafe)
# 0.3220568
# Ou seja, o preco medio do cafe e 4.43 e o desvio padrao e 0.32.

sd(dados$Vendas_Cafe)
# 7.310833
# A media de quantidade de unidades vendidas de cafe e 30.00 e o desvio padrao ? 7.31

sd(dados$Preco_Leite)
# 0.2558082
# O pre?o medio do leite ? 4.37 e o desvio padraao ? 0.25

# Utilizaremos um grafico do tipo histograma para visualizarmos a variavel Preco_Cafe
hist(dados$Preco_Cafe)

"Como customizar o histograma: 
col = cor.
border = contorno das colunas.
main = T?tulo principal do histograma.
col.main = cor do t?tulo do gr?fico.
xlab = T?tulo do eixo x.
ylab = T?tulo do eixo y."

hist(dados$Preco_Cafe,
     col = "DeepSkyBlue",border = "blue",
     main = "Distribuicao dos Precos Praticados para o cafe", col.main = "MidnightBlue",
     xlab = "Pre?os praticados",
     ylab = "Frequ?ncia")

"Se quisermos ver todos os histogramas na mesma pagina, distribuidos em 2 linhas e 2 colunas, 
precisamos utilizar o comando par para particionar os gr?ficos. Desta forma, conseguiremos analisar 
os tres histogramas em uma unica visualizacao."

par(mfrow=c(2,2))
hist(dados$Preco_Cafe,
     col = 'DeepSkyBlue', border = "blue",
     main = "Distribuicao dos Precos Praticados para o cafe", col.main = "MidnightBlue",
     xlab = "Precos praticados",
     ylab = "Frequencia")
hist(dados$Vendas_Cafe,
     col = 'Aquamarine', border = "blue",
     main = "Distribuicao das vendas do Cafe", col.main = "MidnightBlue",
     xlab = "Precos praticados",
     ylab = "Frequ?ncia")
hist(dados$Preco_Leite,
     col = 'Orchid', border = "DeepPink",
     main = "Distribui??o das vendas do Leite", col.main = "MidnightBlue",
     xlab = "Preccos praticados",
     ylab = "Frequ?ncia")

#Para sairmos deste modo de visualizacao, basta inserir o comando dev.off.
dev.off()

# Relacionando os dados do preco do cafe com os dados de vendas do cafe.
plot(x = dados$Preco_Cafe,
     y = dados$Vendas_Cafe)

# Personalizando a plotagem:
# pch = tipo de "bolinha".
plot(x = dados$Preco_Cafe,
     y = dados$Vendas_Cafe,
     pch = 16,
     col = 'blue', border = "blue",
     xlab = 'Preco',
     ylab = "Quantidade vendida",
     main = "Relacao entre o pre?o e as vendas do cafe", col.main = "MidnightBlue",)

# Colorindo os pontos de quando teve promo??o
plot(x = dados$Preco_Cafe,
     y = dados$Vendas_Cafe,
     pch = 16,
     col = factor(dados$Promocao),
     xlab = 'Preco',
     ylab = "Quantidade vendida",
     main = "Relacao entre o preco e as vendas do cafe")

# Add legenda
legend(x=4.4, y=45,
       c("Promocao", "Sem Promocao"),
       col = c("red", "black"),
       pch = c(16,16))

# Para add linhas ao grafico, utilize grid().
grid()

# Criar uma nova variavel que informar? Se a quantidade vendida esta acima ou abaixo da media.
media <- mean(dados$Vendas_Cafe)

"Se as vendas do cafe estiverem acima da media, imprimir: Acima da Media, caso contrario, 
imprimir: Abaixo da media"

variavel <- ifelse(dados$Vendas_Cafe > media,
                   "Acima da media",
                   "Abaixo da media")

# Transformar a variavel em fator.
variavel <- factor(variavel)

# Plotando a variavel.
plot(variavel)

# Mostrar a quantidade de vendas abaixo da media e a quantidade de vendas acima da media.
table(variavel)
# Abaixo da media  Acima da media 
#19              11

# Boxplot das vendas
par(mfrow=c(1,2))
boxplot(dados$Vendas_Cafe,
        col = "Aquamarine", border = "blue",
        pch = 16,
        main = "Dados das Vendas de Cafe", col.main = "MidnightBlue")

# Boxplot do preco do cafe.
boxplot(dados$Preco_Cafe,
        col = "Aquamarine", border = "blue",
        pch = 16,
        main = "Dados do Pre?o do Cafe", col.main = "MidnightBlue")
dev.off()

# Comparando quando houve e quando nao houve promocao.
boxplot(dados$Vendas_Cafe~dados$Promocao,
        col = "blue", border = "black",
        pch = 16,
        xlab = "Promo??o",
        ylab = "Vendas",
        main = "Vendas COM promocao vs Vendas SEM promocao",col.main = "MidnightBlue")
