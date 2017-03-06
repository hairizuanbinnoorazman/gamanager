#' Generate endpoint for Google Analytics Management API
#' Temporarily available
#' @export
get_endpoint <- function(typeOfEndpoint = "gamanager.accounts.list", accountId = NULL,
                         webPropertyId = NULL, profileId = NULL, goalId = NULL,
                         customDimensionId = NULL, customMetricId = NULL){
  url <- getOption(typeOfEndpoint)
  # If there is no parameter within URL, it is supposed to return the url with no changes
  if(!grepl('{', url, fixed = TRUE)){
    return(url)
  }
  if(grepl('{accountId}', url, fixed = TRUE)){
    url <- gsub('{accountId}', accountId, url, fixed = TRUE)
  }
  if(grepl('{webPropertyId}', url, fixed = TRUE)){
    url <- gsub('{webPropertyId}', webPropertyId, url, fixed = TRUE)
  }
  if(grepl('{profileId}', url, fixed = TRUE)){
    url <- gsub('{profileId}', profileId, url, fixed = TRUE)
  }
  if(grepl('{goalId}', url, fixed = TRUE)){
    url <- gsub('{goalId}', goalId, url, fixed = TRUE)
  }
  if(grepl('{customDimensionId}', url, fixed = TRUE)){
    url <- gsub('{customDimensionId}', customDimensionId, url, fixed = TRUE)
  }
  if(grepl('{customMetricId}', url, fixed = TRUE)){
    url <- gsub('{customMetricId}', customMetricId, url, fixed = TRUE)
  }
  return(url)
}
