#' Fetch the Program Template
#'
#' @param key
#' @param worksheet
#'
#' @return
#' @export
#'
#' @examples
fetch_program_template <- function(key = "1UGyjRtesbrW7URbJZOr2j-3J2VL894SxigRlHquGYNg", worksheet = "HIDE_Program Template"){
  googlesheets::gs_key(key) %>%
    googlesheets::gs_read(ws = worksheet) %>%
    janitor::clean_names()
}
