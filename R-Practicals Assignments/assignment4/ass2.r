#import dataset
data = read.csv("data.csv", sep=";")
dim(data)

#errors and corrections
mean(data$stn_code)
mean(data$so2)

mean(data$so2,na.rm=TRUE)
max(data$no2)
max(data$no2,na.rm=TRUE)

#check summary
summary(data)

#data cleaning
d=data
d$stn_code = ifelse(is.na(d$stn_code),median(d$stn_code,na.rm=TRUE),d$stn_code)
summary(d)

d$so2 = ifelse(is.na(d$so2),median(d$so2,na.rm=TRUE),d$so2)
summary(d)
d$no2 = ifelse(is.na(d$no2),median(d$no2,na.rm=TRUE),d$no2)
summary(d)
d$spm = ifelse(is.na(d$spm),median(d$spm,na.rm=TRUE),d$spm)
summary(d)
d$rspm = ifelse(is.na(d$rspm),median(d$rspm,na.rm=TRUE),d$rspm)
summary(d)

#data transformation 1
head(d)
d$so2.Danger = d$so2 > 4
head(d)

#data transformation 2
brks = c(0,2,3,4,5,6,7,8,9)
d$so2=cut(d$so2,breaks = brks,include.lowest = TRUE)
head(d)

#DT 3
d1=d
d1$stn_code=gsub(150,"zero",d1$stn_code)
d1$stn_code=gsub(151,"one",d1$stn_code)
d1$stn_code=gsub(152,"two",d1$stn_code)
head(d1)