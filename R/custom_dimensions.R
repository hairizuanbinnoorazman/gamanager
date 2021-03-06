#' Get the list of custom dimensions from Google Analytics
#' @param accountId Account ID to retrieve custom metrics for. A specific account
#' ID needs to be provided.
#' @param webPropertyId Web property ID to retrieve custom metrics for. A specific web property ID
#' needs to be provided.
#' @param max.results The maximum number of accounts to include in this response.
#' @param start.index An index of the first account to retrieve. Use this parameter as a
#' pagination mechanism along with the max-results parameter.
#' @importFrom httr config accept_json content GET
#' @importFrom jsonlite fromJSON
#' @export
list_custom_dimensions <- function(accountId, webPropertyId,
                                   max.results = NULL, start.index = NULL){
  url <- get_endpoint("gamanager.dimensions.list", accountId = accountId, webPropertyId = webPropertyId)
  token <- get_token()
  config <- httr::config(token=token)
  # List of query parameters
  query_params = list()
  query_params['max-results'] = max.results
  query_params['start-index'] = start.index
  # GET request
  result <- httr::GET(url, config = config, accept_json(), query = query_params, encode = "json")
  result_content <- content(result, "text")
  result_list <- fromJSON(result_content)
  # If endpoint return url status other than 200, return error message
  if(httr::status_code(result) != 200){
    stop(result_list$error$message)
  }
  return(result_list)
}
