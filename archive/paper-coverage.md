# Archive coverage — how much of each subdirectory reached the final paper

For each archive subdirectory, this rates how much of its topic actually made it into
`../final-paper.Rmd` ("The Geographic Determinism of Complex Tone"). Ratings are anchored to
the paper's real section structure, not to how much effort the scratch work represents — a
topic can be a large body of exploration and still score low if it was ultimately cut.

**Scale**
- ★★★★★ **5/5** — core of the paper; a main contribution or foundational input, with its own section(s).
- ★★★★☆ **4/5** — substantially present in methods/discussion; some pieces dropped.
- ★★★☆☆ **3/5** — partially made it; a significant portion was cut.
- ★★☆☆☆ **2/5** — mostly superseded; only the underlying idea survived, not the content.
- ★☆☆☆☆ **1/5** — methodological dead-end; essentially absent from the final paper.

## Summary

| Subdirectory | Reached paper | Where it lives in the final paper |
|---|---|---|
| `humidity-statistic/` | ★★★★★ 5/5 | *Methods → Humidity Statistics*; *Results → k-SD Score Model* & *Window Quantile Model* |
| `survival/` | ★★★★★ 5/5 | *Methods → Null Survival Model*; *Results → Null Survival Models* |
| `source-data/` | ★★★★★ 5/5 | *The Data → Linguistic Data*; *References* |
| `modeling/` | ★★★★☆ 4/5 | *Methods → Logistic GLMs*; *Results → Logistic GLMs* |
| `data-pipeline/` | ★★★★☆ 4/5 | *The Data → Climate Data* & *Joining the Datasets* |
| `family-argument/` | ★★★★☆ 4/5 | *Methods → The Family Predictors*; *Results → Dispersion & Family Predictors* |
| `distribution-shape/` | ★★★☆☆ 3/5 | *Statistical Evidence* (skewness only) |
| `narrative/` | ★★☆☆☆ 2/5 | *Results → Dispersion & Family Predictors* (spirit only) |
| `bootstrap/` | ★☆☆☆☆ 1/5 | — (only the *authors'* resampling is recounted, in *Statistical Evidence*) |

## Detail

### `humidity-statistic/` — ★★★★★ 5/5
The paper's central original contribution. Both notebooks became dedicated sections:
`window-models.Rmd` → the **Quantile Window Statistic** $\mu^{(\delta)}_q$, and `statistic.Rmd`
→ the **k-SD Score Statistic** $\widetilde{H}_k = \mu_H + k\sigma_H$. Each gets a *Methods*
definition and a full *Results* subsection (deviance/dispersion vs. the extremity parameter).
Nothing of substance here was cut.

### `survival/` — ★★★★★ 5/5
The paper's second main contribution. `survival.Rmd` (final-era title) is the **null survival
model** over an aridity axis — *Methods → Null Survival Model* and *Results → Null Survival
Models*, with the Kaplan–Meier CDF plot and the three relative-aridity indices (MD, UDI, XDI).
`H-survival.Rmd` / `H-.Rmd` are the earlier humidity-survival exploration that fed into it.

### `source-data/` — ★★★★★ 5/5
Foundational input rather than an "analysis." `tone.tsv` is the raw WALS export underneath
every `data/tonal_df*.csv`; the paper describes it in *The Data → Linguistic Data* (n = 527;
Family / Latitude-Longitude / Tonality Type), and `cited-data.txt`'s sources (Dryer &
Haspelmath 2011; Maddieson 2011) appear verbatim in *References*. Note the paper consumes the
**wrangled** CSV, not this raw `.tsv` directly.

### `modeling/` — ★★★★☆ 4/5
The logistic-GLM machinery is the heart of the paper. **Made it:** `model-complex.Rmd` (the
`complex_tonal` response), `model-MH.Rmd` (mean-humidity baseline = the $k=0$ case),
`mean-sd-model.Rmd` (the $\sigma_H$ term inside the k-SD score), `fitted-values.Rmd` (the
Pearson-residual / fitted-value reasoning in *Dispersion*), and `results.Rmd` (*Results
Overview*s). **Cut:** `model-any_tonal.Rmd` — the early `is_tonal ~ dist_equator` response was
abandoned for complex-only (only the equator-distance EDA scatter survived); `model-dump.Rmd`
is scratch.

### `data-pipeline/` — ★★★★☆ 4/5
The join methodology is described explicitly: `nearest_coords()` and the per-language
`hum_statistic()` loop appear as pseudocode in *Joining the Datasets*, and `humidity.Rmd`'s
grid wrangling becomes *Climate Data* (94×192 grid, ~888 months, 16M rows) plus the overlay
map. **Cut/superseded:** the early `data.R` `wrangle_data(scheme=...)` kept only its "complex"
scheme (the "any_tonal" scheme was dropped), and that prototype was rewritten as the clean
`R/` scripts.

### `family-argument/` — ★★★★☆ 4/5
Woven through the abstract, *Methods → The Family Predictors*, and *Results → Dispersion &
Family Predictors*: the three contraindicating families (Austronesian, Austro-Asiatic,
Trans-New Guinea / Papuan) and the "accommodation through outlier status" framing all made it.
Held back from 5/5 only because the paper itself leaves the predictors' proper inclusion as an
explicitly **open / inconclusive** question.

### `distribution-shape/` — ★★★☆☆ 3/5
Split outcome. **Skewness made it** and is genuinely load-bearing: $\text{corr}(\mu_H,
\text{skew}_H) = -0.71$ motivates the entire upper-quantile investigation in *Statistical
Evidence* (with the `skewness_scatterplot`), and negative skew reappears in the dispersion
argument. **Kurtosis was cut entirely** — the paper never mentions it, so everything unique to
`skewness-and-kurtosis.Rmd`'s kurtosis half is archive-only.

### `narrative/` — ★★☆☆☆ 2/5
The *spirit* survived, not the text. `error_analysis_manual.Rmd`'s outlier-accommodation
reasoning is the conceptual seed of the family-predictor argument (isolation, genealogical
clustering, population-size confounds in *Dispersion & Family Predictors*). But its specific
content — the `is_tonal ~ dist_equator` outliers, the 30°-latitude cutoff, the named regions
(Thailand / French Indochina) — did not make it, and `words-old-version.Rmd` is an early full
draft superseded by the final prose.

### `bootstrap/` — ★☆☆☆☆ 1/5
Essentially absent. The only resampling in the paper (*Statistical Evidence*, the
89/88/43/49% percentile figures) is a recount of **Everett & Moran's own** method, not this
work. The scratch bootstrap — resampling the under-represented MH ≈ 0.7–1.1 band, and the
rejected statistics (min/max ratio, variance interactions) — appears nowhere in the final
paper. Its value was indirect: screening that helped *reject* candidate statistics before the
k-SD and quantile-window statistics were settled on.
