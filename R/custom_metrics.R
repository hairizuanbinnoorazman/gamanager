#' Get the list of custom metrics from Google Analytics
#' @param accountId Account ID to retrieve custom metrics for. Can either be a specific account
#' ID or '~all', which refers to all the accounts that user has access to.
#' @param webPropertyId Web property ID to retrieve custom metrics for. Can either be a
#' specific web property ID or '~all', which refers to all the web properties to which the user
#' has access.
#' @param max.results The maximum number of results to include in this response.
#' @param start.index An index of the first result to retrieve. Use this parameter as a
#' pagination mechanism along with the max-results parameter.
#' @importFrom httr config accept_json content GET
#' @importFrom jsonlite fromJSON
#' @export
list_custom_metrics <- function(accountId, webPropertyId,
                                   max.results = NULL, start.index = NULL){
  url <- get_endpoint("gamanager.metrics.list", accountId = accountId, webPropertyId = webPropertyId)
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
