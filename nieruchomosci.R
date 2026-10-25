

library(dplyr)
library(tidyr)

adres_nieruchomosci <- paste0(
  "https://raw.githubusercontent.com/kflisikowsky/pandas_exercises/",
  "62863036107888c0c7273c40e8d309a43f4da3a9/data/models/real_estate.csv"
)
raw_nier <- read.csv(adres_nieruchomosci, check.names = FALSE)
stopifnot(nrow(raw_nier) == 414, ncol(raw_nier) == 7)

nier <- raw_nier
names(nier) <- c("id", "wiek_lat", "metro_m", "sklepy", "lat", "lon",
                 "cena_10k_twd_ping")
head(nier)

#zadanie 1
dim(nier) #414 wierszy i 7 kolumn
str(nier) #ramka, dane w kolumnach: liczby całkowite (id, sklepy) i liczby z przecinkami (wiek, metro, lat, lon, cena)
summary(nier)
colSums(is.na(nier)) #nie ma braków danych
anyDuplicated(nier) #brak duplikatów

#zadanie 2


