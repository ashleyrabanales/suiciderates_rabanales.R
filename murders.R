library(tidyverse)
library(dplyr)
library(tidyr)
library(ggplot)

httpgd::hgd()
httpgd::hgd_browse()

murder_2016 <- read_csv("https://raw.githubusercontent.com/fivethirtyeight/data/master/murder_2016/murder_2016_prelim.csv") 

print(murder_2016)
