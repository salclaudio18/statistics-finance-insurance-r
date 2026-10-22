# Run from the repository root: Rscript scripts/render.R [html|pdf]
args <- commandArgs(trailingOnly = TRUE)
target <- if (length(args)) args[[1]] else "html"
if (!target %in% c("html", "pdf")) stop("Use html or pdf.")
if (!file.exists("analysis.Rmd")) stop("Run this command from the repository root.")
if (!requireNamespace("rmarkdown", quietly = TRUE)) {
  stop("Install dependencies first: Rscript scripts/install_packages.R")
}
if (!rmarkdown::pandoc_available()) stop("Pandoc is required. Use RStudio or install Pandoc.")
dir.create("reports", showWarnings = FALSE)
rmarkdown::render(
  input = "analysis.Rmd",
  output_format = if (target == "pdf") "pdf_document" else "html_document",
  output_dir = "reports",
  knit_root_dir = normalizePath("."),
  envir = new.env(parent = globalenv())
)
