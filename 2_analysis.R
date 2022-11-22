
rm(list = ls())

load("data_clean.RData")

nrow(dat) # 16 observations

# summary(dat$Sex)

# summary(dat$Age_Part)
# mean is 60.00 years old

# m0 <- lm(ln_cac_plus1 ~ Age_Part, data = dat)
m1 <- lm(ln_cac_plus1 ~ Age_Part + Sex, data = dat)

# png("analysisplot.png", res = 300, height = 5, width = 5, units = "in")
# plot(dat$Age_Part, dat$ln_cac_plus1, pch = ifelse(dat$Sex == 1, 1, 20))
# dev.off()

png("analysisplot_new.png", res = 300, height = 5, width = 5, units = "in")
plot(dat$Age_Part, dat$ln_cac_plus1, pch = ifelse(dat$Sex == 1, 1, 20))
curve(coef(m1)[1] + coef(m1)[2] * x, add = TRUE, col = "gray")
curve(coef(m1)[1] + coef(m1)[2] * x + coef(m1)[3], add = TRUE)
dev.off()

# png("boxplot.png", res = 300, height = 5, width = 5, units = "in")
# boxplot(dat$ln_cac_plus1 ~ dat$male)
# dev.off()
