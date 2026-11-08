dane %>%
  mutate(
    Release = Release.Date %>% as.Date(format = '%m/%d/%Y')
    ,Netflix.Release = Netflix.Release.Date %>% as.Date(format = '%m/%d/%Y')
  ) %>%
  mutate(roznica_w_dniach = difftime(Release, Netflix.Release)) %>%
  mutate(rel_year=year(Release)) %>%
  filter(Release %in% c(2019, 2020)) %>%
  group_by(rel_year) %>%
  summarise(średnia = mean(roznica_w_dniach, na.rm = TRUE))

