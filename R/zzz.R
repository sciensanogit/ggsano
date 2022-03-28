# ## import fontawesome on load
# .onLoad <- function(libname, pkgname) {
#   # packageStartupMessage("Loading fonts that are necessary for the graphs.")
#   if (Sys.info()[1] == "Linux") {
#     dir.create('~/.fonts')
#     file.copy("inst/extdata/fonts/arial.ttf", "~/.fonts")
#     system('fc-cache -f ~/.fonts')
#   }
#   if (Sys.info()[1] == "Windows") {
#     extrafont::font_import(pattern = "arial", prompt = FALSE)
#     extrafont::loadfonts(device = "win", quiet = TRUE)
#   }
#   # packageStartupMessage("Fonts are loaded and ready to be used")
#   # packageStartupMessage("To see available fonts, run: print(extrafont::fonts())")
# }

