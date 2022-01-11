## code to prepare `DATASET` dataset goes here

## create colour data

### discrete colours
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

Region <-
  c("BE" = rgb(red = 88, green = 89, blue = 91, maxColorValue = 255),
    "BR" = rgb(red = 132, green = 165, blue = 215, maxColorValue = 255),
    "FL" = rgb(red = 250, green = 213, blue = 0, maxColorValue = 255),
    "WA" = rgb(red = 201, green = 81, blue = 23, maxColorValue = 255))

 sciensano_col_d <-
   list("default" = default,
        "contrast" = contrast,
        "GnRd" = GnRd,
        "PuBl" = PuBl,
        "region" = region)

### continuous colours
sciensano_col_c <-
   list("green" = c("#F7FCF5", "#006D2C"),
        "red" = c("#FFF5F0", "#CB181D"),
        "red-yellow-green" = c("#D73027", "#F46D43", "#FDAE61", "#FEE08B",
                               "#FFFFBF", "#D9EF8B", "#A6D96A", "#66BD63",
                               "#1A9850"))

#### GREEN
colfunc <- colorRampPalette(c("#006D2C", "#F7FCF5"))
scales::show_col(colfunc(100), labels = FALSE)


#### RED
colfunc <- colorRampPalette(c("#CB181D", "#FFF5F0"))
scales::show_col(colfunc(100), labels = FALSE)

#### GREEN - YELLOW - RED
colfunc <- colorRampPalette(c("#D73027", "#F46D43", "#FDAE61", "#FEE08B",
                              "#FFFFBF", "#D9EF8B", "#A6D96A", "#66BD63",
                              "#1A9850"))
scales::show_col(colfunc(1000), labels = FALSE)

## create line_df
line_df <-
  data.frame(
    year = 1980:2020,
    lifeExp = rnorm(41, 75, 5))

## save data
usethis::use_data(sciensano_col_d, sciensano_col_c, line_df, internal = TRUE, overwrite = TRUE)
