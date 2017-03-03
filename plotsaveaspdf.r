rm(list = ls())

library(stringr)
library(ggplot2)


setwd('E:/这台电脑的工作目录/工作相关文件夹/第一财经工作相关/豆瓣电影数据')

list.files()


set.seed(1000)
# create sample data by sampling from a uniform distribution
# then use a poisson distribution to create counts of objects
# to be plotted on the y axis
biomass=sort(runif(100,1,100))
y = 0.2+0.1*biomass
count=rpois(length(y),y)
# Now create your graph using the Windows (X11) device:
par(las=1,bty='l',lwd=2,tck=0.02)
plot(count~biomass,pch=16,type='n',axes=F,xlab='',ylab='')
points(count~biomass,pch=16,col=rainbow(length(count),start=4/6))
axis(1)
axis(2)
title(xlab='Biomass',ylab='Count')
box()
# finally, add a blue line with model predictions
m1=glm(count~biomass,poisson)
lines(biomass,predict(m1,type='response'),col='blue',lwd=2)
# copy the content of the current device to a PDF device
# depending on your system, you may use different font families,
# but this often doesn´t work properly and font editing should be
# done in Illustrator.
# Be sure to turn off the “Dingbats” font because symbols
# may otherwise render wrongly on some systems.
dev.copy2pdf(file='myfile.pdf',useDingbats=FALSE,family='sans')
