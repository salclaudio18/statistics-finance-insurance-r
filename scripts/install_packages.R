# Run from the repository root: Rscript scripts/install_packages.R
packages <- c("rmarkdown", "knitr", "readr", "corrplot", "ggplot2", "cowplot",
              "lmtest", "car", "sandwich", "GGally", "pscl", "caret", "ROCR", "dplyr")
missing <- packages[!vapply(packages, requireNamespace, logical(1), quietly = TRUE)]
if (length(missing)) install.packages(missing, repos = "https://cloud.r-project.org")
cat("Dependencies checked. Versions are not locked.\n")
