#' Get the list of goals from Google Analytics
#' @param accountId Account ID to retrieve goals for. Can either be a specific account
#' ID or '~all', which refers to all the accounts that user has access to.
#' @param webPropertyId Web property ID to retrieve goals for. Can either be a
#' specific web property ID or '~all', which refers to all the web properties to which the user
#' has access.
#' @param profileId View (Profile) ID to retrieve goals for. Can either be a specific
#' view (profile) ID or '~all', which refers to all the views (profiles) that user has access to.
#' @param max.results The maximum number of accounts to include in this response.
#' @param start.index An index of the first account to retrieve. Use this parameter as a
#' pagination mechanism along with the max-results parameter.
#' @importFrom httr config accept_json content GET
#' @importFrom jsonlite fromJSON
#' @export
list_goals <- function(accountId = "~all", webPropertyId = "~all", profileId = "~all",
                       max.results = NULL, start.index = NULL){
  url <- get_endpoint("gamanager.goals.list", accountId = accountId, webPropertyId = webPropertyId,
                      profileId = profileId)
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


#' Get the details of a goal from Google Analytics
#' @param accountId Account ID to retrieve profile for.
#' @param webPropertyId ID to retrieve the profile for.
#' @param profileId ID to retrive the profile for.
#' @param goalId Goal ID to retrive the goal for.
#' @importFrom httr config accept_json content GET
#' @importFrom jsonlite fromJSON
#' @export
get_goal <- function(accountId, webPropertyId, profileId, goalId){
  url <- get_endpoint("gamanager.goals.get", accountId = accountId, webPropertyId = webPropertyId,
                      profileId = profileId, goalId = goalId)
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

