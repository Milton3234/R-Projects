#ggplot2 in R

View(iris)

table(iris$Species)

#scatter plot
plot(iris$Sepal.Length~iris$Petal.Length)
#Adding labels
plot(iris$Sepal.Length~iris$Petal.Length,ylab="Sepal Length",xlab="Petal Length",main="Sepal Length vs Petal Length")
#Adding colour to the plot
plot(iris$Sepal.Length~iris$Petal.Length,ylab="Sepal Length",xlab="Petal Length",main="Sepal Length vs Petal Length",col="blue",pch=16)

#Histogram
hist(iris$Sepal.Width)
hist(iris$Sepal.Width,xlab = "Sepal Width",main = "Sepal Width Distribution",col = "red")

#Boxplot
boxplot(iris$Sepal.Length~iris$Species)
boxplot(iris$Sepal.Length~iris$Species,xlab = "Species",ylab = "Sepal Length",main="Sepal Length vs Species",col="burlywood")

#---------------------------------------------------
#Grammar of Graphics
#install.packages("ggplot2)
#library(ggplot2)
ggplot(data = iris)
ggplot(data = iris,aes(y=Sepal.Length,x= Petal.Length))
ggplot(data = iris,aes(y=Sepal.Length,x= Petal.Length))+geom_point()

#Aesthetics
ggplot(data = iris,aes(y=Sepal.Length,x= Petal.Length,col=Species))+geom_point()
ggplot(data = iris,aes(y=Sepal.Length,x= Petal.Length,shape=Species))+geom_point()
ggplot(data = iris,aes(y=Sepal.Length,x= Petal.Length,col=Species,shape=Species))+geom_point()



