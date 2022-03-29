## code to prepare `DATASET` for the colours goes here

## create colour data ####
## .. Discrete colours ####
## .. .. general colours
default <-
  c("midgreen" = rgb(red = 58, green = 170, blue = 53, maxColorValue = 255),
    "darkgreen" = rgb(red = 0, green = 102, blue = 51, maxColorValue = 255),
    "lightgreen" = rgb(red = 188, green = 207, blue = 0, maxColorValue = 255),
    "darkgrey" = rgb(red = 88, green = 89, blue = 91, maxColorValue = 255),
    "lightgrey" = rgb(red = 165, green = 165, blue = 165, maxColorValue = 255),
    "yellow" = rgb(red = 250, green = 213, blue = 0, maxColorValue = 255),
    "orange" = rgb(red = 242, green = 157, blue = 0, maxColorValue = 255),
    "red" = rgb(red = 201, green = 81, blue = 23, maxColorValue = 255),
    "pink" = rgb(red = 228, green = 148, blue = 192, maxColorValue = 255),
    "violet" = rgb(red = 185, green = 50, blue = 135, maxColorValue = 255),
    "purple" = rgb(red = 86, green = 59, blue = 140, maxColorValue = 255),
    "lighblue" = rgb(red = 132, green = 165, blue = 215, maxColorValue = 255),
    "greenblue" = rgb(red = 96, green = 188, blue = 184, maxColorValue = 255),
    "darkblue" = rgb(red = 34, green = 133, blue = 147, maxColorValue = 255))

contrast <-
  c("midgreen" = rgb(red = 58, green = 170, blue = 53, maxColorValue = 255),
    "darkgreen" = rgb(red = 0, green = 102, blue = 51, maxColorValue = 255),
    "lightgreen" = rgb(red = 188, green = 207, blue = 0, maxColorValue = 255),
    "yellow" = rgb(red = 250, green = 213, blue = 0, maxColorValue = 255),
    "orange" = rgb(red = 242, green = 157, blue = 0, maxColorValue = 255),
    "red" = rgb(red = 201, green = 81, blue = 23, maxColorValue = 255),
    "pink" = rgb(red = 228, green = 148, blue = 192, maxColorValue = 255),
    "violet" = rgb(red = 185, green = 50, blue = 135, maxColorValue = 255),
    "purple" = rgb(red = 86, green = 59, blue = 140, maxColorValue = 255),
    "lighblue" = rgb(red = 132, green = 165, blue = 215, maxColorValue = 255),
    "greenblue" = rgb(red = 96, green = 188, blue = 184, maxColorValue = 255),
    "darkblue" = rgb(red = 34, green = 133, blue = 147, maxColorValue = 255))

GnRd <-
  c("midgreen" = rgb(red = 58, green = 170, blue = 53, maxColorValue = 255),
    "darkgreen" = rgb(red = 0, green = 102, blue = 51, maxColorValue = 255),
    "lightgreen" = rgb(red = 188, green = 207, blue = 0, maxColorValue = 255),
    "yellow" = rgb(red = 250, green = 213, blue = 0, maxColorValue = 255),
    "orange" = rgb(red = 242, green = 157, blue = 0, maxColorValue = 255),
    "red" = rgb(red = 201, green = 81, blue = 23, maxColorValue = 255))

PuBl <-
  c("pink" = rgb(red = 228, green = 148, blue = 192, maxColorValue = 255),
    "violet" = rgb(red = 185, green = 50, blue = 135, maxColorValue = 255),
    "purple" = rgb(red = 86, green = 59, blue = 140, maxColorValue = 255),
    "lighblue" = rgb(red = 132, green = 165, blue = 215, maxColorValue = 255),
    "greenblue" = rgb(red = 96, green = 188, blue = 184, maxColorValue = 255),
    "darkblue" = rgb(red = 34, green = 133, blue = 147, maxColorValue = 255))

## .. .. HSR specific colours
Region <-
  c("BE" = rgb(red = 88, green = 89, blue = 91, maxColorValue = 255),
    "BR" = rgb(red = 132, green = 165, blue = 215, maxColorValue = 255),
    "FL" = rgb(red = 250, green = 213, blue = 0, maxColorValue = 255),
    "WA" = rgb(red = 201, green = 81, blue = 23, maxColorValue = 255))

## .. Save the colours in a list
 sciensano_col_d <-
   list("default" = default,
        "contrast" = contrast,
        "GnRd" = GnRd,
        "PuBl" = PuBl,
        "region" = Region)

## .. continuous colours ####
sciensano_col_c <-
   list("green" = c("#F7FCF5", "#006D2C"),
        "red" = c("#FFF5F0", "#CB181D"),
        "red-yellow-green" = c("#D73027", "#F46D43", "#FDAE61", "#FEE08B",
                               "#FFFFBF", "#D9EF8B", "#A6D96A", "#66BD63",
                               "#1A9850"))

## .. .. examples of the colors
## .. .. a) GREEN
colfunc <- colorRampPalette(c("#006D2C", "#F7FCF5"))
scales::show_col(colfunc(100), labels = FALSE)

## .. .. b) RED
colfunc <- colorRampPalette(c("#CB181D", "#FFF5F0"))
scales::show_col(colfunc(100), labels = FALSE)

## .. .. c) GREEN - YELLOW - RED
colfunc <- colorRampPalette(c("#D73027", "#F46D43", "#FDAE61", "#FEE08B",
                              "#FFFFBF", "#D9EF8B", "#A6D96A", "#66BD63",
                              "#1A9850"))
scales::show_col(colfunc(1000), labels = FALSE)

## create example data (based on gaminder) ####
## create example dataset
# dta <- read_csv("https://raw.githubusercontent.com/open-numbers/ddf--gapminder--life_expectancy/master/ddf--datapoints--life_expectancy_at_birth--by--geo--time.csv")
# dta <- read_csv("https://burden.sciensano.be/shiny/daly/session/33266afb66727f845fe25968b354f344/download/downloadData?w=")
dta <- readRDS("inst/extdata/BeBOD-COD-20220329.rds")

## save data
usethis::use_data(sciensano_col_d, sciensano_col_c, dta, internal = TRUE, overwrite = TRUE)
