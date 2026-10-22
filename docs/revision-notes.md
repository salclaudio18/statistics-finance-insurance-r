# Portfolio revision notes

The original three-author report and R Markdown source are preserved without
changes under `reports/`. `analysis.Rmd` is a revised portfolio source.

## Changes to execution

- Replace the original Windows `setwd()` and case-inconsistent CSV paths with
  repository-relative paths; make `View()` calls interactive only.
- Add HTML output so LaTeX is not needed for the default rendering path.
- Keep housing seed 500; give the bank split an independent seed 501. Bank
  coefficients and metrics must be refreshed rather than copied from 2024.
- Select influential observations by row position (`which`), handle the case
  of no flagged observations, and make the cleaned-model formula actually use
  `clean_data`. The original explicit `train$...` formula bypassed that data.
- Define the Cook threshold using the number of predictors excluding the
  intercept, consistent with the stated `4 / (n - k - 1)` convention.
- Add housing test RMSE, MAE and R² for the reduced model in original units.
- Set the subscription class explicitly as positive in `confusionMatrix`.
- Add the majority-class baseline and calculate key summary metrics dynamically.
- Replace misleading default terminology with term-deposit subscription labels.
- Record session information in newly rendered reports.

## Interpretation corrections

1. **Original bank metrics.** The PDF confusion matrix has TN = 1,190,
   FP = 19, FN = 123 and TP = 25. For subscription as the positive class:
   accuracy = 89.54%, precision = 56.82%, recall = 16.89%, specificity = 98.43%.
   The always-negative baseline is 89.09%. The report mixed labels and values;
   the README uses measures recalculated from the displayed counts.
2. **Call duration.** This feature is observed after contact. The model cannot
   be presented as validated for selecting whom to call beforehand.
3. **In-sample versus holdout.** The original housing adjusted R² is a training
   fit statistic. Test performance is a separate quantity added in the revision.
4. **Transformed-model comparison.** The cleaned model changes the sample and
   applies square roots. Residual standard errors are on different scales and
   cannot establish an improvement by direct comparison. Influential points
   are not automatically data errors.
5. **OLS assumptions.** Zero mean of fitted OLS residuals with an intercept is
   an algebraic property, not a test of exogeneity. A residual plot cannot prove
   correct specification. Cross-sectional data can still exhibit dependence.
   Normality is not a Gauss–Markov assumption.
6. **Interpretation.** Regression associations do not establish that changing
   contact frequency, income or other predictors would cause the reported
   changes. McFadden's pseudo-R² is not explained variance.

## Validation performed

- Confirmed CSV dimensions, column names, class counts and absence of missing
  entries; checked that housing square-root inputs are positive.
- Confirmed exact byte preservation for both datasets and both original files.
- Read the original PDF's numerical output and confusion matrix.
- Checked local Markdown links, revised relative CSV paths, R Markdown fences,
  dependencies, archive contents and removal of the machine-specific path from
  the revised source.

## Review of the supplied R execution

The user subsequently supplied a complete rendered `analysis.html` from
R 4.5.2 on Windows 11. All expected model outputs, the corrected cleaned-data
fit, housing holdout scores, bank confusion matrix, ROC-AUC and `sessionInfo()`
are present. The preparation environment did not independently rerun R.
Warnings/messages were suppressed by the analysis setup, so the completed
HTML is not evidence that no package warnings occurred.

The corrected square-root fit uses 3,017 training observations (3,012 residual
degrees of freedom and five estimated coefficients), consistent with removal
of flagged rows from the original 3,178-row training set. Housing diagnostics
and the two bank evaluation methods were reviewed for numerical consistency.
The bank output explicitly treats subscription as the positive class.
The bank confusion matrix and ROC plot were visually inspected.

`analysis.Rmd` was taken from the user's uploaded source. One purely
explanatory sentence was corrected in both that source and the packaged HTML:
all confidence intervals in the reduced housing model, including the
intercept's interval, exclude zero. Computational code and rendered numerical
outputs were not changed. The original uploaded files remain untouched.

The README and `reports/metrics.json` now use the revised run. Rounded values
retain the precision printed by R; classification measures are also checked
directly from the displayed integer confusion counts. The original report's
AUC 0.8312 and the revised AUC 0.8518 use different bank splits and do not
support an improvement claim.

## Remaining limitations

Package versions are not pinned; the completed HTML records the observed
session. An `renv` lockfile should be generated from the actual R environment,
not invented from a report. Classification threshold selection, probability
calibration, robustness over repeated splits and a bank model without contact
duration remain extensions. Primary data provenance and individual author
contributions are unspecified in the supplied materials.
