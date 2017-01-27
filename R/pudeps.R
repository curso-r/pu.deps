#' Instala PU deps
#'
#' @param u_desc URL do arquivo DESCRIPTION
#'
#' @export
pu_install_deps <- function(u_desc) {
  tmp <- tempfile()
  httr::GET(u_desc, httr::write_disk(tmp))
  power_ups <- desc::desc_get('PowerUps', file = tmp)
  power_ups <- unlist(stringr::str_split(power_ups, ','))
  power_ups <- stringr::str_trim(power_ups)
  file.remove(tmp)
  devtools::install_github(power_ups)
  suppressMessages(utils::remove.packages(basename(power_ups)))
  invisible(TRUE)
}

