<!-- README.md is generated from README.Rmd. Please edit that file -->

<!-- badges: start -->

[![R build
status](https://github.com/mpadge/allcontributor/workflows/R-CMD-check/badge.svg)](https://github.com/mpadge/allcontributor/actions?query=workflow%3AR-CMD-check)
[![Project Status:
Concept](https://www.repostatus.org/badges/latest/concept.svg)](https://www.repostatus.org/#concept)
<!-- badges: end -->

Acknowledge all contributors in your ‘README’. Just an alternative
implementation in R of the original
[`all-contributors`](https://github.com/all-contributors/all-contributors),
but at the moment restricted to automatic addition of direct code
contributors only.

## Why then?

Just so you can do this in R, without otherwise having to install the
`all-contributions` Bot on github, or the javascript client locally.

## Installation

Currently only on github, so package must be installed with

``` r
remotes::install_github("mpadge/allcontributor")
```

The package can then be loaded the usual way:

``` r
library (allcontributor)
```

## Usage

The primary function of the package,
[`add_contributors()`](https://mpadge.github.io/allcontributor/reference/add_contributors.html),
adds a table of all contributors to the main `README.md` file (and
`README.Rmd` if that exists). Tables can be added to other files by
specifying the `files` argument of that function.

Contribution data are obtained by querying the github API, for which a
local key should be set as an environmental variable containing the name
`"GITHUB"` (either via `Sys.setenv()`, or as an equivalent entry in a
file `~/.Renviron`). The data used to construct the contributions table
can be extracted without writing to the `README` file(s) with the
function
[`get_contributors()`](https://mpadge.github.io/allcontributor/reference/get_contributors.html):

``` r
get_contributors(org = "mpadge", repo = "allcontributor")
#>   logins contributions                                              avatars
#> 1 mpadge            17 https://avatars1.githubusercontent.com/u/6697851?v=4
```

If the main `README` file(s) contains a markdown section entitled
`"Contributors"`, the
[`add_contributors()`](https://mpadge.github.io/allcontributor/reference/add_contributors.html)
function will add a table of contributors will there, otherwise it will
be appended to the end of the document(s). If you wish your contributors
table to be somewhere other than at the end of the `README` file(s),
start by adding an empty `"## Contributors` section to the file(s) and
the function will insert the table at that point.

## Contributors

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->

<!-- prettier-ignore-start -->

<!-- markdownlint-disable -->

This project follows the [all-contributors](https://allcontributors.org)
specification. Contributions of any kind are welcome\!

<table>

<tr>

<td align="center">

<a href="https://github.com/mpadge">
<img src="https://avatars1.githubusercontent.com/u/6697851?v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/mpadge/allcontributor/commits?author=mpadge">mpadge</a>

</td>

</tr>

</table>

<!-- markdownlint-enable -->

<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->
