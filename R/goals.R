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


#' Create a visit number of pages goals
#' @param accountId Account ID to retrieve profile for.
#' @param webPropertyId ID to retrieve the profile for.
#' @param profileId ID to retrive the profile for.
#' @param goalId The goal ID for the current specified goal.
#' @param goalName Goal name.
#' @param goalValue Goal value. Defaults to NULL
#' @param active Determines whether this goal is active. Defaults to TRUE
#' @param comparisonType Type of comparison. Possible values are LESS_THAN, GREATER_THAN, or EQUAL.
#' @param comparisonValue Value used for this comparison.
#' @importFrom httr config accept_json content POST
#' @importFrom jsonlite fromJSON
#' @export
create_goal_visitNumPages <- function(accountId, webPropertyId, profileId, goalId,
                                      goalName, goalValue=NULL, active=TRUE, comparisonType, comparisonValue){
  url <- get_endpoint("gamanager.goals.create", accountId = accountId, webPropertyId = webPropertyId,
                      profileId = profileId)
  token <- get_token()
  config <- httr::config(token=token)
  # List of body parameters
  body_params = list()
  body_params['id'] = goalId
  body_params['name'] = goalName
  body_params['type'] = 'VISIT_NUM_PAGES'
  body_params['active'] = active
  body_params['value'] = goalValue
  body_params$visitNumPagesDetails = list()
  body_params$visitNumPagesDetails$comparisonType = comparisonType
  body_params$visitNumPagesDetails$comparisonValue = comparisonValue
  # POST request
  result <- httr::POST(url, config = config, accept_json(), body = body_params, encode = "json")
  result_content <- content(result, "text")
  result_list <- fromJSON(result_content)
  # If endpoint return url status other than 200, return error message
  if(httr::status_code(result) != 200){
    stop(result_list$error$message)
  }
  return(result_list)
}

