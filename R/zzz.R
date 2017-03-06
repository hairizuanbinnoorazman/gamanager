.onAttach <- function(libname, pkgname) {
  packageStartupMessage("Please use predefined Credentials only for the testing requests. To obtain your own Credentials see help(authorize).")
}

.onLoad <- function(libname, pkgname) {
  op <- options()
  op.gamanager <- list(
    gamanager.client.id = "191060012528-4vlla7hsld46gfrm02qrssgu3ndu71kv.apps.googleusercontent.com",
    gamanager.client.secret = "caiD3xY1P5URUxk2wLZa1VWl",

    # Accounts
    gamanager.accounts.list = "https://www.googleapis.com/analytics/v3/management/accounts",

    # Properties
    gamanager.properties.list = "https://www.googleapis.com/analytics/v3/management/accounts/{accountId}/webproperties",
    gamanager.properties.create = "https://www.googleapis.com/analytics/v3/management/accounts/{accountId}/webproperties",
    gamanager.properties.get = "https://www.googleapis.com/analytics/v3/management/accounts/{accountId}/webproperties/{webPropertyId}",

    # Profiles
    gamanager.profiles.list = "https://www.googleapis.com/analytics/v3/management/accounts/{accountId}/webproperties/{webPropertyId}/profiles",
    gamanager.profiles.create = "https://www.googleapis.com/analytics/v3/management/accounts/{accountId}/webproperties/{webPropertyId}/profiles",
    gamanager.profiles.get = "https://www.googleapis.com/analytics/v3/management/accounts/{accountId}/webproperties/{webPropertyId}/profiles/{profileId}",

    # Filters
    gamanager.filters.list = "https://www.googleapis.com/analytics/v3/management/accounts/{accountId}/filters",
    gamanager.filters.create = "https://www.googleapis.com/analytics/v3/management/accounts/{accountId}/filters",
    gamanager.filters.get = "https://www.googleapis.com/analytics/v3/management/accounts/{accountId}/filters/{filterId}",

    # Goals
    gamanager.goals.list = "https://www.googleapis.com/analytics/v3/management/accounts/{accountId}/webproperties/{webPropertyId}/profiles/{profileId}/goals",
    gamanager.goals.create = "https://www.googleapis.com/analytics/v3/management/accounts/{accountId}/webproperties/{webPropertyId}/profiles/{profileId}/goals",
    gamanager.goals.get = "https://www.googleapis.com/analytics/v3/management/accounts/{accountId}/webproperties/{webPropertyId}/profiles/{profileId}/goals/{goalId}",

    # Custom Dimensions
    gamanager.dimensions.list = "https://www.googleapis.com/analytics/v3/management/accounts/{accountId}/webproperties/{webPropertyId}/customDimensions",
    gamanager.dimensions.create = "https://www.googleapis.com/analytics/v3/management/accounts/{accountId}/webproperties/{webPropertyId}/customDimensions",
    gamanager.dimensions.get = "https://www.googleapis.com/analytics/v3/management/accounts/{accountId}/webproperties/{webPropertyId}/customDimensions/{customDimensionId}",

    # Custom Metrics
    gamanager.metrics.list = "https://www.googleapis.com/analytics/v3/management/accounts/{accountId}/webproperties/{webPropertyId}/customMetrics",
    gamanager.metrics.create = "https://www.googleapis.com/analytics/v3/management/accounts/{accountId}/webproperties/{webPropertyId}/customMetrics",
    gamanager.metrics.get = "https://www.googleapis.com/analytics/v3/management/accounts/{accountId}/webproperties/{webPropertyId}/customMetrics/{customMetricId}"
  )
  toset <- !(names(op.gamanager) %in% names(op))
  if (any(toset)) options(op.gamanager[toset])

  invisible()
}
