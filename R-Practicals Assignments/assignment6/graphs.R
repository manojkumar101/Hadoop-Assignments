
graph in R/PYHTON


> d = read.csv("fb11.csv",sep = ";")
> x=c(1,2,3,4)
> y=c("manish","anish","shubham","ankit")
> pie(x,y)
> 
  
  > x=c(1,2,3,4)
  > y=c("manish","anish","shubham","ankit")
  > barplot(x,y)
  Error in width/2 : non-numeric argument to binary operator
  In addition: Warning message:
    In mean.default(width) : argument is not numeric or logical: returning NA
  > barplot(x)
  
histgram
> v <-  c(9,13,21,8,36,22,12,41,31,33,19)

# Give the chart file a name.
> png(file = "histogram.png")

# Create the histogram.
> hist(v,xlab = "Weight",col = "yellow",border = "blue")


r-graph
v <- c(7,12,28,3,41)

# Give the chart file a name.
png(file = "line_chart.jpg")

# Plot the bar chart. 
plot(v,type = "o")


scatter
input <- mtcars[,c('wt','mpg')]

# Give the chart file a name.
png(file = "scatterplot.png")

# Plot the chart for cars with weight between 2.5 to 5 and mileage between 15 and 30.
plot(x = input$wt,y = input$mpg,
   xlab = "Weight",
   ylab = "Milage",
   xlim = c(2.5,5),
   ylim = c(15,30),		 
   main = "Weight vs Milage"
)
