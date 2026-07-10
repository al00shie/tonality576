# Polish log — `final-paper.Rmd`

Continuously updated record of the autonomous polish loop. Each iteration is a batch of edits
**gated on a successful knit**, then committed and pushed as a reversible checkpoint.

**Revert anchors**

| Action | Command |
|---|---|
| Undo *everything* back to pre-polish | `git reset --hard pre-polish` |
| Undo one iteration | `git revert <its commit>` |
| Return to the state before iteration *N* | `git reset --hard <"Revert to" sha of iteration N>` |

> Diff hunks below are **phrase-level excerpts**, not raw `git diff` output: the paper stores
> each paragraph as one very long line, so a literal line-diff would be unreadable. The
> authoritative diff is always `git show <commit>`.

---

## Iteration 1 — Orthography & attribution

| | |
|---|---|
| **Knit gate** | ✅ green — exit 0, 18 pp, 2,400,160 B |
| **Touches claims** | ❌ no — spelling and naming only |
| **Revert to** | `b094232` |

Six corrections: five spelling, one attribution-consistency.

```diff
@@ L60 · Abstract @@
- ...a positive correlation between reigonal humidity and the emergence...
+ ...a positive correlation between regional humidity and the emergence...

- ...a null survival model to illustrate the dissappearence of complex tonality...
+ ...a null survival model to illustrate the disappearance of complex tonality...

- ...which suggests accomodation through outlier status.
+ ...which suggests accommodation through outlier status.

@@ L85 · Background › Physiology of Phonation @@
- ...fundamental frequency, or the lowest sounding pitch, of vocal chords.
+ ...fundamental frequency, or the lowest sounding pitch, of vocal cords.

@@ L107 · The Data @@
- ## Lingustic Data
+ ## Linguistic Data

@@ L358 · Conclusion @@
- ...further explore and support the hypothesis laid out by Everett and Roberts.
+ ...further explore and support the hypothesis laid out by Everett and Moran.
```

**Notes**

- `vocal chords` → `vocal cords`. The *same sentence* already read "vocal cord physiology,"
  so the document contradicted itself within one line. This is a domain error, not just a
  typo — vocal cords are anatomy; chords are music.
- `Everett and Roberts` → `Everett and Moran`. The body uses "Everett and Moran" five times;
  the conclusion was the lone outlier. The full three-author form
  (Everett, Moran & Roberts, 2015) remains correct and untouched in *References*.

---

## Iteration 2 — Draft artifacts: `//` fragments and paragraph structure

| | |
|---|---|
| **Knit gate** | ✅ green — exit 0, **19 pp** (was 18), 2,400,544 B |
| **Touches claims** | ❌ no — finishes existing sentences; one terminology correction |
| **Revert to** | `90d04e5` |

Four `//` marks — the author's own inline TODO separators — were shipped in the final prose.
Removed, and the fragments they separated were completed into sentences. Separately, lines
290–293 were **consecutive lines with no blank line between them**, so the entire dispersion
discussion rendered as a single wall-of-text paragraph. Split into four.

```diff
@@ L290–293 · Discussion › Dispersion & Family Predictors · paragraph structure @@
  ...the benefits of better fit for $y = 0$ do not pan out.
+
  In contrast, something else happens in the quantile model...
+
  Lastly, we conclude our discussion on the language predictors...
+
  Some explanations include genealogy (clustering)...

@@ L292 · language predictors @@
- Lastly, we conclude our discussion on the language predictors. // Addition of language
- predictor does disperse the model in the right direction. // Our language families of
- Austronesian, Austro-Asiatic, and Papuan are isolated languages, which is worth noting.
- Given that they are genealogically connected, they also form a cluster. However, we still
- need to provide evidence this is not just reverse engineering the fact that these families
- demonstrate non-complex tonal, humid regions.
+ Lastly, we conclude our discussion on the language predictors. The addition of the family
+ indicators does disperse the model in the right direction. Our language families of
+ Austronesian, Austro-Asiatic, and Trans-New Guinea are isolated languages, which is worth
+ noting, and given that they are genealogically connected, they also form a cluster.
+ However, we still need to provide evidence that this is not just reverse engineering the
+ fact that these families demonstrate non-complex tonality despite occupying humid regions.

@@ L293 · principled explanations @@
- Lastly, linguistics phenomena such as population size could showcase confounding variables
- that have already been linked to linguistic features, such as complex morphology and large
- population size. // In the end, the inclusion of the predictors as well-specified remains
- an open question.
+ Lastly, sociolinguistic phenomena such as population size could introduce confounding
+ variables that have already been linked to linguistic features, such as complex morphology.
+ In the end, whether the inclusion of these predictors is well-specified remains an open
+ question.
```

