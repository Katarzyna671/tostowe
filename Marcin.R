install.packages(c("dplyr", "tidyr", "haven"))
```{r nieruchomosci-dane}
library(dplyr)
library(tidyr)

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

#Zadanie 7
cbos %>%
  filter(miejscowosc %in% c("wieś", "miasto 500 000 i więcej")) %>%
  count(miejscowosc, kierunek) %>%
  group_by(miejscowosc) %>%
  mutate(procent = n / sum(n) * 100)


#Zadanie 8





#dodanie
MacBook-Air-Marcin:Analiza danych w R marcinbielinski$ git add (Marcin)

MacBook-Air-Marcin:Analiza danych w R marcinbielinski$ git commit -m (Marcin)
[Marcin.R 1a2b3c] zadanie 7
1 file changed, 10 insertions(+)
create mode 100644 Marcin.R

MacBook-Air-Marcin:Analiza danych w R marcinbielinski$ git push -u origin (Marcin)
Enumerating objects: 4, done.
Counting objects: 100% (4/4), done.
Delta compression using up to 16 threads
Compressing objects: 100% (3/3), done.
Writing objects: 100% (3/3), 644 bytes | 644.00 KiB/s, done.
Total 3 (delta 1), reused 0 (delta 0), pack-reused 0 (from 0)
remote: Resolving deltas: 100% (1/1), completed with 1 local object.
remote:
  remote: Create a pull request for 'Marcin' on GitHub by visiting:
  remote: https://github.com/Katarzyna671/tostowe/pull/new/Marcin
remote:
  To https://github.com/Katarzyna671/tostowe.git
* [new branch]      Marcin -> Marcin
branch 'Marcin' set up to track 'orygin/Marcin'.
