#'
#' An Interface to the Naruto Database API
#' 
#' The NarutoDB API <https://narutodb.xyz/api> offers a comprehensive database 
#' featuring all the characters, clans, villages, kekkei genkai, tailed beasts, 
#' teams, akatsuki, and rara members from the renowned anime and manga series 
#' *Naruto*. The API provides detailed information on each character, including 
#' their names, appearances, personalities, jutsus, and ninja tools. This 
#' package interfaces with the NarutoDB API through R.
#' 
#' @docType package
#' @keywords internal
#' @name naruto
#' @importFrom httr2 request req_url_path req_url_query req_perform 
#'   resp_body_json 
#' @importFrom jsonlite fromJSON
#' 
"_PACKAGE"
