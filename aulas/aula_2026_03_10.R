# Aula >> GitHub
# Tue Mar 10 09:06:31 2026 ------------------------------

library(usethis)
use_git_config(user.name="MateusAlmeida55", user.email="mateusa385@gmail.com")

git_sitrep()

create_github_token()

gitcreds::gitcreds_set()

#Exercício 5.8.6
use_git()
use_github()

#Aula >> Tidyverse
# Tue Mar 10 13:44:20 2026 ------------------------------
# Split-apply-combine strategy

library(dplyr)
library(tidyr)

#Exercício 5.1

#log10(cumsum(1:100))
1:100 %>% cumsum() %>% log10()

#sum(sqrt(abs(rnorm(100))))
rnorm(100) %>% abs() %>% sqrt() %>% sum()

#sum(sort(sample(1:10, 10000, rep = TRUE)))
sample(1:10, 10000, rep=TRUE) %>% sort() %>% sum()

#Exercício 5.2

unzip(download.file(
  url="http://esajournals.onlinelibrary.wiley.com/action/downloadSupplement?doi=10.1002%2Fecy.2785&file=ecy2785-sup-0001-DataS1.zip", 
  destfile="ecy2785-sup-0001-DataS1.zip", mode="wb"))

#Load data

tb <- readr::read_csv("ATLANTIC_MAMMAL_MID_LARGE _assemblages_and_sites.csv")

#Exercício 5.3

tibble::glimpse(tb)

#Exercício 5.4

library(palmerpenguins)
palmerpenguins::penguins_raw
palmerpenguins::penguins

penguins_raw_col <- penguins_raw %>% select(c(3,5,10:14,9))%>%
  rename(
  species=Species,island=Island,bill_length_mm="Culmen Length (mm)",
  bill_depth_mm="Culmen Depth (mm)",flipper_length_mm="Flipper Length (mm)",
  body_mass_g="Body Mass (g)", sex=Sex,year="Date Egg")%>%
  mutate(sex=stringr::str_to_lower(sex), year=lubridate::year(year))%>%
  separate(species, c("species", NA,NA,NA,NA))

#Exercício 5.5

palmerpenguins::penguins

cor(penguins$bill_length_mm, penguins$bill_depth_mm, use="na.or.complete", 
    method="pearson")

penguins%>%
  group_split(species) %>%
  purrr::map(~cor(.x$bill_length_mm, .x$bill_depth_mm, 
                  use="na.or.complete", method="pearson"))
