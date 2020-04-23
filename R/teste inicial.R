#Definir variáveis
x <- 4 #<- atribui valor à variável
y <- 3
z <- "7"

print(x)
print(paste(x,y,z))

#Operações
primeiros_pares <- c(2,4,6,8,10,12,14) #cria vetor a ser utilizado
mean(primeiros_pares) #média
max(primeiros_pares) #Pega o maior valor do vetor ou matriz
sd(primeiros_pares) #Desvio Padrão
var(primeiros_pares) #Variância
median(primeiros_pares) #Mediana
fivenum(primeiros_pares) #quartis e mediana
x%%y # %% indica resto de divisão

#sequências
primeiro_pares*y
primeiros_impares <- seq(1,13, by=2) #sequência definindo extremos
print(primeiros_impares)

plot(primeiros_pares,primeiros_impares) #pares no x e ímpares no y

popul <- floor(runif(20,min = 10, max = 100)) #floor arredonda para baixo, runif gera números aleatórios)
popul
hist(popul, col="blue")

# Variáveis são livres, podem receber flutuantes, números, textos, etc.

#WorkSpace

ls() # ls() mostra quantas variáveis estão definidas.
rm(x) #limpa a variável x
rm(list = ls()) #apaga todas as variáveis

?hist #usa o help pra pesquisa a função

#Dados
#Verifica com Class(valor)
#inteiro - Integer ; Flutuante - Numeric; Character; Lógico;
#OBS: ao tratar de número inteiro, se usa L após o número, para que possa entender que é inteiro; Ex: 4L é o mesmo que 4
#OBS2: Character é sempre entre "", Lógico é TRUE ou FALSE

#Condições para avaliação de dados:
is.integer(y) #is.algo retorna o valor lógico

#Conversão de dados (Coerção)
as.integer(z) #as.[tipo de dado]() trata o dado como o tipo indicado

#Vetores - função c
vet1 <- c(1, 4, 3, 5, 2)
vet1[2] #retorna a segunda coluna do vetor (começa no 1, diferente de C)

v1 <- seq(2,185,5) #sequencia inicia em 2, termina em 185 e vai de 5 em 5
v2 <- seq(5,185,5)

#nomeando
sem1 <- c("Seg", "Ter", "Qua", "Qui", "Sex")
names(vet1) <- sem1 #Nomeia o vetor com a devida correspondencia
vet1["Ter"] #Permite selecionar o vetor pelo nome

#Adicionar elemento ao vetor
vet1[length(vet1)+1] <- "Sab"

vet1 <- c(vet1, "Dom")

vet1 <- vet1[-3]
vet1 <- vet1[-c(1:3)]

#matrizes

matrix(1:5,5,2)

es

