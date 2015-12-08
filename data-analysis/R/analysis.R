# Some useful keyboard shortcuts for package authoring:
#
#   Build and Reload Package:  'Ctrl + Shift + B'
#   Check Package:             'Ctrl + Shift + E'
#   Test Package:              'Ctrl + Shift + T'

loadData <- function() {
  data <- read.csv2('data.csv', header = FALSE, sep = ',')
}

generateBoxPlot4 <- function(data)
{
  s1 <- c()
  s2 <- c()
  s3 <- c()
  s4 <- c()
  s5 <- c()
  for(i in seq(1, 137))
  {
    if(data$V1[i] == 1) s1 <- c(s1, data$V5[i])
    if(data$V1[i] == 2) s2 <- c(s2, data$V5[i])
    if(data$V1[i] == 3) s3 <- c(s3, data$V5[i])
    if(data$V1[i] == 4) s4 <- c(s4, data$V5[i])
    if(data$V1[i] == 5) s5 <- c(s5, data$V5[i])
  }

  png('results/s1_boxplot.png')
  boxplot(s1)
  dev.off()
  png('results/s2_boxplot.png')
  boxplot(s2)
  dev.off()
  png('results/s3_boxplot.png')
  boxplot(s3)
  dev.off()
  png('results/s4_boxplot.png')
  boxplot(s4)
  dev.off()
  png('results/s5_boxplot.png')
  boxplot(s5)
  dev.off()
  png('results/s1_s2_boxplot.png')
  boxplot(s1,s2)
  dev.off()
  png('results/s1_s3_boxplot.png')
  boxplot(s1,s3)
  dev.off()
  png('results/s1_s4_boxplot.png')
  boxplot(s1,s4)
  dev.off()
  png('results/s1_s5_boxplot.png')
  boxplot(s1,s5)
  dev.off()
  png('results/s2_s3_boxplot.png')
  boxplot(s2,s3)
  dev.off()
  png('results/s2_s4_boxplot.png')
  boxplot(s2,s4)
  dev.off()
  png('results/s2_s5_boxplot.png')
  boxplot(s2,s5)
  dev.off()
  png('results/s3_s4_boxplot.png')
  boxplot(s3,s4)
  dev.off()
  png('results/s3_s5_boxplot.png')
  boxplot(s3,s5)
  dev.off()
  png('results/s4_s5_boxplot.png')
  boxplot(s4,s5)
  dev.off()
  png('results/all_boxplot.png')
  boxplot(s1,s2,s3,s4,s5)
  dev.off()
}

generateHist <- function(data)
{
  s1 <- c()
  s2 <- c()
  s3 <- c()
  s4 <- c()
  s5 <- c()
  for(i in seq(1, 137))
  {
    if(data$V1[i] == 1) s1 <- c(s1, data$V5[i])
    if(data$V1[i] == 2) s2 <- c(s2, data$V5[i])
    if(data$V1[i] == 3) s3 <- c(s3, data$V5[i])
    if(data$V1[i] == 4) s4 <- c(s4, data$V5[i])
    if(data$V1[i] == 5) s5 <- c(s5, data$V5[i])
  }

  png('results/s1_hist.png')
  hist(s1)
  dev.off()
  png('results/s2_hist.png')
  hist(s2)
  dev.off()
  png('results/s3_hist.png')
  hist(s3)
  dev.off()
  png('results/s4_hist.png')
  hist(s4)
  dev.off()
  png('results/s5_hist.png')
  hist(s5)
  dev.off()
}

ksTest <- function(data)
{
  s1 <- c()
  s2 <- c()
  s3 <- c()
  s4 <- c()
  s5 <- c()
  for(i in seq(1, 137))
  {
    if(data$V1[i] == 1) s1 <- c(s1, data$V5[i])
    if(data$V1[i] == 2) s2 <- c(s2, data$V5[i])
    if(data$V1[i] == 3) s3 <- c(s3, data$V5[i])
    if(data$V1[i] == 4) s4 <- c(s4, data$V5[i])
    if(data$V1[i] == 5) s5 <- c(s5, data$V5[i])
  }

  report <- c(ks.test(s1, "dnorm"), ks.test(s2, "dnorm"), ks.test(s3, "dnorm"), ks.test(s4, "dnorm"), ks.test(s5, "dnorm"))

}
