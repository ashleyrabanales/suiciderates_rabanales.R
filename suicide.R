library(tidyverse)
library(dplyr)
library(tidyr)
library(ggplot2)
library(statar)
library(gapminder)
library(RColorBrewer)

#install.packages("viridis")

httpgd::hgd()
httpgd::hgd_browse()

dat <- read.csv("/Users/ashleyrabanales/Projects_ST/rabanales_personal2.R/documents/master.csv") 

head(dat)
sapply(dat, class)
#changing character to numeric
transform(dat, year = as.numeric(year),
               age = as.numeric(age),
               suicides_pop = as.numeric(suicides_pop),
               population = as.numeric(population))
sapply(dat, mode)

tab(dat, country)
tab(dat, year)
tab(dat, sex)
sum_up(dat, suicides)

dat_2 <- dat %>%
  group_by(sex, age, country, generation, population)%>%
  summarize(suicides_pop = n())

head(dat_2)
tab(dat, generation)

####bar chart 
ggplot(data = dat_2) +
  geom_bar(mapping = aes(x = suicides_pop, fill = generation)) +
  scale_fill_brewer(palette="Pastel2") +
  theme_bw() +
  labs(
    title = "Suicide by Generation in 1987-2016",
    caption = "Suicide in the Twenty-First Century",
    tag = "Figure 1:",
    x = "Suicides Population 100k",
    y = "Count",
    fill = "Generation") +
  theme(plot.title = element_text(face="bold", size=14
  )) + theme(plot.tag = element_text(face="bold", size=14
  ))

ggsave(file = "generation.png", width = 15, height = 7)


###########

#https://www.r-graph-gallery.com/135-stacked-density-graph.html
#library(gapminder)
#library(viridis)

tab(dat, year)
tab(dat, suicides_pop)
tab()

#dat3 gapminder::gapminder %>% filter(year=="2000") %>% dplyr::select(-year)
head(dat)
#filtering out the year 2000 and 2016 
dat3 <- dat %>%
  filter(year == "2016")%>%
  group_by(sex, age, country, generation, population) %>%


ggplot(data = dat3)
  geom_bar(mapping = aes(x = suicides_pop, fill = age)) +
  scale_discrete_continuos +
  scale_fill_brewer(palette="Pastel2") +
  theme_bw() +
  labs(
    title = "Suicide by Age in 2000",
    caption = "Suicide in the Twenty-First Century",
    tag = "Figure 2:",
    x = "Suicides Population 100k",
    y = "Count",
    fill = "Age") +
  theme(plot.title = element_text(face="bold", size=14
  )) + theme(plot.tag = element_text(face="bold", size=14
  ))


dat %>%
filter(year=="2016") %>%
ggplot(data = dat) 
  geom_smooth(mapping = aes(x = suicides_pop, y = gpd_per_capita, linetype = age))

  geom_bar(dat, mapping = aes(x = suicides_pop, fill = age)) +
  scale_fill_brewer(palette="Pastel2") +
  theme_bw() +
  labs(
    title = "Suicide by Age in 2016",
    caption = "Suicide in the Twenty-First Century",
    tag = "Figure 3:",
    x = "Suicides Population 100k",
    y = "Count",
    fill = "Age") +
  theme(plot.title = element_text(face="bold", size=14
  )) + theme(plot.tag = element_text(face="bold", size=14
  ))

#######################################
#code wasn;t working, not sure what went wrong

dat %>%
  filter(year=="2016") %>% 
  ggplot(aes(x=gdp_per_capita*100000, y=population, size = suicides_pop, color = age)) +
    geom_point(alpha=0.5) +
    scale_size(range = c(.1, 24), name="Population ") +
     scale_fill_viridis(discrete=TRUE, guide=FALSE, option="A") +
    theme_ipsum() +
    title = ""
    theme(legend.position="bottom") 
    + labs( x="Gdp per Capita", y="", 
          size = "Suicide Population (100k)" , color = "Age") +
        guide = "none"+
    theme(legend.position = "none")

dat %>%
  filter(year=="2000") %>%
  ggplot(aes(x=gdp_per_capita*100000, y=suicides_pop*100000, size = suicides_pop, color = age)) +
    geom_point(alpha=0.5) +
    scale_size(range = c(.1, 24), name="Population") +
    scale_fill_viridis(discrete=TRUE, guide=FALSE, option="A") +
    theme_ipsum() +
    theme(legend.position="bottom") +
    ylab("Life Expectancy") +
    xlab("Gdp per Capita") +
    theme(legend.position = "none")



ggsave(file = "fig_3R.png", width = 8, height = 4)




#####line graph
#creating a weightmean for gdp per captia
#dat_count <- gapminder :: gapminder %>%
#     mutate(
#        new_year = ifelse(year < 2000, "before2000", "after2000") %>%
#        factor(levels = c("before2000", "after2000")) #default sorts by name # nolint
 #   ) %>%
 #   group_by(new_year, country) %>%
 #   summarise(
 #     gdp_per_cap = weighted.mean(gdp_per_cap, suicides_pop),
 #     population = sum(population)) %>%
 # ungroup() %>%

  #group_by(sex, age, country, generation, dat_count) %>%
  #summarize(suicides_pop = n()) 

 # ggplot(dat, mapping = aes (x = year, y = gdp_per_cap,
  #              geom_line(aes(group=country)) + 
   #             geom_point() +
   #             facet_wrap(~country, nrow = 1) +
    #            geom_point(aes(size = pop/100000)) +
   #             geom_point(data = dat_count,aes(size=1,color="black") +
   #             geom_line(data = dat_count, color="black") + 
    #            labs( x="Year", y="GDP per capita", 
    #            size = "Population (100k)" , color = "Continent") +
   #             scale_y_continuous(trans = "sqrt") +
    #            theme_bw() 
        
#ggsave(filename = "p1_Rproject2.png", width = 15)
#might too big to make