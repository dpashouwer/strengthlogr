
#' Clean the Google Sheets training log.
#'
#' @param dat
#'
#' @return dat
#' @export
fetch_training_log <- function(key = "1UGyjRtesbrW7URbJZOr2j-3J2VL894SxigRlHquGYNg", worksheet = "StrengthLog"){
  googlesheets::gs_key(key) %>%
    googlesheets::gs_read(ws = worksheet) %>%
    janitor::clean_names() %>%
    dplyr::mutate(date = lubridate::mdy(date),
           reps = reps %>% as.numeric(),
           weight = weight %>% as.numeric()) %>%

    dplyr::filter(!is.na(reps)) %>%
    dplyr::select(date, exercise, type, reps, weight, e1rm) %>%
    dplyr::mutate(week = lubridate::floor_date(date, unit = "weeks"))
}