**Notes**

- `Papuan` → `Trans-New Guinea`. The model actually keys on `family == "Trans-New Guinea"`
  (`R/data.R:73`). "Papuan" is an areal cover term, not the family the code selects.
- `linguistics phenomena` → `sociolinguistic phenomena` (matches the abstract), and the
  duplicated "and large population size" was dropped — population size was already the
  example being given.
- `demonstrate non-complex tonal, humid regions` was garbled; rendered as "demonstrate
  non-complex tonality **despite occupying** humid regions," which is the outlier logic the
  sentence was reaching for.
- **Cost:** +1 page. The paragraph breaks are worth it; the section was previously a single
  ~400-word block.

**⚠ Flagged, not changed — this is a claim, not a polish item.** The sentence "given that they
are genealogically connected, they also form a cluster" is doubtful: Austronesian,
Austro-Asiatic, and Trans-New Guinea are *distinct* families. They are **areally** clustered
(insular/mainland Southeast Asia and New Guinea), not genealogically connected — the proposed
Austric link is contested and would not cover Trans-New Guinea at all. Since the family
argument leans on this, it is left exactly as written for Ali to decide.

---

## Iteration 3 — Prose repairs & the conclusion

| | |
|---|---|
| **Knit gate** | ✅ green — exit 0, 19 pp |
| **Touches claims** | ❌ no — grammar and register; every argument preserved |
| **Revert to** | `1ec2034` |

Three garbled sentences in the body, then the conclusion, which was the most overwrought
passage in the paper.

```diff
@@ L75 · Introduction @@
- Then, we establish how there are necessary dynamics (such as precise intonation)
- that are necessary for complex tone to emerge.
+ Then, we establish the dynamics (such as precise intonation) that are necessary
+ for complex tone to emerge.

@@ L85 · Physiology of Phonation @@
- Although less important for purposes, it is also worth mentioning...
+ Although less important for our purposes, it is also worth mentioning...

@@ L101 · Statistical Evidence @@
- With this in mind, this is what motivates our desire to explore of the usage of
- the larger quantiles, in the same inferential framework...
+ This is what motivates our exploration of the larger quantiles, in the same
+ inferential framework...

@@ L361 · Conclusion ¶1 @@
- ...While they both had their differences, they both showed one there is comparatively
- more information to explain complex tonality in upper quantiles...
- ...an attempt to better separate the data as best as possible...
+ ...While the two differ in important ways, both showed that there is comparatively
+ more information for explaining complex tonality in the upper quantiles...
+ ...an attempt to separate the data as best as possible...

@@ L363 · Conclusion ¶2 @@
- After discussing some issues regarding the score statistic regarding its grounding
- on the data... In contrast to the authors emphasis... we leverage the power of
- statistics to show that the $q \in (70,80)$ percentile range contains a rich slew of
- information that pans out in a complex manner to give us demonstrably higher
- explanatory power.
+ After discussing the score statistic's weaknesses — its loose grounding in the data,
+ and the inaccuracy induced by its projective nature — ... In contrast to the authors'
+ emphasis... we show that the $q \in (70,80)$ percentile range carries demonstrably
+ higher explanatory power.

@@ L365 · Conclusion ¶3 @@
- Through the power of statistics, we have demonstrated the following idea -- given only
- a select range of quantiles...
- When we understand that humidity, as a geographic phenomenon is chaotic and random, but
- still in a sense has predictable, deterministic structure with finite uncertainty.
- As such, only through the power of statistics, we uncover the secret beautiful gems
- behind these deterministic systems, embedding themselves in the most unexpected ways
- possible, like in our case, complex tonal languages, and the geographic humidity structure!
+ We have demonstrated the following idea: given only a select range of upper quantiles...
+ Humidity, as a geographic phenomenon, is chaotic and random, yet it retains a predictable,
+ deterministic structure with finite uncertainty. It is precisely that structure which
+ allows a statistical treatment to recover a relationship as unexpected as the one between
+ geographic humidity and complex tonal languages.
```

