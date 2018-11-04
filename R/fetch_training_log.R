
#' Clean the Google Sheets training log.
#'
#' @param dat
#'
#' @return
#' @export
#'
#' @examples
fetch_training_log <- function(key = "1UGyjRtesbrW7URbJZOr2j-3J2VL894SxigRlHquGYNg", worksheet = "StrengthLog"){
  gs_key(key) %>%
    gs_read(ws = worksheet) %>%
    clean_names() %>%
    mutate(date = mdy(date),
           reps = reps %>% as.numeric(),
           weight = weight %>% as.numeric()) %>%

    filter(!is.na(reps)) %>%
    select(date, exercise, type, reps, weight, e1rm) %>%
    mutate(week = floor_date(date, unit = "weeks"))
}
