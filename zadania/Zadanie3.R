dane %>%
  mutate(
    Release = Release.Date %>% as.Date(format = '%m/%d/%Y')
    ,Netflix.Release = Netflix.Release.Date %>% as.Date(format = '%m/%d/%Y')
  ) %>%
  mutate(roznica_w_dniach = difftime(Netflix.Release, Release, units="days")) %>%
  mutate(rel_year=year(Release)) %>%
  filter(rel_year %in% c(2019, 2020)) %>%
  group_by(rel_year) %>%
  summarise((średnia = mean(roznica_w_dniach, na.rm = TRUE))%>%
round(0))

