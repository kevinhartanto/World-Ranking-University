install.packages("dplyr")
install.packages("ggplot2")
install.packages("gcookbook")
install.packages("readr")
install.packages("plotly")


library(dplyr)
library(ggplot2) 
library(gcookbook)
library(readr)
library(ggrepel)
library(plotly)

Universitydata <- read.csv("cwurData.csv")
View(Universitydata)


Universitydata2012100 <- filter(Universitydata, year == 2012, world_rank <= 100)
View(Universitydata2012100)
Universitydata2015100 <- filter(Universitydata, year == 2015, world_rank <= 100)
View(Universitydata2015100)

#2012
ggplot(data = Universitydata2012100, aes(y = reorder(institution, -world_rank),x = world_rank, fill=country)) + 
  geom_bar(stat="identity")+ labs(title = "2012 World Ranking",x = "World Rank", y = "Institution")
#2015
ggplot(data = Universitydata2015100, aes(y = reorder(institution, -world_rank),x = world_rank, fill=country)) + 
  geom_bar(stat="identity")+ labs(title = "2015 World Ranking",x = "World Rank", y = "Institution")

#Quality of education
qplot(Universitydata2012100$world_rank,
      Universitydata2012100$quality_of_education,
      data = Universitydata2012100,
      geom = c("point","smooth"),
      xlab = "World Rank",
      ylab = "Quality of Education Rank",
      ylim = c(0,150))
cor(Universitydata2012100$world_rank,Universitydata2012100$quality_of_education)

qplot(Universitydata2015100$world_rank,
      Universitydata2015100$quality_of_education,
      data = Universitydata2015100,
      geom = c("point","smooth"),
      xlab = "World Rank",
      ylab = "Quality of Education Rank",
      color = I("red"),
      alpha = I(1/5))
cor(Universitydata2015100$world_rank,Universitydata2015100$quality_of_education)

#quality of faculty
qplot(Universitydata2012100$world_rank,
      Universitydata2012100$quality_of_faculty,
      data = Universitydata2015100,
      geom = c("line","smooth"),
      xlab = "World Rank",
      ylab = "Quality of Faculty Rank",
      ylim = c(0,150))
cor(Universitydata2012100$world_rank,Universitydata2012100$quality_of_faculty)

qplot(Universitydata2015100$world_rank,
      Universitydata2015100$quality_of_faculty,
      data = Universitydata2015100,
      geom = c("line","smooth"),
      xlab = "World Rank",
      ylab = "Quality of Faculty Rank",
      color = I("red"),
      alpha = I(3/5))
cor(Universitydata2015100$world_rank,Universitydata2015100$quality_of_faculty)


#Alumni Employment
qplot(Universitydata2012100$world_rank,
      Universitydata2012100$alumni_employment,
      data = Universitydata2012100,
      geom = c("point","smooth"),
      xlab = "World Rank",
      ylab = "Alumni Employment Rank",
      ylim = c(0,150))
cor(Universitydata2012100$world_rank,Universitydata2012100$alumni_employment)


qplot(Universitydata2015100$world_rank,
      Universitydata2015100$alumni_employment,
      data = Universitydata2015100,
      geom = c("point","smooth"),
      xlab = "World Rank",
      ylab = "Alumni Employment Rank",
      color = I("red"),
      alpha = I(1/5))
cor(Universitydata2015100$world_rank,Universitydata2015100$alumni_employment)

 

