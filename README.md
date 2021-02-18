
<!-- README.md is generated from README.Rmd. Please edit that file -->

# redditsuite

Git location per episode

## Episode 5

[Github Link](https://github.com/fdrennan/redditsuite/tree/episode-5)

Commands used in Episode 5

```
wget https://raw.githubusercontent.com/fdrennan/redditsuite/dev-freeze-1/R/connection_postgres.R
```

## Episode 6

```
install.packages('reticulate')
library(reticulate)
install_miniconda()
# restart session
py_config()
py_install(c('praw', 'boto3'))
# maybe restart
import('praw')
import('boto3')
```

Inside your terminal, to get the `connection_reddit` function, run
the following command inside your `R` folder.

```
wget https://raw.githubusercontent.com/fdrennan/redditsuite/75381c7919edc7e9d459f98db67bec4ced644835/R/connection_reddit.R
```

```
random_password <- paste0(sample(c(letters, LETTERS, 0:9), 30, replace = TRUE), collapse = "")
```
