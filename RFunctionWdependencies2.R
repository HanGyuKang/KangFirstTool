#' Draw ggplot of the data d
#'
#' This function draw a ggplot of the data d in the package
#' 
#' @param x data.frame
#' 
#' @return ggplot2
#' @export
#' @examples
#' data(d)
#' geegg(d)
geegg <- function(x){
  x%>% ggplot2::ggplot()+ggplot2::aes(x=gdpPercap, y=lifeExp)+gglpot2::geom_point()
}

#' Acquiring marginals and other slices of the data in the package
#'
#' This function acquires marginals and other slices of data in the package
#' 
#' @param x data.frame
#' 
#' @return data.frame
#' @export
#' @examples
#' data(d)
#' meandata(d)
meandata <- function(x){
  SummarizeData <- x %>% dplyr::select(continent, lifeExp, gdpPercap) %>% group_by(continent) %>% summarize(meanLifeExp=mean(lifeExp, na.rm = TRUE), meangdpPercap=mean(gdpPercap, na.rm = TRUE))
  SummarizeData
}
