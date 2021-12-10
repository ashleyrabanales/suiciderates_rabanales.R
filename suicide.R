library(tidyverse)
library(dplyr)
library(tidyr)
library(ggplot)

httpgd::hgd()
httpgd::hgd_browse()

dat <- read_csv("/Users/ashleyrabanales/Projects_ST/rabanales_personal2.R/documents/master.csv") 

print(dat)

colnames(df) <- c(new_col1_name,new_col2_name,new_col3_name)
dat <- murder_2016 %>%
      

murder_2016
  ggplot(aes(x = as.numeric(city), y = `2015_murders`)) +
  geom_point(size = 1) +
  theme_bw() +
  labs(
    title = "Gun Death Rates",
    caption = "Data from FiveThirtyEight.",
    tag = "Figure 1",
    x = "Month",
    y = "Count",
    colour = "Race") +
  scale_color_brewer(palette = "Set1")

ggsave(file = "gun_visualizationR.png", width = 15, height = 7)
#line graph

