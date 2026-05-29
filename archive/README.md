# Archive — exploratory work behind *The Geographic Determinism of Complex Tone*

This directory preserves the substantive exploratory notebooks, the early data pipeline,
and the raw source data that fed into the final paper (`../final-paper.Rmd`). None of this
material lives in the reproducible pipeline; it is kept as a record of how the analysis
developed.

The work passed through three title eras, which is a useful way to date a notebook:

1. **"Tonal Languages"** (earliest) — `source-data/`, `data-pipeline/data.R`,
   `modeling/model-*`, `narrative/error_analysis_manual.Rmd`. Built on a `wrangle_data()`
   pipeline reading the raw `tone.tsv`.
2. **"MA576 Project: The Geography of Tonal Languages"** (middle) — most analysis notebooks.
3. **"The Geographic Determinism of Complex Tone"** (final) — `humidity-statistic/statistic.Rmd`,
   `survival/survival.Rmd`, `survival/H-survival.Rmd`.

## Reproducibility caveat

These notebooks are **reference-only** — they are not wired into the knit pipeline and will
not run as-is. They source the original flat layout (`source("data.R")`, `read_tsv("tone.tsv")`,
etc.) rather than the clean repo's `R/` structure, and a few reference large humidity grids
that were intentionally not archived (see *Excluded* below). The reproducible artifact is the
top-level `final-paper.Rmd` + `R/` scripts. Rendered `.pdf` snapshots are included next to a
notebook where one existed, so the output is readable without re-running.

## Contents

### `source-data/`
The raw inputs underneath every processed `data/*.csv`.
| File | What it is |
|---|---|
| `tone.tsv` | Raw WALS tonality export — WALS code, language, value, description, lat/long, genus, family, area. |
| `cited-data.txt` | WALS citation / provenance (Maddieson 2013 "Tone"; Dryer & Haspelmath, WALS Online v2020.3, Zenodo doi:10.5281/zenodo.7385533). |

### `data-pipeline/`
Early development of the data-wrangling layer.
| File | What it is |
|---|---|
| `data.R` | Early pipeline: `wrangle_data(data_raw, scheme)` supporting "complex" and "any_tonal" tonality schemes, reading raw `tone.tsv`. Predates the clean repo's `R/data.R` (which reads pre-built CSVs). |
| `explore-hum.Rmd` | Humidity exploratory data analysis. |
| `humidity.Rmd` (+ `.pdf`) | Development of the NCEP/NCAR humidity-grid wrangling. |
| `match-humidity.Rmd` | Matching the humidity grid to language coordinates. |

### `modeling/`
Model-specification experiments — response choice and link functions.
| File | What it is |
|---|---|
| `model-any_tonal.Rmd` (+ `.pdf`) | Earliest model: `is_tonal ~ dist_equator` with probit / logit / transformed-probit link comparison, residuals, dispersion. |
| `model-MH.Rmd` | Mean-humidity (MH) predictor model. |
| `model-complex.Rmd` (+ `.pdf`) | Complex-tonality response model. |
| `mean-sd-model.Rmd` | Standard-deviation-as-predictor experiment. |
| `fitted-values.Rmd` | Fitted-value / model diagnostics. |
| `results.Rmd` | Results tables. |
| `model-dump.Rmd` | Assorted model scratch. |

### `humidity-statistic/`
Development of the humidity summary statistic used in the paper.
| File | What it is |
|---|---|
| `statistic.Rmd` | The humidity score statistic (k-SD / upper-quantile). |
| `window-models.Rmd` | Quantile-window statistic models. |

### `distribution-shape/`
| File | What it is |
|---|---|
| `skewness.Rmd` | Humidity-skewness analysis (made it into the paper). |
| `skewness-and-kurtosis.Rmd` | Fuller version carrying the **kurtosis** analysis that was cut from the final paper. |

### `family-argument/`
The language-family confound — the paper's accommodation argument.
| File | What it is |
|---|---|
| `family-explanation.Rmd` | Language-family confound argument. |
| `family-exp-Qs.Rmd` | Open questions / working notes on the family argument. |

### `survival/`
The null survival model over the aridity axis.
| File | What it is |
|---|---|
| `survival.Rmd` (+ `.pdf`) | The aridity-axis survival model (final-era). |
| `H-survival.Rmd` (+ `.pdf`) | Humidity survival-model exploration. |
| `H-.Rmd` | Humidity scratch. |

### `bootstrap/`
| File | What it is |
|---|---|
| `bootstrap.Rmd` | Bootstrap resampling of an under-represented mean-humidity band (MH ≈ 0.7–1.1), family-indicator experiments, and rejected statistics (min/max ratio, variance interactions). |
| `bootstrap-clean.Rmd` | Trimmed version of the above. |

### `narrative/`
| File | What it is |
|---|---|
| `error_analysis_manual.Rmd` (+ `.pdf`) | Written narrative on manual error analysis: outlier/threshold reasoning, sociopolitical factors (Thailand / French Indochina), a 30°-latitude cutoff. The conceptual seed of the family-accommodation argument. |
| `words-old-version.Rmd` | Early full-prose draft of the paper. |

## Excluded (intentionally not archived)

- **Timestamped final-paper drafts** (`final-may14-230pm`, `final-paper-may17-3am`,
  `final-paper-may1712am`, `finalpaper-may158pm`, root `final-paper.Rmd` duplicate,
  `final-dump/final-paper02.Rmd`, `versions-final/final-paper-0.Rmd`,
  `trash/final-paper-old.Rmd`) — version churn; git history holds the final.
- **Large humidity grids** — `humidity.tsv` (218M raw NCEP/NCAR), `humidity500.csv` (310M),
  `humidity890.csv` (552M). Regeneration is documented in `../R/humidity.R`.
- **Processed CSVs already in `../data/`** — `tonal_df*.csv`, `tonalQ_df.csv`, `skewness.csv`,
  `kurt.csv`, `tonal_df_M.csv`, `tonal_df_stats.csv`.
- **Templates, `tmp-pdfcrop` `.tex`, and duplicate full-paper PDFs** (`compton.pdf`,
  `is_ton.pdf`, `final-paper copy.pdf`).
