#' Sciensano Discrete Color Palettes
#'
#' Color palettes inspired by housestyle of Sciensano \url{https://intranet.sciensano.be/nl/DienstenAlgemeenDirecteur/Communicatie/Pages/Huisstijl-en-templates.aspx}.
#'
#' @param palette Palette type.
#' Currently there are two available option:
#' \code{"default", "contrast"} containing all or a subset of the palette
#' (14-color palette inspired by \emph{Sciensano}).
#' @param alpha Transparency level, a real number in (0, 1].
#' See \code{alpha} in \code{\link[grDevices]{rgb}} for details.
#'
#' @export pal_sciensano
#'
#' @importFrom grDevices col2rgb rgb
#' @importFrom scales manual_pal
#'
#' @examples
#' \dontrun{library("scales")
#' show_col(pal_sciensano("default")(10))
#' show_col(pal_sciensano("default", alpha = 0.6)(10))}
pal_sciensano <- function(palette = c("default", "contrast"), alpha = 1) {
  palette <- match.arg(palette)
  if (alpha > 1L | alpha <= 0L) stop("alpha must be in (0, 1]")

  raw_cols <- sciensano_col_d[[palette]]
  raw_cols_rgb <- grDevices::col2rgb(raw_cols)
  alpha_cols <- grDevices::rgb(
    raw_cols_rgb[1L, ], raw_cols_rgb[2L, ], raw_cols_rgb[3L, ],
    alpha = alpha * 255L, names = names(raw_cols),
    maxColorValue = 255L
  )

  scales::manual_pal(unname(alpha_cols))
}

#' Sciensano Color Color Scales
#'
#' See \code{\link{pal_sciensano}} for details.
#'
#' @inheritParams pal_sciensano
#' @param ... additional parameters for \code{\link[ggplot2]{discrete_scale}}
#'
#' @export scale_color_sciensano
#'
#' @importFrom ggplot2 discrete_scale
#'
#' @rdname scale_sciensano
#'
#' @examples
#' \dontrun{library("ggplot2")
#' data("diamonds")
#'
#' ggplot(
#'   subset(diamonds, carat >= 2.2),
#'   aes(x = table, y = price, colour = cut)
#' ) +
#'   geom_point(alpha = 0.7) +
#'   geom_smooth(method = "loess", alpha = 0.1, size = 1, span = 1) +
#'   theme_bw() + scale_color_sciensano()
#'
#' ggplot(
#'   subset(diamonds, carat > 2.2 & depth > 55 & depth < 70),
#'   aes(x = depth, fill = cut)
#' ) +
#'   geom_histogram(colour = "black", binwidth = 1, position = "dodge") +
#'   theme_bw() + scale_fill_sciensano()}

scale_color_sciensano <- function(palette = c("default", "contrast"), alpha = 1, ...) {
  palette <- match.arg(palette)
  discrete_scale("colour", "sciensano", pal_sciensano(palette, alpha), ...)
}

#' @export scale_colour_sciensano
#' @rdname scale_sciensano
scale_colour_sciensano <- scale_color_sciensano

#' @export scale_fill_sciensano
#' @importFrom ggplot2 discrete_scale
#' @rdname scale_sciensano
scale_fill_sciensano <- function(palette = c("default", "contrast"), alpha = 1, ...) {
  palette <- match.arg(palette)
  discrete_scale("fill", "sciensano", pal_sciensano(palette, alpha), ...)
}

