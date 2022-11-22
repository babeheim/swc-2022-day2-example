
# setwd("/Users/bretbeheim/Dropbox/projects/2021/swc-spring-school/cardio-multisite-raw/site 1")

library(readxl)

dat <- read_xlsx("Data_Final_092315.xlsx")

dat$CoronaryCA <- as.numeric(dat$CoronaryCA)
dat$Age_Part <- as.numeric(dat$Age_Part)
dat$Sex <- as.factor(dat$Sex)

dat$ln_cac_plus1 <- log(dat$CoronaryCA + 1)

dat <- filter(dat, !is.na(CoronaryCA) & Demo != 1 & Sex != 3)

dat$male <- as.numeric(dat$Sex == 1)

save(dat, file = "data_clean.RData")

