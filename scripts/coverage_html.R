coverage_output <- covr::package_coverage(
    quiet = FALSE,
    clean = FALSE,
)
covr::report(
    coverage_output,
    file = 'coverage_html/index.html',
    browse =  FALSE
)

markdown <- function(x, group = c("filename", "functions"), by = "line", ...) {
    if (length(x) == 0) {
        return(invisible(x))
    }
    group <- match.arg(group)
    df <- covr::tally_coverage(x, by = by)

    if (!NROW(df)) {
        return(invisible(x))
    }
    percents <- tapply(
        df$value, df[[group]],
        FUN = function(x) (sum(x > 0) / length(x)) * 100
    )
    overall_percentage <- covr::percent_coverage(df, by = by)
    paste0(
        "|file|percents|\n|----|----|\n",
        paste0("|Overall|", format(overall_percentage, digits = 4), "%|\n"),
        paste0("|", names(percents), "|", format(percents, digits = 4), "%|", collapse = "\n"),
        "\n"
    )
    }
    coverage_output_markdown <- markdown(coverage_output)
    # log output to $GITHUB_STEP_SUMMARY
    gh <- "# Coverage Summary Report"
    gh <- paste(gh, coverage_output_markdown, sep="\n")
    gh <- paste(gh, "View the interactive report by downloading the artifact.", sep="\n")
    # Get system information
    sys_info <- Sys.info()
    is_linux <- sys_info["sysname"] == "Linux"
    if (is_linux) {
    write(gh, file=Sys.getenv("GITHUB_STEP_SUMMARY"))
}
