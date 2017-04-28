rm(list=ls())

dat = read.table("http://archive.ics.uci.edu/ml/machine-learning-databases/communities/communities.data", sep=",", header=TRUE)

dat[ dat == "?" ] = NA
dim(dat[complete.cases(dat), ])

dat_unnorml = read.table('http://archive.ics.uci.edu/ml/machine-learning-databases/00211/CommViolPredUnnormalizedData.txt', sep=',', header=F)
dat_unnorml[ dat_unnorml == "?" ] = NA
dat_unnorml$V146 = as.numeric(as.character(dat_unnorml$V146))
dat_unnorml$V147 = as.numeric(as.character(dat_unnorml$V147))

#for (i in 3:147) {
#  dat_unnorml[i] = as.numeric(dat_unnorml[i])
#}

#V146 is violentPerPop
#check that it's correct
summary(dat_unnorml$V146)

# avg crime rate in 1995 = 600?
aboveAvg = ifelse(dat_unnorml$V146 > 600, 1, 0)
dat_unnorml$aboveAvg = aboveAvg

# logistic reg
mdl.glm = glm(aboveAvg ~ ., data = dat_unnorml, family = "binomial")
