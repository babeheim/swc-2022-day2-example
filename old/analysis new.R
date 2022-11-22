
library(readxl)

dat <- read_xlsx("Data_March11.xlsx")

dat$CoronaryCA <- as.numeric(dat$CoronaryCA)
dat$Age_Part <- as.numeric(dat$Age_Part)
dat$Sex <- as.factor(dat$Sex)

dat$ln_cac_plus1 <- log(dat$CoronaryCA + 1)

dat <- filter(dat, !is.na(dat$CoronaryCA) & Demo != 1)

m1 <- lm(ln_cac_plus1 ~ Age_Part + Sex, data = dat)

png("analysisplot.png", res = 300, height = 5, width = 5, units = "in")
plot(dat$Age_Part, dat$ln_cac_plus1, pch = ifelse(dat$Sex == 1, 1, 20))
dev.off()
