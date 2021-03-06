#Bootcamp - Cientista de dados - IGTI

#C�pitulo 1 - An�lise explorat�ria de dados com recursos nativos do R.

#Iniciaremos criando um dataframe contendo o hist�rico de vendas de caf�.

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

# Utilizaremos $ para selecionar vari�veis espec�ficas dentro do nosso conjunto de dados.
summary(dados$Preco_Cafe)
#  Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# 3.730   4.353   4.480   4.426   4.668   4.770 

summary(dados$Vendas_Cafe)
# Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#18.00   25.25   28.50   30.00   33.75   46.00 

summary(dados$Preco_Leite)
#Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#4.000   4.175   4.325   4.374   4.607   4.810

# Utilizaremos o comando summary para verificarmos a estat�stica descritiva de todas as vari�veis dos nossos dados.
summary(dados)

# Para verificarmos qual �o desvio padr�o dos nossos dados, usaremos o comendo sd.
sd(dados$Preco_Cafe)
# 0.3220568
# Ou seja, o pre�o m�dio do caf� � 4.43 e o desvio padr�o � 0.32.

sd(dados$Vendas_Cafe)
# 7.310833
# A m�dia de quantidade de unidades vendidas de caf� � 30.00 e o desvio padr�o � 7.31

sd(dados$Preco_Leite)
# 0.2558082
# O pre�o m�dio do leite � 4.37 e o desvio padr�ao � 0.25

# Utilizaremos um gr�fico do tipo histograma para visualizarmos a vari�vel Preco_Cafe
hist(dados$Preco_Cafe)

"Como customizar o histograma: 
col = cor.
border = contorno das colunas.
main = T�tulo principal do histograma.
col.main = cor do t�tulo do gr�fico.
xlab = T�tulo do eixo x.
ylab = T�tulo do eixo y."

hist(dados$Preco_Cafe,
     col = "DeepSkyBlue",border = "blue",
     main = "Distribui��o dos Pre�os Praticados para o caf�", col.main = "MidnightBlue",
     xlab = "Pre�os praticados",
     ylab = "Frequ�ncia")

"Se quisermos ver todos os histogramas na mesma p�gina, distribu�dos em 2 linhas e 2 colunas, 
precisamos utilizar o comando par para particionar os gr�ficos. Desta forma, conseguiremos analisar 
os tr�s histogramas em uma �nica visualiza��o."

par(mfrow=c(2,2))
hist(dados$Preco_Cafe,
     col = 'DeepSkyBlue', border = "blue",
     main = "Distribui��o dos Pre�os Praticados para o caf�", col.main = "MidnightBlue",
     xlab = "Pre�os praticados",
     ylab = "Frequ�ncia")
hist(dados$Vendas_Cafe,
     col = 'Aquamarine', border = "blue",
     main = "Distribui��o das vendas do Caf�", col.main = "MidnightBlue",
     xlab = "Pre�os praticados",
     ylab = "Frequ�ncia")
hist(dados$Preco_Leite,
     col = 'Orchid', border = "DeepPink",
     main = "Distribui��o das vendas do Leite", col.main = "MidnightBlue",
     xlab = "Pre�os praticados",
     ylab = "Frequ�ncia")

#Para sairmos deste modo de visualiza��o, basta inserir o comando dev.off.
dev.off()

# Relacionando os dados do pre�o do caf� com os dados de vendas do caf�.
plot(x = dados$Preco_Cafe,
     y = dados$Vendas_Cafe)

# Personalizando a plotagem:
# pch = tipo de "bolinha".
plot(x = dados$Preco_Cafe,
     y = dados$Vendas_Cafe,
     pch = 16,
     col = 'blue', border = "blue",
     xlab = 'Pre�o',
     ylab = "Quantidade vendida",
     main = "Rela��o entre o pre�o e as vendas do caf�", col.main = "MidnightBlue",)

# Colorindo os pontos de quando teve promo��o
plot(x = dados$Preco_Cafe,
     y = dados$Vendas_Cafe,
     pch = 16,
     col = factor(dados$Promocao),
     xlab = 'Pre�o',
     ylab = "Quantidade vendida",
     main = "Rela��o entre o pre�o e as vendas do caf�")

# Add legenda
legend(x=4.4, y=45,
       c("Promo��o", "Sem Promo��o"),
       col = c("red", "black"),
       pch = c(16,16))

# Para add linhas ao gr�fico, utilize grid().
grid()

# Criar uma nova vari�vel que informar� se a quantidade vendida est� acima ou abaixo da m�dia.
media <- mean(dados$Vendas_Cafe)

"Se as vendas do caf� estiverem acima da m�dia, imprimir: Acima da M�dia, caso contr�rio, 
imprimir: Abaixo da m�dia"

variavel <- ifelse(dados$Vendas_Cafe > media,
                   "Acima da m�dia",
                   "Abaixo da m�dia")

# Transformar a vari�vel em fator.
variavel <- factor(variavel)

# Plotando a vari�vel.
plot(variavel)

# Mostrar a quantidade de vendas abaixo da m�dia e a quantidade de vendas acima da m�dia.
table(variavel)
# Abaixo da m�dia  Acima da m�dia 
#19              11

# Boxplot das vendas
par(mfrow=c(1,2))
boxplot(dados$Vendas_Cafe,
        col = "Aquamarine", border = "blue",
        pch = 16,
        main = "Dados das Vendas de Caf�", col.main = "MidnightBlue")

# Boxplot do pre�o do caf�
boxplot(dados$Preco_Cafe,
        col = "Aquamarine", border = "blue",
        pch = 16,
        main = "Dados do Pre�o do Caf�", col.main = "MidnightBlue")
dev.off()

# Comparando quando houve e quando n�o houve promo��o.
boxplot(dados$Vendas_Cafe~dados$Promocao,
        col = "blue", border = "black",
        pch = 16,
        xlab = "Promo��o",
        ylab = "Vendas",
        main = "Vendas COM promo��o vs Vendas SEM promo��o",col.main = "MidnightBlue")
