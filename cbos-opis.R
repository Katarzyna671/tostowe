library(haven)
adres_cbos <- paste0("https://raw.githubusercontent.com/kflisikowsky/sad/",
                     "main/data/CBOS_201733_331_SPSS.sav")
plik_cbos <- tempfile(fileext = ".sav")
download.file(adres_cbos, plik_cbos, mode = "wb", quiet = TRUE)
cbos_raw <- read_sav(plik_cbos)
unlink(plik_cbos)

cbos <- cbos_raw %>% transmute(
  plec = as_factor(plec),
  miejscowosc = as_factor(klm6),
  kierunek = as_factor(q24),
  prognoza = as_factor(q25),
  wyksztalcenie = as_factor(q15)
)
dim(cbos)
head(cbos)

### Zadanie 5

library(dplyr)

# Liczba obserwacji i braków
nrow(cbos)
colSums(is.na(cbos))

# Płeć
cbos %>%
  filter(!is.na(plec)) %>%
  count(plec) %>%
  mutate(procent = round(100 * n / sum(n), 2))

# Miejscowość
cbos %>%
  filter(!is.na(miejscowosc)) %>%
  count(miejscowosc) %>%
  mutate(procent = round(100 * n / sum(n), 2))

cbos %>%
  filter(!is.na(miejscowosc)) %>%
  summarise(
    mianownik = n(),
    wies = round(100 * sum(miejscowosc == "Wieś") / n(), 2),
    miasto_500tys = round(100 * sum(miejscowosc == "500 tys. i więcej") / n(), 2)
  )

### Zadanie 6

# Liczebności i odsetki odpowiedzi
cbos %>%
  filter(!is.na(kierunek)) %>%
  count(kierunek) %>%
  mutate(procent = round(100 * n / sum(n), 2))

cbos %>%
  summarise(
    mianownik_caly = sum(!is.na(kierunek)),
    mianownik_dobry_zly = sum(kierunek %in% c("W dobrym", "W złym"), na.rm = TRUE),
    procent_caly = round(100 * sum(kierunek == "W dobrym", na.rm = TRUE) / mianownik_caly, 2),
    procent_dobry_zly = round(100 * sum(kierunek == "W dobrym", na.rm = TRUE) / mianownik_dobry_zly, 2)
  )

