

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

#zadanie 2 przelicz cenę i sprawdź jej rozkład. 
Dodaj kolumnę `cena_twd_m2`: `cena_10k_twd_ping * 10000 / 3.3`. Oblicz minimum, medianę, średnią i maksimum ceny za m². Wyświetl pięć nieruchomości o najwyższej cenie jednostkowej wraz z ich wiekiem, odległością od metra i liczbą sklepów.
Pytanie: czy średnia jest wyższa od mediany? Co to mówi o rozkładzie cen? Nie interpretuj tej ceny jako wartości całego lokalu.
# mutate(), summarise(), arrange(desc(...)), slice_head(n = 5)

#dodanie kolumny 
nier<- mutate(nier, cena_twd_m2 = cena_10k_twd_ping* 10000 / 3.3)

#podstawowe statystyki dla kolumny cena_twd_m2
summary(nier$cena_twd_m2) #Uwaga summary a nie summarise! 

#pięć nieruchomości o najwyższej cenie jednostkowej wraz z ich wiekiem, odległością od metra i liczbą sklepów.
nier %>%
  select(cena_twd_m2,wiek_lat,metro_m,sklepy) %>%
  arrange(-(cena_twd_m2)) %>%
  head(5)

#czy średnia jest wyższa od mediany? Co to mówi o rozkładzie cen?
średnia jest niższa od mediany, mamy do czynienia z rozkładen skośnym, asymetrycznym lewostronnie 
czyli wartości skrajne, niższe ciągną średnią cenę lokalu w dół, mediana jest odporna na te wartości odstające



  





