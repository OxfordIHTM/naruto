#'
#' Select genin
#' 

naruto_select_genin <- function() {
  genin <- c(
    "Madinat", "Alaa", "Reem", "Nyasha", "Erica", "Seiza", "Nashwa", "Onesmus",
    "Fona", "Dulanjalee", "Phyllis", "Angela", "Simon", "Ibrahim", "Tumi",
    "Ayiila", "Indri", "Sinnah", "Hao"
  )

  genin_mix <- sample(x = genin, size = 19, replace = FALSE)

  sample(x = genin_mix, size = 1, replace = FALSE)
}

