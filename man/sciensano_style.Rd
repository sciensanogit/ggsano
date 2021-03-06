% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/figures-and-helpers.R
\name{sciensano_style}
\alias{sciensano_style}
\title{Add sciensano theme to ggplot chart}
\usage{
sciensano_style(font = "Arial")
}
\arguments{
\item{font}{Specify one of the available fonts (Default: Arial)}
}
\description{
This function allows you to add the sciencsano theme to your ggplotgraphics.
}
\examples{
\dontrun{line <- ggplot(line_df, aes(x = year, y = lifeExp)) +
geom_line(colour = "#007f7f", size = 1) +
geom_hline(yintercept = 75, size = 1, colour="#3AAA35") +
sciensano_style()}
}
\keyword{sciensano_style}
