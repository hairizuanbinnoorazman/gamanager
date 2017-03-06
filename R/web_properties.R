#' Get the list of properties from Google Analytics
#' @param accountId Account ID to retrieve web properties for. Can either be a specific account
#' ID or '~all', which refers to all the accounts that user has access to.
#' @param max.results The maximum number of accounts to include in this response.
#' @param start.index An index of the first account to retrieve. Use this parameter as a
#' pagination mechanism along with the max-results parameter.
#' @importFrom httr config accept_json content GET
#' @importFrom jsonlite fromJSON
#' @export
list_properties <- function(accountId = "~all", max.results = NULL, start.index = NULL){
  url <- get_endpoint("gamanager.properties.list", accountId)
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


#' Get the details of a web property from Google Analytics
#' @param accountId Account ID to retrieve web properties for.
#' @param webPropertyId ID to retrieve the web property for.
#' @importFrom httr config accept_json content GET
#' @importFrom jsonlite fromJSON
#' @export
get_property <- function(accountId, webPropertyId){
  url <- get_endpoint("gamanager.properties.get", accountId, webPropertyId)
  token <- get_token()
  config <- httr::config(token=token)
  # GET request
  result <- httr::GET(url, config = config, accept_json(), encode = "json")
  result_content <- content(result, "text")
  result_list <- fromJSON(result_content)
  # If endpoint return url status other than 200, return error message
  if(httr::status_code(result) != 200){
    stop(result_list$error$message)
  }
  return(result_list)
}


#' Create a new property in Google Analytics
#' @param accountId Account ID to link to new web property. Does not accept ~all as paramter
#' @param name Name of web property
#' @param websiteUrl Optional field. Website url for this web property.
#' @param industryVertical Optional field. The industry vertical/category selected for this web property.
#' If this field is set, the correct values are: UNSPECIFIED, ARTS_AND_ENTERTAINMENT
#' @importFrom httr config accept_json content POST
#' @importFrom jsonlite fromJSON
#' @export
create_property <- function(accountId, name, websiteUrl=NULL, industryVertical = NULL){
  url <- get_endpoint("gamanager.properties.create", accountId)
  token <- get_token()
  config <- httr::config(token=token)
  # List of query parameters
  body_params = list()
  body_params['websiteUrl'] = websiteUrl
  body_params['name'] = name
  body_params['industryVertical'] = industryVertical
  # GET request
  result <- httr::POST(url, config = config, accept_json(), body = body_params, encode = "json")
  result_content <- content(result, "text")
  result_list <- fromJSON(result_content)
  # If endpoint return url status other than 200, return error message
  if(httr::status_code(result) != 200){
    stop(result_list$error$message)
  }
  return(result_list)
}




