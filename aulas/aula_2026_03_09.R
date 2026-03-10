getwd() #Obtem o diretório de trabalho
# Mon Mar  9 09:49:21 2026 ------------------------------

#Exercício 4.1
7+7/7+7*7-7

#Exercício 4.2
3*2^3 > 2*3^2

#Exercício 4.3
a <- 100
b <- 300
mult <- prod(a,b)
ln <- log(mult)

#Exercício 4.4
nrow(available.packages(repos = "http://cran.r-project.org"))

#Exercício 4.5
install.packages("tidyverse")

#Exercício 4.6
mega <- sample(1:60, size=6, replace=FALSE)

#Exercício 4.7
tr <- factor(x=c(rep("cont",times=15), rep("trat", times=15)), 
          levels=c("cont", "trat"))

#Exercício 4.8
ma <- matrix(data=sample(x=0:10, size=300, replace=TRUE), nrow=30, 
          byrow=FALSE)

#Exercício 4.9
id <- c(1:30)
sp <- paste0("sp", c(paste0("0",1:9), 10:30))
ab <- sample(x=c(0:5), size=30, replace=TRUE)
df <- data.frame(id, sp, ab)

#Exercício 4.10
lista <- list(mega,tr,ma,df)

#Exercício 4.11
tr_impar <- tr[seq(from=1, to=length(tr), by=2)]

#Exercício 4.12
df_ids_pares <- df[seq(2,length(df$id), by=2),]

#Exercício 4.13
set.seed(42)
df_amos10 <- df[sample(1:length(df$id),size=10),] ## Op2 >> nrow(df)

#Exercício 4.14
ma_amos10 <- ma[df_amos10$id,]

#Exercício 4:15
dados_amos10 <- data.frame(df_amos10, ma_amos10)
## Op2 >> cbind(df_amos10, ma_amos10)
