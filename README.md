
<!-- README.md is generated from README.Rmd. Please edit that file -->

# GGSANO

<!-- badges: start -->

[![R-CMD-check](https://github.com/sciensanogit/ggsano/workflows/R-CMD-check/badge.svg)](https://github.com/sciensanogit/ggsano/actions)
<!-- badges: end -->

The goal of ggsano is to standardize and implement the Sciensano
housestyle within R. The ggsano package currently provides three
categories of important functions: sciensano_style, sciensano_colours
and sciensano_templates. The sciensano_style functions can handle a
ggplot2-object and recompile it according to the Sciensano house style.
The sciensano_colours functions return the Sciensano house style colours
in HEX format (‘#XXXXXX’). Both discrete and continuous scales are
available.

## Installation

You can install the development version of ggsano from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("sciensanogit/ggsano")
```

The package can be loaded by:

``` r
library(ggsano)
```

## Using the functions

### Colors

The package has two palettes-functions available: `pal_sciensano()` for
discrete colors, and `pal_sciensano_c()` for continuous colors.

For the color palette `pal_sciensano`, there are two options available:
`default` and `contrast`.

``` r
scales::show_col(pal_sciensano(palette = "default")(14), labels = FALSE)
```

<img src="man/figures/README-unnamed-chunk-3-1.png" width="100%" />

``` r
scales::show_col(pal_sciensano(palette = "contrast")(12),  labels = FALSE)
```

<img src="man/figures/README-unnamed-chunk-4-1.png" width="100%" />

Hereafter an example is given using public available data. The pallete
can be used to color and fill a graph based on discrete scale

``` r
library("ggplot2")
library("reshape2")
library("cowplot")

data("mtcars")
data("diamonds")

ggplot(
  subset(diamonds, carat >= 2.2),
  aes(x = table, y = price, colour = cut)
) +
  geom_point(alpha = 0.7) +
  geom_smooth(method = "loess", alpha = 0.1, size = 1, span = 1) +
  theme_bw() + scale_color_sciensano(palette = "contrast")
#> `geom_smooth()` using formula 'y ~ x'
```

<img src="man/figures/README-unnamed-chunk-5-1.png" width="100%" />

``` r
ggplot(
  subset(diamonds, carat > 2.2 & depth > 55 & depth < 70),
  aes(x = depth, fill = cut)
) +
  geom_histogram(colour = "black", binwidth = 1, position = "dodge") +
  theme_bw() + scale_fill_sciensano(palette = "contrast")
```

<img src="man/figures/README-unnamed-chunk-5-2.png" width="100%" />

The palette can also be used with a continuous scale.

``` r
cor <- abs(cor(mtcars))
cor_melt <- melt(cor)

p1 <- ggplot(
  cor_melt,
  aes(x = Var1, y = Var2, fill = value)
) +
  geom_tile(colour = "black", size = 0.3) +
  theme_bw() + scale_fill_sciensano_c(palette = "red-yellow-green")

p2 <- ggplot(
  cor_melt,
  aes(x = Var1, y = Var2, fill = value)
) +
  geom_tile(colour = "black", size = 0.3) +
  theme_bw() + scale_fill_sciensano_c(palette = "green")

p3 <- ggplot(
  cor_melt,
  aes(x = Var1, y = Var2, fill = value)
) +
  geom_tile(colour = "black", size = 0.3) +
  theme_bw() + scale_fill_sciensano_c(palette = "red")

cowplot::plot_grid(p1, p2, p3)
```

<img src="man/figures/README-unnamed-chunk-6-1.png" width="100%" /> ###
sciensano style

`sciensano_style()`: has no arguments and is added to the ggplot chain
after you have created a plot. What it does is generally makes text
size, font and colour, axis lines, axis text and many other standard
chart components into Sciensano style.

``` r
p1+sciensano_style()
```

<img src="man/figures/README-unnamed-chunk-7-1.png" width="100%" />

### Finalizing plots

`finalise_plot`: will save out your plot with the correct guidelines for
publication for a Sciensano graphic. It is made up of functions that
will left align your title, subtitle and source, add the Sciensano
blocks at the bottom right and save it to your specified location. The
function has six arguments, three of which need to be explicitly set and
three that are defaults unless you overwrite them.

Here are the function arguments:
`finalise_plot(plot_name, source_name, save_filepath, width_pixels, height_pixels, logo_image_path)`

-   `plot_name`: the variable name that you have called your plot.
-   `source_name`: the source text that you want to appear at the bottom
    left corner of your plot. You will need to type the word `"Source:"`
    before it, just the source, so for example `source = "Source: ONS"`
    would be the right way to do that.
-   `save_filepath`: the precise filepath that you want your graphic to
    save to, including the `.png` extension at the end. This does depend
    on your working directory and if you are in a specific R project. An
    example of a relative filepath would be: `/charts/line_chart.png`.
-   `width_pixels`: this is set to 640px by default, so only call this
    argument and specify the width you want your chart to be.
-   `height_pixels`: this is set to 450px by default, so only call this
    argument and specify the height you want your chart to be.
-   `logo_image_path`: this argument specifies the path for the
    image/logo in the bottom right corner of the plot. The default is
    for a placeholder PNG file with a background that matches the
    background colour of the plot, so do not specify the argument if you
    want it to appear without a logo. If you want to add your own logo,
    just specify the path to your PNG file. The package has been
    prepared with a wide and thin image in mind.

``` r
finalise_plot(plot_name = p1,
source = "Source: XX",
save_filepath = "filename_that_my_plot_should_be_saved_to-nc.png",
logo_image_path = "inst/extdata/logo.png",
width_pixels = 640,
height_pixels = 550)
```

<img src="man/figures/README-unnamed-chunk-8-1.png" width="100%" />
