<!-- README.md is generated from README.Rmd. Please edit that file -->
<!-- badges: start -->

[![R build
status](https://github.com/ropensci/allcontributors/workflows/R-CMD-check/badge.svg)](https://github.com/ropensci/allcontributors/actions?query=workflow%3AR-CMD-check)
[![codecov](https://app.codecov.io/gh/ropensci/allcontributors/branch/master/graph/badge.svg)](https://app.codecov.io/gh/ropensci/allcontributors)
[![Project Status:
Concept](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![CRAN_Status_Badge](https://www.r-pkg.org/badges/version/allcontributors)](https://cran.r-project.org/package=allcontributors/)
[![CRAN
Downloads](https://cranlogs.r-pkg.org/badges/grand-total/allcontributors?color=orange)](https://cran.r-project.org/package=allcontributors)
<!-- badges: end -->

An alternative implementation in R of the original
[`all-contributors`](https://allcontributors.org/) to acknowledge all
contributors in your ‘README’ (or elsewhere). The original is intended
to help acknowledge *all* contributions including those beyond the
contents of an actual repository, such as community or other or
less-tangible organisational contributions. This version only
acknowledges tangible contributions to a repository, but automates that
task to a single function call, in the hope that such simplicity will
spur greater usage. In short: This package can’t do everything the
original does, but it makes what it does much easier.

## Why then?

The original [`all-contributors`](https://allcontributors.org/) is
primarily a bot which responds to commit messages such as
`add @user for <contribution>`, where `<contribution>` is one of the
[recognized types](https://allcontributors.org/docs/en/emoji-key). As
said above, the relative advantage of that original system lies
primarily in the diversity of contribution types able to be
acknowledged, with each type for a given user appearing as a
corresponding [emoji](https://allcontributors.org/docs/en/emoji-key)
below their github avatar as listed on the README. In comparison, this R
package:

1.  Works automatically, by calling `add_contributors()` at any time to
    add or update contributor acknowledgements.
2.  Works locally without any bot integration
3.  Can add contributors to any file, not just the main README
4.  Offers a variety of formats for listing contributors:
    1)  divided into sections by types of contributions, or as a single
        section
    2)  presented as full grids (like [the
        original](https://github.com/all-contributors/all-contributors/blob/master/README.md#contributors-)),
        numbered lists of github user names only, or single text strings
        of comma-separated names.

## Installation

The package is on CRAN, and can be installed with,

``` r
install.packages ("allcontributors")
```

Alternatively, a development version can be installed by enabling the
“ropensci” repository from
[r-universe](https://ropensci.r-universe.dev):

``` r
options (repos = c (
    ropensci = "https://ropensci.r-universe.dev",
    CRAN = "https://cloud.r-project.org"
))
```

The `install.packages()` command will then install the development
version. Alternatively, any of the following options may be used for
those who prefer not to use GitHub:

``` r
# install.packages("remotes")
remotes::install_git ("https://git.sr.ht/~ropensci/allcontributors")
remotes::install_git ("https://codeberg.org/mpadge/allcontributors")
remotes::install_bitbucket ("mpadge/allcontributors")
remotes::install_gitlab ("mpadge/allcontributors")
remotes::install_github ("mpadge/allcontributors")
```

The package can then be loaded the usual way:

``` r
library (allcontributors)
```

## Usage

The primary function of the package,
[`add_contributors()`](https://docs.ropensci.org/allcontributors/reference/add_contributors.html),
adds a table of all contributors by default to the main `README.md` file
(and `README.Rmd` if that exists). Tables or lists can be added to other
files by specifying the `files` argument of that function. The
appearance of the contributors table is determined by several parameters
in that function, including:

1.  `type` For the type of contributions to include (code, contributors
    who open issues, contributors who discuss issues).
2.  `num_sections` For whether to present contributors in 1, 2, or 3
    distinct sections, dependent upon which `type`s of contributions are
    to be acknowledged.
3.  `format` Determining whether contributors are presented in a grid
    with associated avatars of each contributor, as in [the
    original](https://github.com/all-contributors/all-contributors/blob/master/README.md#contributors-),
    an enumerated list of github user names only, or a single text
    string of comma-separated names.

Contribution data are obtained by querying the github API, for which a
local key should be set as an environmental variable containing the name
`"GITHUB"` (either via `Sys.setenv()`, or as an equivalent entry in a
file `~/.Renviron`).

If the main `README` file(s) contains a markdown section entitled
`"Contributors"`, the
[`add_contributors()`](https://docs.ropensci.org/allcontributors/reference/add_contributors.html)
function will add a table of contributors there, otherwise it will be
appended to the end of the document(s). If you wish your contributors
table to be somewhere other than at the end of the `README` file(s),
start by adding an empty `"## Contributors` section to the file(s) and
the function will insert the table at that point.

Any time you wish to update your contributor list, simply re-run the
`add_contributors()` function. There’s even an `open_issue` parameter
that will automatically open or update a github issue on your repository
so that contributors will be pinged about them being added to your list
of contributors.

The data used to construct the contributions table can also be extracted
without writing to the `README` file(s) with the function
[`get_contributors()`](https://docs.ropensci.org/allcontributors/reference/get_contributors.html):

``` r
get_contributors (org = "ropensci", repo = "allcontributors")
```

    #> ✔  Extracted code contributors
    #> ✔  Extracted github issue contributors
    #> ✔  Downloaded GitHub URLs
    #>       logins contributions
    #> 1     mpadge           176
    #> 2     maelle            NA
    #> 3 shamindras            NA
    #> 4 assignUser            NA
    #>                                                                                            avatar
    #> 1                                             https://avatars.githubusercontent.com/u/6697851?v=4
    #> 2  https://avatars.githubusercontent.com/u/8360597?u=824f03caa87c92420352e3dd9a05470320a67412&v=4
    #> 3  https://avatars.githubusercontent.com/u/7627188?u=d05fb551796e6ce6db64ae43cd8ce48a0217ef85&v=4
    #> 4 https://avatars.githubusercontent.com/u/16141871?u=bbf2ca4641e8ec034a9cdb583e62e3a94c372824&v=4
    #>            type
    #> 1          code
    #> 2 issue_authors
    #> 3 issue_authors
    #> 4 issue_authors

## Updating Contributor Acknowledgements

“Contributors” sections of files will be automatically updated to
reflect any new contributions by simply calling
[`add_contributors()`](https://docs.ropensci.org/allcontributors/reference/add_contributors.html).
If your contributors have not changed then your lists of
acknowledgements will not be changed. The
[`add_contributors()`](https://docs.ropensci.org/allcontributors/reference/add_contributors.html)
function has an additional parameter which may be set to
`force_update = TRUE` to force lists to be updated regardless of whether
contributions have changed. This can be used to change the formats of
acknowledgements at any time. If anything goes wrong, the easiest way to
replace a contributions section is to simply delete the old ones from
all files, and call
[`add_contributors()`](https://docs.ropensci.org/allcontributors/reference/add_contributors.html)
again.

## More Information

The package has a [single
vignette](https://docs.ropensci.org/allcontributors/articles/allcontributors.html)
which visually demonstrates the various formats in which an
“allcontributors” section can be presented.

## Code of Conduct

Please note that this package is released with a [Contributor Code of
Conduct](https://ropensci.org/code-of-conduct/). By contributing to this
project, you agree to abide by its terms.

## Contributors




<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->

All contributions to this project are gratefully acknowledged using the [`allcontributors` package](https://github.com/ropensci/allcontributors) following the [allcontributors](https://allcontributors.org) specification. Contributions of any kind are welcome!

### Code

<table>

<tr>
<td align="center">
<a href="https://github.com/mpadge">
<img src="https://avatars.githubusercontent.com/u/6697851?v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/ropensci/allcontributors/commits?author=mpadge">mpadge</a>
</td>
<td align="center">
<a href="https://github.com/chartgerink">
<img src="https://avatars.githubusercontent.com/u/2946344?v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/ropensci/allcontributors/commits?author=chartgerink">chartgerink</a>
</td>
<td align="center">
<a href="https://github.com/maelle">
<img src="https://avatars.githubusercontent.com/u/8360597?v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/ropensci/allcontributors/commits?author=maelle">maelle</a>
</td>
<td align="center">
<a href="https://github.com/iantaylor-NOAA">
<img src="https://avatars.githubusercontent.com/u/4992918?v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/ropensci/allcontributors/commits?author=iantaylor-NOAA">iantaylor-NOAA</a>
</td>
<td align="center">
<a href="https://github.com/maurolepore">
<img src="https://avatars.githubusercontent.com/u/5856545?v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/ropensci/allcontributors/commits?author=maurolepore">maurolepore</a>
</td>
<td align="center">
<a href="https://github.com/milanmlft">
<img src="https://avatars.githubusercontent.com/u/38256462?v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/ropensci/allcontributors/commits?author=milanmlft">milanmlft</a>
</td>
<td align="center">
<a href="https://github.com/sbfnk">
<img src="https://avatars.githubusercontent.com/u/1156307?v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/ropensci/allcontributors/commits?author=sbfnk">sbfnk</a>
</td>
</tr>

</table>


### Issues

<table>

<tr>
<td align="center">
<a href="https://github.com/shamindras">
<img src="https://avatars.githubusercontent.com/u/7627188?u=d05fb551796e6ce6db64ae43cd8ce48a0217ef85&v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/ropensci/allcontributors/issues?q=is%3Aissue+author%3Ashamindras">shamindras</a>
</td>
<td align="center">
<a href="https://github.com/assignUser">
<img src="https://avatars.githubusercontent.com/u/16141871?u=b8095df6a10813031922a72335bd6579d5494c16&v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/ropensci/allcontributors/issues?q=is%3Aissue+author%3AassignUser">assignUser</a>
</td>
<td align="center">
<a href="https://github.com/RichardLitt">
<img src="https://avatars.githubusercontent.com/u/910753?u=a638615a7167b368f0c102aa2047cef15b0ce9cc&v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/ropensci/allcontributors/issues?q=is%3Aissue+author%3ARichardLitt">RichardLitt</a>
</td>
</tr>

</table>

<!-- markdownlint-enable -->
<!-- prettier-ignore-end -->
<!-- ALL-CONTRIBUTORS-LIST:END -->

