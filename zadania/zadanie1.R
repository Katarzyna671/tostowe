dane %>%
  filter(Director == 'Woody Allen' & Series.or.Movie == 'Movie') %>%
  mutate(Netflix.Release.Date =as.Date(Netflix.Release.Date, format = '%d/%m/%Y')) %>%
  arrange(Release.Date) %>%
  select(Title) %>%
  head(1)

