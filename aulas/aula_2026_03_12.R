# Thu Mar 12 08:35:39 2026 ------------------------------
# Aula de Modelos Lineares

library(ecodados)
library(ggplot2)

#Exercício 7.1

#Variável contínua >> Tamanho && Variável nominal >> Sexo

ecodados::Cap7_exercicio1
lm.aranha <- lm(Cap7_exercicio1$Tamanho~Cap7_exercicio1$Sexo)
summary(lm.aranha)

# M < F

ggplot(Cap7_exercicio1, aes(Sexo, Tamanho, fill=Sexo))+
  geom_boxplot()+geom_jitter()

#Exercício 7.2

#Variável discreta >> Num. pol && Variável nominal >> Predadores

ecodados::Cap7_exercicio2
lm.pol <- lm(Cap7_exercicio2$Polinizadores~Cap7_exercicio2$Predadores)
summary(lm.pol)

#Ausente > Presente

ggplot(Cap7_exercicio2, aes(Predadores, Polinizadores, 
                    color=Predadores))+
  geom_boxplot()+
  scale_color_manual(values=c("orange", "darkblue"))+
  geom_line(aes(group=Planta), color="gray", size=.5)+
  geom_point(size=3)+
  theme_classic()

#Exercício 7.3

#Variável discreta >> Filhotes && Variável contínua >> Tam. Frag.

ecodados::Cap7_exercicio3
lm.filhos <- lm(Cap7_exercicio3$Filhotes~Cap7_exercicio3$Fragmentos)
summary(lm.filhos)
anova(lm.filhos)

#Há uma relação pouco intensa ou não significativa

par(mfrow=c(2,2))
plot(lm.filhos)

ggplot(Cap7_exercicio3, aes(Fragmentos, Filhotes))+geom_point()+
  geom_smooth(method="lm")

#Exercício 7.4

#Variável discreta >> Riq. Lag. && Variável contínua >> Tam. Ilha

ecodados::Cap7_exercicio4
lm.lag <- lm(Cap7_exercicio4$Riqueza~Cap7_exercicio4$Area_ilhas)
summary(lm.lag)

par(mfrow=c(2,2))

plot(lm.lag)

#Há relação, quanto maior a área da ilha, maior a riqueza de lagartos

ggplot(Cap7_exercicio4, aes(Area_ilhas, Riqueza))+geom_point()+
  geom_smooth(method="lm")

#Exercício 7.6

#Variável contínua >> Peso && Variável nominal >> Local (3)

ecodados::Cap7_exercicio6
lm.macho <- lm(Peso~Local, data=Cap7_exercicio6)
summary(lm.macho)

ggplot(Cap7_exercicio6, aes(Local,Peso, fill=Local))+
  geom_boxplot()

#Exercício 7.7

#Variável discreta >> Abundancia && Variável nominal >> Estado Dom.
# && variável ordinal >> Idade Dom.

ecodados::Cap7_exercicio7
lm.dom <- lm(Abundancia~Domacea*Idade-1, data=Cap7_exercicio7)
par(mfrow = c(1, 1))
check_model(lm.dom)
#O modelo vai testar tanto a relação entre os fatores quanto a
#inteação entre as variáveis preditoras

summary(lm.dom)

ggplot(Cap7_exercicio7, aes(Domacea, Abundancia, fill=Idade))+
geom_boxplot()+
  scale_fill_manual(values=c("orange", "cyan"))+
  stat_summary(fun=mean, geom="point", 
                            position=position_dodge(0.7))+
  stat_summary(aes(group=Idade), fun=mean, geom="line",
               position=position_dodge(0.7), color="red")

#Exercício 7.8

ecodados::Cap7_exercicio8
lm.par <- lm(Parasitas~Femeas*Idade, data=Cap7_exercicio8)
summary(lm.par)

ggplot(Cap7_exercicio8, aes(Femeas, Parasitas, fill=Idade,
                            color=Idade))+
geom_point()

#Exercício 7.9

ecodados::Cap7_exercicio9
lm.riq <- lm(Riqueza~Predadores+(1|Lago), data=Cap7_exercicio9)
summary(lm.riq)

ggplot(Cap7_exercicio9, aes(Predadores, Riqueza, fill=Predadores))+
  geom_boxplot()+geom_jitter()

#TESTE CHAT
nov <- lm(Tempo~Pessoas*Idade, data=anova_dois_fatores)
summary(nov)

ggplot(anova_dois_fatores, aes(Idade, Tempo, fill=Pessoas))+
  geom_boxplot()+scale_fill_manual(values=c("orange", "cyan"))+
  geom_point(position=position_dodge(0.7), size=.5)+
  stat_summary(fun=mean, geom="point",position=position_dodge(0.7),
               color="red", size=2)+
  stat_summary(aes(group=Pessoas), fun=mean, geom="line",
               position=position_dodge(0.7), color="red")
