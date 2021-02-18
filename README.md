
<!-- README.md is generated from README.Rmd. Please edit that file -->

# redditsuite

Git location per episode

## Episode 5

[Github Link](https://github.com/fdrennan/redditsuite/tree/episode-5)

Commands used in Episode 5

    wget https://raw.githubusercontent.com/fdrennan/redditsuite/dev-freeze-1/R/connection_postgres.R

## Episode 6

Tips for installing Reticulate

    install.packages('reticulate')
    library(reticulate)
    install_miniconda()
    # restart session
    py_config()
    py_install(c('praw', 'boto3'))
    # maybe restart
    import('praw')
    import('boto3')