#' Sciensano Continuous Color Palettes
#'
#' @param palette Palette type.
#' There are 3 available options:
#' \itemize{
#' \item \code{"red"}
#' \item \code{"green"}
#' \item \code{"red-yellow-green"}}
#' @param n Number of individual colors to be generated.
#' @param alpha Transparency level, a real number in (0, 1].
#' See \code{alpha} in \code{\link[grDevices]{rgb}} for details.
#' @param reverse Logical. Should the order of the colors be reversed?
#'
#' @export rgb_sciensano_c
#'
#' @importFrom grDevices colorRamp rgb
#' @importFrom scales manual_pal
#' @importFrom grDevices colorRampPalette
#'
#' @examples
#' \dontrun{library("scales")
#' show_col(rgb_sciensano_c("red")(10))
#' show_col(rgb_sciensano_c("red", n = 30, alpha = 0.6, reverse = TRUE)(30))}
rgb_sciensano_c <- function(palette = c("red", "green", "red-yellow-green"),
                            n = 10, alpha = 1, reverse = FALSE) {

  palette <- match.arg(palette)

  if (alpha > 1L | alpha <= 0L) stop("alpha must be in (0, 1]")

  raw_cols <- sciensano_col_c[[palette]]
  func_cols <- colorRamp(raw_cols, space = "Lab", interpolate = "spline")
  mat_cols <- func_cols(seq(0L, 1L, length.out = n))
  alpha_cols <- rgb(
    mat_cols[, 1L], mat_cols[, 2L], mat_cols[, 3L],
    alpha = alpha * 255L, maxColorValue = 255L
  )

  if (reverse) alpha_cols <- rev(alpha_cols)

  alpha_cols
}

#' Sciensano Continuous Color Palettes
#'
#' @inheritParams rgb_sciensano_c
#'
#' @export pal_sciensano_c
#'
#' @importFrom scales manual_pal
#'
#' @examples
#' \dontrun{library("scales")
#' show_col(pal_sciensano("red-yellow-green")(10))
#' show_col(pal_sciensano("red-yellow-green", n = 30, alpha = 0.6, reverse = TRUE)(30))}
pal_sciensano_c <- function(
  palette = c("red", "green", "red-yellow-green"),
  n = 10, alpha = 1, reverse = FALSE) {
  palette <- match.arg(palette)

  alpha_cols <- rgb_sciensano_c(palette, n, alpha, reverse)
  manual_pal(unname(alpha_cols))
}

#' Sciensano Continuous Color Palettes
#'
#' See \code{\link{pal_sciensano_c}} for details.
#'
#' @inheritParams pal_sciensano_c
#' @param ... additional parameters for \code{\link[ggplot2]{discrete_scale}}
#'
#' @export scale_color_sciensano_c
#'
#' @importFrom ggplot2 scale_color_gradientn
#'
#' @rdname scale_sciensano_c
#'
#' @examples
#' \dontrun{library("ggplot2")
#' library("reshape2")
#' data("mtcars")
#'
#' cor <- abs(cor(mtcars))
#' cor_melt <- melt(cor)
#'
#' ggplot(
#'   cor_melt,
#'   aes(x = Var1, y = Var2, fill = value)
#' ) +
#'   geom_tile(colour = "black", size = 0.3) +
#'   theme_bw() + scale_fill_sciensano_c("red-yellow-green")}
scale_color_sciensano_c <- function(
  palette = c("red", "green", "red-yellow-green"),
  alpha = 1, reverse = FALSE, ...) {
  palette <- match.arg(palette)
  scale_color_gradientn(
    colours = rgb_sciensano_c(
      palette,
      n = 512, alpha = alpha, reverse = reverse
    ),
    ...
  )
}

#' @export scale_colour_sciensano_c
#' @rdname scale_sciensano_c
scale_colour_sciensano_c <- scale_color_sciensano_c

#' @export scale_fill_sciensano_c
#' @importFrom ggplot2 scale_fill_gradientn
#' @rdname scale_sciensano_c
scale_fill_sciensano_c <- function(
  palette = c("red", "green", "red-yellow-green"),
  alpha = 1, reverse = FALSE, ...) {
  palette <- match.arg(palette)
  scale_fill_gradientn(
    colours = rgb_sciensano_c(
      palette,
      n = 512, alpha = alpha, reverse = reverse
    ),
    ...
  )
}
