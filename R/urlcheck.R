#' Check all GitHub URLs, and remove contributions with invalid URLs.
#'
#' @param ctbs 'data.frame' returned from \link{get_contributors} function,
#' including "logins" column of GitHub login names.
#' @param quiet If `FALSE`, display progress information on screen.
#' @return Potentially modified version of 'ctbs', with any invalid logins
#' removed.
#'
#' @note This is modified from \pkg{urlchecker} code in 'R/parallel.R'.
#' @noRd
check_github_urls <- function (ctbs, quiet = FALSE) {

    urls <- paste0 ("https://github.com/", ctbs$logins)
    hs <- vector ("list", length (urls))
    pool <- curl::new_pool ()

    tok <- get_gh_token ()

    if (!quiet) {
        cat (cli::col_cyan (cli::symbol$star), " Checking GitHub URLs")
        utils::flush.console ()
    }

    for (i in seq_along (hs)) {

        u <- urls [i]
        h <- curl::new_handle (url = u)
        curl::handle_setopt (
            h,
            nobody = TRUE,
            cookiesession = 1L,
            followlocation = 1L,
            http_version = 2L,
            ssl_enable_alpn = 0L
        )

        if (nzchar (tok)) {
            curl::handle_setheaders (h, "Authorization" = paste ("token", tok))
        }
        handle_result <- local ({
            i <- i
            function (x) {
                hs [[i]] <<- x
            }
        })
        handle_error <- local ({
            i <- i
            function (x) {
                hs [[i]] <<- structure (
                    list (message = x),
                    class = c ("curl_error", "error", "condition")
                )
            }
        })
        curl::multi_add (
            h,
            done = handle_result,
            fail = handle_error,
            pool = pool
        )
    }
    chk <- tryCatch (
        curl::multi_run (pool = pool),
        error = function (e) NULL
    )
    # Retry request on fail:
    if (is.null (chk)) {
        n_retries <- 3L
        n_actual <- 1L
        while (n_actual <= n_retries && is.null (chk)) {
            Sys.sleep (1)
            chk <- tryCatch (
                curl::multi_run (pool = pool),
                error = function (e) NULL
            )
            n_actual <- n_actual + 1
        }
    }
    if (is.null (chk)) {
        if (!quiet) {
            message (
                "\r", cli::col_green (cli::symbol$cross),
                " Checking GitHub URLs failed; ",
                "contributors will be added regardless"
            )
        }
        return (ctbs)
    }

    if (!quiet) {
        message (
            "\r", cli::col_green (cli::symbol$tick),
            " Checked GitHub URLs    "
        )
    }

    out <- vector ("list", length (hs))
    for (i in seq_along (out)) {
        if (inherits (hs [[i]], "error")) {
            out [[i]] <- -1L
        } else if ("status_code" %in% names (hs [[i]])) {
            out [[i]] <- hs [[i]]$status_code
        }
    }
    index <- which (unlist (out) != 404)

    return (ctbs [index, ])
}

get_gh_token <- function (token = "") {

    tryCatch (
        gitcreds::gitcreds_get ()$password,
        error = function (e) ""
    )
}
