# Re-render the technical reports on demand and place their outputs where
# pkgdown serves them (pkgdown/assets/articles/).
#
# These reports are deliberately OUTSIDE the pkgdown build path: `build_site()`
# never recompiles them. You regenerate them here only when their inputs change,
# commit the refreshed output, then rebuild the site as normal.
#
# Requirements (these run real model code, hence the manual/local step):
#   - stapmr, smktrans, hseclean installed locally
#   - a LaTeX engine for the PDF reports (tinytex::install_tinytex() if needed)
#
# Usage:
#   source("reports/render_reports.R")
#   render_report("PAF_methodology_report.Rmd")   # just the one you changed
#   render_all()                                   # or refresh all three

render_report <- function(rmd,
                          src_dir = "reports",
                          dest    = "pkgdown/assets/articles") {

  # crayon's ANSI colour codes end up as U+001B in captured output and break
  # LaTeX; disabling them is what fixes the "Unicode character ^^[" error.
  old <- options(crayon.enabled = FALSE)
  on.exit(options(old), add = TRUE)

  dir.create(dest, recursive = TRUE, showWarnings = FALSE)

  # render in a clean environment so reports can't leak state into each other
  out <- rmarkdown::render(file.path(src_dir, rmd),
                           quiet = TRUE, envir = new.env())

  # copy the rendered output (and any *_files dir for HTML) into the served folder
  file.copy(out, dest, overwrite = TRUE)
  files_dir <- sub("\\.[^.]+$", "_files", out)
  if (dir.exists(files_dir)) {
    unlink(file.path(dest, basename(files_dir)), recursive = TRUE)  # clear stale
    file.copy(files_dir, dest, recursive = TRUE)
  }

  # keep the source folder clean: remove the build artefacts left next to the .Rmd
  unlink(c(out, files_dir), recursive = TRUE)

  message("Updated: ", file.path(dest, basename(out)))
  invisible(file.path(dest, basename(out)))
}

render_all <- function() {
  reports <- c(
    "Alcohol-attributable_diseases_and_dose-response_curves.Rmd",
    "PAF_methodology_report.Rmd",
    "Smoking_and_the_risks_of_adult_diseases.Rmd"
  )
  invisible(lapply(reports, render_report))
}
