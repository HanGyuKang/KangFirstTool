context("Homework functions")

test_that("func1 computes mean, var, sd", {
  x <- 1:10
  var1<-function(x){(1/length(x))*sum((x-mean(x))^2)}
  x_list<-list(mean=mean(x),var=var1(x),sd=sqrt(var1(x)))
  expect_identical(func1(x), x_list)
})

test_that("func2 computes mean, var, sd", {
  x <- 1:10
  var1<-function(x){(1/length(x))*sum((x-mean(x))^2)}
  x_list<-list(mean=mean(x),var=var1(x),sd=sqrt(var1(x)))
  expect_identical(func2(x), x_list)
  save<-try(func2(NA),silent=TRUE)
  expect_identical(as.character(attr(save,"condition")),"Error: is.numeric(x) is not TRUE\n")
})

test_that("denstiy computes density of data x", {
  x <- 1:10
  func1 = function(theta, x) dgamma(x, shape =theta, log =TRUE)
  func2 = function(theta, x) dcauchy(x, location = theta, log = TRUE)
  func3 = function(theta, x) dbinom(X, 20, prob = 1/ (1 +exp(-theta)), log = TRUE)
  denstiy <- function(x, func, interval){
    f7 <- function(theta, x)
    {sum(func(theta,x))}
    oout <- optimize(f7, maximum = TRUE, interval, x=x)
    return(oout$maximum)
    expect_identical(f7(theta,x),f7(theta,x))
  }
})

test_that("Returning ggplot", {
  geegg <- function(x){
    x%>% ggplot2::ggplot()+ggplot2::aes(x=gdpPercap, y=lifeExp)+gglpot2::geom_point()}
  expect_identical(geegg(x), gglot(data=d, aes(x=gdpPercap, y=lifeExp)+geom_point()))
})

test_that("returning mean value of data x", {
  meandata <- function(x)
    SummarizeData <- x %>% dplyr::select(continent, lifeExp, gdpPercap) %>% group_by(continent) %>% summarize(meanLifeExp=mean(lifeExp, na.rm = TRUE), meangdpPercap=mean(gdpPercap, na.rm = TRUE))
    SummarizeData
    expect_identical(SummarizeData(x),summerizeData(x))
})
