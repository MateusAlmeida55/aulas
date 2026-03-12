# Wed Mar 11 08:02:57 2026 ------------------------------

# Desafio: Fazer uma regressão entre 
# component e time para cada 'type' e 'group'

# Pacotes importates do tidyverse

library(tidyr)
library(dplyr)
library(broom)

# Importando dados do desafio

dados_desafio <- readr::read_csv("diogo_week.csv")

# Regressão linear aplica a cada 'type' e 'group' 

df <- dados_desafio %>% 
  nest_by(type, group) %>% # Agrupando cada 'type' e 'group'
  mutate(mod = list(lm(time~component,data = data))) # Aplicando RL

df %>% reframe(tidy(mod))

df %>% summarise(glance(mod))
