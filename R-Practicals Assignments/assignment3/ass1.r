#import a dataset........
d = read.csv("fb11.csv",sep = ";")
dim(d)
d1=read.csv("fb22.csv",sep = ";")
dim(d1)

#creating a subset.......
sub=d[c('Category','comment','like','share')]
head(sub)

#creating a subset with condition.....
sub2 = subset(sub,comment > 50)
sub2

#merge dataset.......

first=read.csv("fb11.csv",sep = ";")
second = read.csv("fb22.csv",sep = ";")
dim(first)
dim(second)
newdata=rbind(first,second)
dim(newdata)

#sort datasets......
d =read.csv("fb11.csv",sep = ";")
sub=d[c('Category','comment','like','share')]
tran=t(sub)
head(tran)

# melt datasets......
d =read.csv("fb11.csv",sep = ";")
sub=d[c('Category','comment','like','share')]
sub1=melt(data=sub,id.vars="Category")
sub1
#install.packages("reshape");library(reshape)

sub2=cast(sub1,Category ~variable,mean)
sub2






