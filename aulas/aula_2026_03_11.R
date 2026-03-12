# Wed Mar 11 09:26:53 2026 ------------------------------
# Aula >> ggplot2

library(ggplot2)
library(palmerpenguins)

# Exercício 6.1
ggplot(penguins, aes(species, bill_length_mm, fill=species))+
  geom_boxplot(color="black")+
  theme_classic()+xlab("Espécies")+ylab("Comprimento do bico (mm)")+
  scale_fill_manual("Espécies",values=c("darkred", "darkblue","darkgreen"))

# EExercício 6.2
ggplot(penguins, aes(body_mass_g,fill=species))+
  geom_histogram(position="dodge")+xlab("Peso")+ylab("Frequência")+
  scale_fill_manual("Espécies",values=c("red", "darkblue","pink"))+
  theme_classic()

# Exercício 6.3
dados_brutos <- ggplot(penguins, aes(species, flipper_length_mm, fill=species))+ 
geom_jitter()+xlab("Espécies")+ylab("Comprimento da nadadeira (mm)")+
  scale_fill_manual("Espécies",values=c("darkred", "darkblue","darkgreen"))+
  theme(plot.title = element_text(hjust = 0.5))+ggtitle("Dados Brutos")
print(dados_brutos)

densidade <- ggplot(penguins, aes(species, flipper_length_mm, fill=species))+ 
  geom_violin()+xlab("Espécies")+ylab("Comprimento da nadadeira (mm)")+
  scale_fill_manual("Espécies",values=c("darkred", "darkblue","darkgreen"))+
  theme(plot.title = element_text(hjust = 0.5))+ggtitle("Densidade")
print(densidade)

caixas <- ggplot(penguins, aes(species, flipper_length_mm, fill=species))+ 
  geom_boxplot(color="black")+xlab("Espécies")+
  ylab("Comprimento da nadadeira (mm)")+
  scale_fill_manual("Espécies",values=c("darkred", "darkblue","darkgreen"))+
  theme(plot.title = element_text(hjust = 0.5))+ggtitle("Boxplot")
print(caixas)

#Exercício 6.4
gridExtra::grid.arrange(dados_brutos, densidade, caixas, nrow=1, ncol=3)

ggplot(penguins, aes(species, flipper_length_mm, fill=species))+ 
  geom_jitter(aes(color=species), width=.2,size=.5)+
  geom_boxplot(aes(fill = species), alpha = .2, width = .2)+
  geom_violin(fill = "gray", alpha = .1)+
  theme_classic(base_size = 16)+
  theme(legend.position = "none")+
  xlab("Espécies")+
  ylab("Comprimento da nadadeira (mm)")

#Exercício 6.5
library(devtools)

ggplot(ecodados::anova_dois_fatores, aes(Idade, Tempo, fill = Pessoas)) +
  geom_point(position = position_dodge(width = .9), size=.3) +
  stat_summary(fun = mean, geom = "bar", 
               position = position_dodge(width = .9), alpha = .75) +
  stat_summary(fun.data = mean_se, geom = "errorbar", 
               position = position_dodge(width = .9), 
               width = .5) +
  scale_fill_manual(values = c("darkblue", "red")) +
  theme_classic() +
  labs(y = "Tempo (dias)",
       x = "Idade")  

#Exercício 6.6

ggplot(penguins%>%drop_na(sex), 
       aes(y=flipper_length_mm,x=body_mass_g, fill=sex, color=sex))+
  geom_smooth(method="lm")+facet_grid(~species)+geom_point()+
  labs(x="Tamanho corporal (g)",y="Comprimento da nadadeira (mm)", 
       fill="Sexo", color="Sexo")+
  scale_color_manual(values=c("purple", "orange"),
                     aesthetics=c("fill", "color"))+
  theme_bw()

# Wed Mar 11 14:54:13 2026 ------------------------------

# Exercícios da apostila

#Exercício 1

library(lattice)
data(quakes)
Depth <- equal.count(quakes$depth, number=8, overlap=.1)
xyplot(lat~long|Depth,data=quakes)

#Exercício 2

plot(melanoma, xlab="Anos", ylab="Frequência",bty="L",cex=2,
     col="pink",pch=16)

#Exercício 3

comp_bico <- penguins$bill_length_mm 
prof_bico <- penguins$bill_depth_mm
df <- data.frame(penguins$bill_length_mm, penguins$bill_depth_mm)

plot(df, xlab="Comprimento do bico (mm)", 
     ylab="Profundidade do bico (mm)",pch=16,col="purple",
     bty="L")
abline(lm(prof_bico~comp_bico),lwd=2,col="red")
summary(lm(prof_bico~comp_bico))
anova(lm(prof_bico~comp_bico))

#Exercício 4

alnum <- rnorm(1000,0,1)

hist(alnum, col = "darkgray", 
     ylab="Frequência", xlab="Números aleatórios")

#a
points(x=mean(alnum),y=0,pch=21,cex=1,bg="red",col="red")

#b
points(x=c(quantile(alnum, probs=c(0.25,0.75))), 
       y=c(0,0),pch=25,col="green", cex=1, bg="green")
#c e d
legend("topleft",c("Média", "1° e 3° Quartil"),
       pt.bg=c("red","green"),
       pch=c(21,25),bg="lightgray",col=c("red", "green"))
