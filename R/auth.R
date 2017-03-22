.gamanagerEnv <- new.env(parent = emptyenv())
.gamanagerEnv$Token <- NULL

# Set token to environment
set_token <- function(value) {
  .gamanagerEnv$Token <- value
  return(value)
}

# Get token from environment
get_token <- function() {
  .gamanagerEnv$Token
}

#' Authorize R package to access Google Analytics API
#' @description This is a function to authorize the R package to access the Google Analytics API. If no
#' client.id and client.secret is provided, the package would provide predefined values.
#' @importFrom httr oauth_app oauth_endpoints oauth2.0_token
#' @param client.id OAuth client ID. This is obtained from Google API Credentials
#' @param client.secret OAuth client secret. This is obtained from Google API Credentials
#' @export
authorize <- function(client.id = getOption("gamanager.client.id"),
                      client.secret = getOption("gamanager.client.secret")){
  app <- oauth_app(appname = "googlemanager", key = client.id, secret = client.secret)
  endpoint <- oauth_endpoints("google")
  token <- oauth2.0_token(endpoint = endpoint, app = app,
                          scope = c("https://www.googleapis.com/auth/analytics"))
  set_token(token)
  return(invisible(token))
}
