#' Sciensano Color Palettes
#'
#' Color palettes inspired by housestyle of Sciensano \url{https://intranet.sciensano.be/nl/DienstenAlgemeenDirecteur/Communicatie/Pages/Huisstijl-en-templates.aspx}.
#'
#' @param palette Palette type.
#' Currently there is one available option: \code{"default"}
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
#' library("scales")
#' show_col(pal_sciensano("default")(10))
#' show_col(pal_sciensano("default", alpha = 0.6)(10))
pal_sciensano <- function(palette = c("default"), alpha = 1) {
  palette <- match.arg(palette)

  if (alpha > 1L | alpha <= 0L) stop("alpha must be in (0, 1]")

  raw_cols <- sciensano_col_d
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

scale_color_sciensano <- function(palette = c("default"), alpha = 1, ...) {
  palette <- match.arg(palette)
  discrete_scale("colour", "sciensano", pal_sciensano(palette, alpha), ...)
}

#' @export scale_colour_sciensano
#' @rdname scale_sciensano
scale_colour_sciensano <- scale_color_sciensano

#' @export scale_fill_sciensano
#' @importFrom ggplot2 discrete_scale
#' @rdname scale_sciensano
scale_fill_sciensano <- function(palette = c("default"), alpha = 1, ...) {
  palette <- match.arg(palette)
  discrete_scale("fill", "sciensano", pal_sciensano(palette, alpha), ...)
}
