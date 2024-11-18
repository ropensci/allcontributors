# v0.2.2.00X (Current development version)

## Major changes

- Added a [GitHub workflow](https://github.com/ropensci/allcontributors/blob/main/.github/workflows/allcontributors.yml) to automatically run `add_contributors()`

## Minor changes

- Updated documentation to described different ways of keeping allcontributors lists up-to-date (#15; thanks to @maelle)

---

# v0.2.2

## Major changes

- Repository transferred from `ropenscilabs/allcontributors` -> `ropensci/allcontributors`.

## Minor changes

- Fix URL check to only remove 404s; #45, #46 thanks to @maelle
- Replace previous explicit REST API calls with `gh`; #44 thanks to @maelle
- Fix bug #40 when "Contributors" sub-section title is last line of file; thanks to @sbfnk
- Fix bug #42 with Rest API calls for code contributions; thanks to @maelle

---

# v0.2.0

## Major changes

- `add_contributors()` now accepts main `repo` parameter as a vector of repository locations to be used to collate a single allcontributors list; thanks to @chartgerink via #35.
- Chris Hartgerink (@chartgerink) added as new author; thanks to both #35 and #37

## Minor changes

- Add a rate limit checker for the GitHub API calls. Will warn if rate limit is exceeded (thanks to @chartgerink via #37).
- Expose `check_urls' parameter in main `add_contributors` function, to allow that to be switched off (thanks to @sbfnk via #38).
- Add error handling to the URL checking function so failures do not cause function errors (also thanks to @sbfnk via #38).

---

# v 0.1.1

- Fix bug in issue contributors when github account no longer exists

---

# v 0.1.0

## Major changes:

- Add new `exclude_labels` and `exclude_issues` parameters to main functions

## Minor changes:

- Add `_pkgdown` file for function reference topics