**Notes**

- **Kept deliberately:** the lower-bound / upper-bound paradigm contrast and both of the
  author's coined quotations ("comfort of a reliable, observed floor"; "confident aspirations
  of a minimum sufficient humidity, having previously seen how high the ceiling was"). These
  are the sharpest lines in the conclusion and are the author's own.
- **Repaired:** "When we understand that humidity... with finite uncertainty." was a sentence
  fragment with no main clause. It now resolves.
- **Removed:** "the power of statistics" appeared three times in three paragraphs; now zero.
  The closing "secret beautiful gems... !" flourish is gone, but the closing *idea* — that
  deterministic structure is what makes the recovery possible — is preserved.
- `-- ` (a literal double hyphen) replaced with a true em dash.

---

## Iteration 4 — Restore dropped evidence, and fix a document-wide figure-clipping bug

| | |
|---|---|
| **Knit gate** | ✅ green — exit 0, **16 pp** (was 19), 2,4xx,xxx B |
| **Touches claims** | ❌ no — restores figures and stops LaTeX cropping them |
| **Revert to** | `5130348` |

Two things, one of which was not on the original plan and is the most consequential change in
this whole loop.

### 4.1 — Restored the two commented-out evidence chunks

Both were verified to resolve first: `residual_scatterplot_q` / `residual_scatterplot_k` are
defined at `R/models.R:277,293`, and `skewness_histogram` / `skewness_sd_scatterplot` at
`R/plot.R:17,58`. The residual plots show **mean residual intra-group disparity** against each
extremity parameter — which is exactly the $y{=}1$ vs $y{=}0$ disparity the dispersion argument
asserts but previously never displayed.

```diff
@@ L299–305 · Dispersion & Family Predictors @@
+ For completeness, we close this section with the diagnostics underlying the arguments
+ above. The first row plots humidity skewness against its standard deviation, alongside
+ the distribution of skewness by tonality type. The second row plots the mean residual
+ intra-group disparity against each extremity parameter — the very disparity that drives
+ the dispersion behavior described above.

- #if(T){skewness_sd_scatterplot + skewness_histogram}
+ if(plot){skewness_sd_scatterplot + skewness_histogram}

- #if(plot){residual_scatterplot_q + residual_scatterplot_k}
+ if(plot){residual_scatterplot_q + residual_scatterplot_k}
```

### 4.2 — 🔴 Figures were being cropped by LaTeX. All of them.

Visual verification of the rendered PDF (not just "did it knit") caught this. With
`pdf_document` on letter paper at 1in margins, the text block is **6.5 in**. No chunk set
`out.width`, so every graphic was placed at its natural `fig.width` and **silently cropped at
the right margin**. Ten chunks were affected — widths 7, 8, 8.5 and 9 in.

The damage was not cosmetic:

> On the *k*-SD figure, the x-axis was cut at $k \approx 1.7$. The paper's central claim is
> that deviance **"tapers off near $\chi^2 = 405$ around our critical point $k = 2$."**
> $k = 2$, the reference line, the taper, and the colorbar legend were all **off the printed
> page.** The same was true of the $q$-window figures and the family-coefficient panels.

```diff
@@ 10 chunk headers · L148,156,160,235,239,262,266,300,304,327 @@
- ```{r, fig.height = 3.5, fig.width = 9}
+ ```{r, fig.height = 3.5, fig.width = 9, out.width = "100%"}
```

Chunks already within the text block (`fig.width` 4 and 6) were left alone.

**Notes**

- **Page count fell 19 → 16.** Scaling wide graphics to the text block makes them shorter; no
  content was removed.
- **Three "not shown" statements remain** (L245, L247, L276). Restoring these plots does *not*
  retire them: they concern **coefficient significance** and an **un-run extrapolation beyond
  $k = 3$**. Substantiating those needs a coefficient table and a new model run — that is new
  analysis, not polish, so it was deliberately left undone. See *Remaining work*.
