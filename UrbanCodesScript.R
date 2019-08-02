library(readr)
library(tidyverse)

UrbanCodes1 <- read_csv("Data Mining/Final Project/DataSets/UrbanRuralCodes/UrbanCodes1.csv")
UrbanCodes2 <- read_csv("Data Mining/Final Project/DataSets/UrbanRuralCodes/UrbanCodes2.csv")
UrbanCodes3 <- read_csv("Data Mining/Final Project/DataSets/UrbanRuralCodes/UrbanCodes3.csv")
UrbanCodes4 <- read_csv("Data Mining/Final Project/DataSets/UrbanRuralCodes/UrbanCodes4.csv")
UrbanCodes5 <- read_csv("Data Mining/Final Project/DataSets/UrbanRuralCodes/UrbanCodes5.csv")

UrbanCodes1 <- UrbanCodes1 %>% select(GEO.id2,`GEO.display-label`,D001,D002,D005)
UrbanCodes2 <- UrbanCodes2 %>% select(GEO.id2,`GEO.display-label`,D001,D002,D005)
UrbanCodes3 <- UrbanCodes3 %>% select(GEO.id2,`GEO.display-label`,D001,D002,D005)
UrbanCodes4 <- UrbanCodes4 %>% select(GEO.id2,`GEO.display-label`,D001,D002,D005)
UrbanCodes5 <- UrbanCodes5 %>% select(GEO.id2,`GEO.display-label`,D001,D002,D005)

UrbanCodes1 <- UrbanCodes1[2:nrow(UrbanCodes1),]
UrbanCodes2 <- UrbanCodes2[2:nrow(UrbanCodes2),]
UrbanCodes3 <- UrbanCodes3[2:nrow(UrbanCodes3),]
UrbanCodes4 <- UrbanCodes4[2:nrow(UrbanCodes4),]
UrbanCodes5 <- UrbanCodes5[2:nrow(UrbanCodes5),]

View(UrbanCodes5)
UrbanCodes5$GEO.id2 <- as.numeric(UrbanCodes5$GEO.id2)
UrbanCodes <- rbind(UrbanCodes1,UrbanCodes2,UrbanCodes3,UrbanCodes4,UrbanCodes5)

UrbanCodes$GEO.id2 <- as.numeric(UrbanCodes$GEO.id2)
UrbanCodes$D001 <-as.numeric(UrbanCodes$D001)
UrbanCodes$D002 <-as.numeric(UrbanCodes$D002)
UrbanCodes$D005 <-as.numeric(UrbanCodes$D005)

View(UrbanCodes)

UrbanCodes <- UrbanCodes %>% rename(tractid = `GEO.id2`,Total = D001, Urban = D002, Rural = D005) %>%
  mutate(PercUrban = Urban/Total)

write.csv(UrbanCodes, "UrbanCodes2.csv")
