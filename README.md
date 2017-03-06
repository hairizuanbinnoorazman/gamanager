# gamanager

This package is wrapper around the Google Analytics Management API and it serves to allow anybody who knows R to quickly manage Google Analytics Management Settings.
Do note that the write APIs that surround the Google Analytics Management API is still in private beta and one would need to request for permssion in order to access the
required settings.

Some of the actions to manage the Google Analytics Management Settings can be managed with Scripts; e.g.

- Creating of Properties
- Creating of View

You can install the package by going through the following:

```
install.packages("devtools")
library(devtools)
devtools::install_github("hairizuanbinnoorazman/gamanager", build_vignettes = TRUE)
```

If you encounter a bug while using the package, take a screenshot of the error and file an issue on this repository.

## Status of package

This package is currently under construction
