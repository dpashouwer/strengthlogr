

#' Build Microcycle
#'
#' @return
#' @export
#'
#' @examples
build_microcycle <- function(){
  microcycle <- tibble::tibble(week = numeric(),
                               day = numeric(),
                               exercise = character(),
                               sets = numeric(),
                               type = character(),
                               target_reps = character(),
                               target_rpe = numeric(),
                               target_pct = numeric()) %>%
    dplyr::add_row(day = 1)

  microcycle
}

#' Add workout to a microcycle
#'
#' @param microcycle
#'
#' @return
#' @export
#'
#' @examples
new_workout <- function(microcycle){
  current_day = max(microcycle$day)
  microcycle %>%
    dplyr::add_row(day = current_day + 1)
}

#' Add Exercist to a workout
#'
#' @param microcycle
#' @param exercise
#' @param sets
#' @param target_reps
#' @param target_rpe
#' @param target_pct
#'
#' @return
#' @export
#'
#' @examples
add_exercise <- function(microcycle, exercise, sets, target_reps = NA_character_, target_rpe = NA_integer_, target_pct = NA_integer_){
  microcycle %>%
    dplyr::add_row(exercise = exercise, sets = 1:sets, target_reps = target_reps, target_rpe = target_rpe, target_pct = target_pct) %>%
    tidyr::fill(day, .direction = "down") %>%
    dplyr::filter(!is.na(exercise))
}
