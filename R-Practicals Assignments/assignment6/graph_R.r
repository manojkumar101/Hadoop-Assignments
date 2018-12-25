#creating Table
table(iris$Species)

#Plot graph between iris$Sepal.Length~iris$Petal.Length
plot(iris$Sepal.Length~iris$Petal.Length)
plot(iris$Sepal.Length~iris$Petal.Length ,xlab="Petal Length" ,ylab = "Sepal Length")
plot(iris$Sepal.Length~iris$Petal.Length ,xlab="Petal Length" ,ylab = "Sepal Length",main="Sepal Length Vs Petal Length",col=blues9,pch=16)

#Plot Pie Chart
mytab=table(iris$Species)
labls=paste(names(mytab),mytab)
pie(mytab,labls)

#Plot Pie chart in 3D
library(plotrix)
install.packages("plotrix")
mytab=table(iris$Species)
labls=paste(names(mytab),mytab)
pie3D(mytab,labels=labls,explode=0.1)


# Plot Bar graph
bartype=table(iris$Species)
#   bartype=table(iris$Sepal.Length,iris$Sepal.Width)  --> replace with above line
barlabels=paste(names(bartype),bartype)
barplot(bartype,labels=barlabels)

#hist grap
hist(iris$Sepal.Length)
hist(iris$Sepal.Length,xlab="Sepal Length" ,main="Sepal Length Histogram",col=blues9)
hist(iris$Sepal.Length,xlab="Sepal Length" ,main="Sepal Length Histogram",col="aquamarine3")
#box plot 

boxplot(iris$Sepal.Length~iris$Species)
boxplot(iris$Sepal.Length~iris$Species,xlab="Species",ylab="Sepal Length",main="Sepal Length of different Species",col="burlywood")


# Now comming to ggplot
install.packages("ggplot2")
library(ggplot2)

ggplot(data=iris,aes(y=Sepal.Length,x=Petal.Length))

ggplot(data=iris,aes(y=Sepal.Length,x=Petal.Length))+geom_point()
ggplot(data=iris,aes(y=Sepal.Length,x=Petal.Length,col=Species))+geom_point()
ggplot(data=iris,aes(y=Sepal.Length,x=Petal.Length,shape=Species,col=Species))+geom_point()

#ploting line 

ggplot(data = iris, aes(x = Petal.Length, y = Petal.Width))+geom_point()+xlab("Petal Length")+ylab("Petal Width") +geom_smooth(method='lm')+ggtitle("Petal Length vs Width")