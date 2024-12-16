#'
#' Get all Naruto characters available from NarutoDB
#' 
#' @param base_url Base URL of the NarutoDB API. This is currently set to
#'   "https://narutodb.xyz".
#' @param id A numeric value or vector of numeric values for the unique 
#'   identifier of Naruto characters.
#' @param json Logical. Should output be returned as JSON? If FALSE (default),
#'   returns a data.frame. Otherwise, returns a standard JSON format output.
#' @param clean_names Logical. Should data.frame output variable names be
#'   cleaned? If TRUE (default), variable names are tidied appropriately.
#'   Otherwise, variable names are kept as is. Only evaluated when 
#'   `json = FALSE`.
#' 
#' @returns If `json = TRUE`, returns a simplified and flattend data.frame. If
#'   `json = FALSE`, returns a standard JSON format output. See
#'   <https://narutodb.xyz/docs/characters/characterSchema> for schema of
#'   NarutoDB characters output.
#' 
#' @examples
#' naruto_get_characters()
#' naruto_get_character_by_id(id = 55)
#' 
#' @rdname naruto_get_character
#' @export
#' 

naruto_get_characters <- function(base_url = "https://narutodb.xyz", 
                                  json = FALSE,
                                  clean_names = TRUE) {
  ## Perform request ----
  req <- httr2::request(base_url = base_url) |>
    httr2::req_url_path("api", "character") |>
    httr2::req_url_query(limit = 1431)

  ## Get response ----
  resp <- req |> httr2::req_perform() 
  
  ## Determine output ----
  if (json) {
    result <- resp |> 
      httr2::resp_body_json()
  } else {
    result <- resp |> 
      httr2::resp_body_json(simplifyVector = TRUE, flatten = TRUE) |>
      (\(x) do.call(cbind, x))()

    if (clean_names) {
      names(result) <- names(result) |>
        trimws() |>
        gsub(pattern = "\\.", replacement = "_", x = _) |>
        gsub(pattern = " ", replacement = "-", x = _)

      result <- result |>
        (\(x)
          {
            x$characters_images <- lapply(
              X = x$characters_images, FUN = paste, collapse = "; "
            ) |>
              unlist()
        
            x$characters_jutsu <- lapply(
              X = x$characters_jutsu, FUN = paste, collapse = "; "
            ) |>
              unlist()
        
            x$characters_personal <- lapply(
              X = x$characters_personal, FUN = paste, collapse = "; "
            ) |>
              unlist()

            x$characters_uniqueTraits <- lapply(
              X = x$characters_personal, FUN = paste, collapse = "; "
            ) |>
              unlist()
        
            x$characters_natureType <- lapply(
              X = x$characters_natureType, FUN = paste, collapse = "; "
            ) |>
              unlist()

            x$characters_rank <- lapply(
              X = x$characters_rank, FUN = paste, collapse = "; "
            ) |>
              unlist()
        
            x$characters_tools <- lapply(
              X = x$characters_tools, FUN = paste, collapse = "; "
            ) |>
              unlist()
            
            x$characters_voiceActors_japanese <- lapply(
              X = x$characters_voiceActors_japanese, FUN = paste, collapse = "; "
            ) |>
              unlist()
        
            x$characters_voiceActors_english <- lapply(
              X = x$characters_voiceActors_english, FUN = paste, collapse = "; "
            ) |>
              unlist()
        
            x
          }
        )()
    }
  }

  ## Return result ----
  result
}

#'
#' @rdname naruto_get_character
#' @export
#' 

naruto_get_character_by_id <- function(id,
                                       base_url = "https://narutodb.xyz") {
  ## Perform request ----
  req <- httr2::request(base_url = base_url) |>
    httr2::req_url_path("api", "character", id)
  
  ## Get response ----
  resp <- req |> httr2::req_perform()
  
  ## Get result ----
  result <- resp |> httr2::resp_body_json()

  ## Return result ----
  result  
}
