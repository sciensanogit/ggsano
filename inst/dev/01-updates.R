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

## clean and build
devtools::clean_vignettes()
devtools::build_vignettes() ## update vignettes
pkgdown::build_site() ## update website

##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
##                        Extra code ####
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
usethis::use_package() ## include a package as dependency
