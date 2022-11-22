
rm(list = ls())

library(dplyr)

dat <- read.csv("raw_data.csv")

dat$CoronaryCA <- as.numeric(dat$CoronaryCA)
dat$Age_Part <- as.numeric(dat$Age_Part)
dat$Sex <- as.factor(dat$Sex)

dat$ln_cac_plus1 <- log(dat$CoronaryCA + 1)

dat <- dplyr::filter(dat, !is.na(CoronaryCA) & Demo != 1 & Sex != 3)

dat$male <- as.numeric(dat$Sex == 1)

save(dat, file = "data_clean.RData")

