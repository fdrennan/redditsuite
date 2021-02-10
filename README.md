
<!-- README.md is generated from README.Rmd. Please edit that file -->

# redditsuite

``` r
devtools::install_github('fdrennan/redditsuite')
#> Downloading GitHub repo fdrennan/redditsuite@HEAD
#> crayon (1.3.4 -> 1.4.1) [CRAN]
#> cli    (2.2.0 -> 2.3.0) [CRAN]
#> tibble (3.0.5 -> 3.0.6) [CRAN]
#> withr  (2.4.0 -> 2.4.1) [CRAN]
#> dplyr  (1.0.3 -> 1.0.4) [CRAN]
#> dbplyr (2.0.0 -> 2.1.0) [CRAN]
#> Installing 6 packages: crayon, cli, tibble, withr, dplyr, dbplyr
#> Installing packages into '/Users/fdrennan/Desktop/redditsuite/renv/library/R-4.0/x86_64-apple-darwin17.0'
#> (as 'lib' is unspecified)
#> 
#> The downloaded binary packages are in
#>  /var/folders/9b/rv2xsyvj7nq4483x88fc_ks00000gn/T//RtmpkSOQ2W/downloaded_packages
#>      checking for file ‘/private/var/folders/9b/rv2xsyvj7nq4483x88fc_ks00000gn/T/RtmpkSOQ2W/remotes5b2b60b505d9/fdrennan-redditsuite-f930ec1/DESCRIPTION’ ...  ✓  checking for file ‘/private/var/folders/9b/rv2xsyvj7nq4483x88fc_ks00000gn/T/RtmpkSOQ2W/remotes5b2b60b505d9/fdrennan-redditsuite-f930ec1/DESCRIPTION’ (499ms)
#>   ─  preparing ‘redditsuite’:
#>      checking DESCRIPTION meta-information ...  ✓  checking DESCRIPTION meta-information
#>   ─  checking for LF line-endings in source and make files and shell scripts
#>   ─  checking for empty or unneeded directories
#>   ─  building ‘redditsuite_0.2.0.tar.gz’
#>      
#> 
#> Installing package into '/Users/fdrennan/Desktop/redditsuite/renv/library/R-4.0/x86_64-apple-darwin17.0'
#> (as 'lib' is unspecified)
```

    library(reticulate)
    install_miniconda()
    py_install(c('boto3', 'praw'))
