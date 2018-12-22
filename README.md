
<!-- README.md is generated from README.Rmd. Please edit that file -->

# blizz

<!-- badges: start -->

[![Travis build
status](https://travis-ci.org/tyluRp/blizz.svg?branch=master)](https://travis-ci.org/tyluRp/blizz)
[![AppVeyor build
status](https://ci.appveyor.com/api/projects/status/github/tyluRp/blizz?branch=master&svg=true)](https://ci.appveyor.com/project/tyluRp/blizz)
[![Codecov test
coverage](https://codecov.io/gh/tyluRp/blizz/branch/master/graph/badge.svg)](https://codecov.io/gh/tyluRp/blizz?branch=master)
[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
<!-- badges: end -->

Minimalistic client to access [Blizzards
API](https://develop.battle.net/).

## Installation

You can install from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("tyluRp/blizz")
```

## Additional Setup

Installing the package alone isn’t enough to get started. You will need
to create a developer account at Blizzards new [dev
portal](https://develop.battle.net/). Once you’ve created an account, a
client needs to be made. Creating a client will produce a *Client ID*
and *Client Secret*. With these credentials you can simply run:

``` r
blizz_creds("your_client_id", "your_client_secret")
```

This will do a couple things:

1.  Store the Client ID and Secret in the `.Renviron` file. If you don’t
    have one, it’ll create one for you.
2.  Run a system command to produce an *auth code* which is then stored
    in `.Renviron`.

After this, you’re all set. If you want to avoid using `blizz_creds()`,
you can do all of this yourself by following the
[docs](https://develop.battle.net/documentation/guides/getting-started).

## Example

Use the `blizz()` function to access all API endpoints:

``` r
library(blizz)
library(tidyverse)
library(janitor)

# Here's one example of extracting the StarCraft II grandmaster ladder
blizz("/sc2/ladder/grandmaster/1") %>% 
  .[["ladderTeams"]] %>% 
  unnest() %>% 
  as_tibble() %>% 
  clean_names("snake") %>% 
  select(display_name, clan_tag, favorite_race, mmr, wins, losses, points)
#> # A tibble: 179 x 7
#>    display_name clan_tag favorite_race   mmr  wins losses points
#>    <chr>        <chr>    <chr>         <int> <int>  <int>  <int>
#>  1 DanielaAzu   <NA>     terran         6744    43     10    945
#>  2 Chammy       Scyth    zerg           6476    66     23   1714
#>  3 Astrea       PsiX     protoss        6410    59     24   1612
#>  4 scarlett     N0SCAM   protoss        6389    59     14   1494
#>  5 LiquidTLO    <NA>     zerg           6318    38     13    887
#>  6 NoWCSForU    N0SCAM   protoss        6288   180     40   2008
#>  7 puCK         ROOT     protoss        6259   233    134   2050
#>  8 JimRising    <NA>     zerg           6114   295    166   1923
#>  9 Connor       <NA>     zerg           6070    13      6    513
#> 10 Messi        <NA>     zerg           6035   103     20   1647
#> # ... with 169 more rows
```
