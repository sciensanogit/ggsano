##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
##  01-updates.R
##  Purpose: perform updates of teh package
##  Author: Robby De Pauw
##  Date: 29-03-2022
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## !!!!! DO NOT SOURCE THIS DOCUMENT !!!!!

##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
##                        INFO ####
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## Script to create updates of teh package
## load required libraries
## rebuilds the vignettes and the website entirely

## The package is structures as follows:

## colors-and-helpers.R
## .. contains information on the color functions
## .. .. pal_sciensano
## .. .. scale_color_sciensano
## .. .. scale_fill_sciensano
## .. .. rgb_sciensano_c
## .. .. pal_sciensano_c
## .. .. scale_color_sciensano_c

## colors-and-helpers.R
## .. sciensano_style
## .. finalise_plot


##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
##                        PREPARE ####
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## .. load packages ####
library(devtools) ## develop the package
library(usethis) ## use for easy pkg-building
library(pkgdown) ## create a page for the package
library(gapminder) ## save data locally, so we don't need the gapminder dependency
library(readr)

##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
##                        SCRIPT ####
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## update the color database
source("inst/dev/02-update-data.R")

## NOW YOU CAN UPDATE THE PKG

## document the changes
devtools::document()

## Perform some checks
devtools::load_all()
devtools::check()

## UPDATE THE WEBSITE
## create font example
#Data for chart from gapminder package
line_df <- dta %>%
  filter(geo == "bel")

#Make plot
line <- ggplot(line_df, aes(x = time, y = life_expectancy_at_birth)) +
  geom_line(colour = "#1380A1", size = 1) +
  geom_hline(yintercept = 0, size = 1, colour="#333333") +
  labs(title="Living longer",
       subtitle = "Life expectancy in Belgium 1952-2007")

pl1 <- line + sciensano_style(font = "Arial") + ggtitle("Arial")
pl2 <- line + sciensano_style(font = "Papyrus") + ggtitle("Papyrus")
pl3 <- line + sciensano_style(font = "Rockwell") + ggtitle("Rockwell")
pl4 <- line + sciensano_style(font = "Times New Roman") + ggtitle("Times New Roman")

cowplot::ggsave2(cowplot::plot_grid(pl1, pl2, pl3, pl4),
                 filename = "vignettes/fonts.png",
                 width = 12, height = 8)

## clean and build
devtools::clean_vignettes()
devtools::build_vignettes() ## update vignettes
pkgdown::build_site() ## update website

##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
##                        Extra code ####
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
usethis::use_package() ## include a package as dependency
usethis::use_vignette() ## include a new vignette
