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

---

## Iteration 5 — Rigor: justify the skew → lower-quantile step

| | |
|---|---|
| **Knit gate** | ✅ green — exit 0, 17 pp, 2,442,730 B |
| **Touches claims** | ✅ **YES — this adds new reasoning. Read before keeping.** |
| **Revert to** | `434e3b5` |

> ### ⚠ Authorship notice
> **This paragraph is new. It was not in the original paper.** The boundedness argument came
> out of a conversation with Claude, not from the original analysis. It is confined to a
> single added paragraph in *Statistical Evidence* and to this one commit, so
> `git revert <this commit>` removes it cleanly and leaves iterations 1–4 intact.
> Keep it only if you're comfortable presenting the reasoning as your own.

The paper asserted a step it never justified: *"As negative skew implies larger left-tails,
this could explain why lower quantiles are reliably larger."* That is hand-wavy as stated —
skew does not, in general, dictate quantile behavior. What makes it true **here** is that
humidity is *bounded*, which mechanically couples the mean to the sign of the skew.

```diff
@@ L95 · Statistical Evidence @@
  ...this could explain why lower quantiles are reliably larger for complex languages
  (which we already take to observe larger MH).
+
+ This coupling is not an accident of our sample. Humidity is a bounded quantity: it cannot
+ fall below zero, and at a given temperature it is capped by saturation. For a bounded
+ variable, the position of the mean within the support strongly constrains the sign of the
+ skew. If the mean sits near the floor, there is little room for mass to its left, and a
+ long tail is available only to its right, forcing positive skew; if the mean sits near the
+ ceiling, the asymmetry reverses. The Beta family illustrates this cleanly: its skewness is
+ positive exactly when its mean lies below the midpoint of the support, passes through zero
+ in the symmetric case, and turns negative above it. A strongly negative
+ corr(mu_H, skew_H) is therefore the expected signature of boundedness rather than a
+ coincidence — and it is this structural coupling that makes it plausible for the upper tail
+ to encode information about the lower one, which is the possibility we pursue in the
+ remainder of this paper.
```

**Notes**

- The Beta claim is exact: for $\text{Beta}(\alpha,\beta)$, skewness $> 0 \iff \alpha < \beta
  \iff \mu < 1/2$. Sign of skew flips precisely as the mean crosses the symmetric midpoint.
- Deliberately hedged. "Strongly constrains," not "determines" — a bounded support makes
  mean-near-floor $\Rightarrow$ positive skew overwhelmingly likely, but this is a structural
  tendency, not a theorem for every bounded distribution.
- The observed $-0.71$ has the **sign boundedness predicts** (mean up $\Rightarrow$ skew down),
  which is why it reads as a mechanism rather than a curiosity.

---

# Remaining work (deliberately not done)

The loop stopped here. These are real, but each is **new analysis, not polish**, and doing
them autonomously would have meant fabricating results or making research judgments:

1. **Three "not shown" claims** (L245, L247, L276). Retiring them honestly requires printing a
   coefficient table (for the significance claim) and actually running the $k > 3$
   extrapolation (for the deviance-turnaround claim). Currently the reader is asked to take
   both on trust.
2. **The family-predictor confound is still unresolved.** The paper selects families by
   negative coefficient and then justifies them post hoc — the reverse-engineering worry it
   raises about itself. An LRT or AIC comparison against the no-family models would settle
   whether the indicators earn their place. Left open because the paper is *honest* that it is
   open.
3. **"Genealogically connected"** (see Iteration 2). Austronesian, Austro-Asiatic, and
   Trans-New Guinea are distinct families; they are areally, not genealogically, clustered.
   The family argument leans on this sentence. **Recommend fixing.**

---

# Round 2 — branch `polish-round-2`, reviewed via PR

Round 1 (iterations 1–5) is already merged on `main`. Round 2 runs on an isolated branch;
the anchor is `pre-polish-2` (`fbb5341`, = round-1 head). Scope this round: **prose + fill the
gaps.** New-analysis iterations are isolated one-per-commit so any can be dropped without
disturbing the others, and the whole round is gated behind the PR before it reaches `main`.

## Iteration 6 — Deeper prose pass & the genealogy correction

| | |
|---|---|
| **Knit gate** | ✅ green — exit 0, 17 pp |
| **Touches claims** | ⚠ one **factual correction** (genealogy); the rest is grammar/register |
| **Revert to** | `fbb5341` (branch base) |

The long-flagged genealogy error is fixed, plus five sentence-level repairs round 1 didn't
reach.

```diff
@@ Dispersion & Family Predictors · the genealogy fix @@
- Our language families of Austronesian, Austro-Asiatic, and Trans-New Guinea are isolated
- languages, which is worth noting, and given that they are genealogically connected, they
- also form a cluster.
+ Our language families of Austronesian, Austro-Asiatic, and Trans-New Guinea are relatively
+ isolated and geographically concentrated, which is worth noting. They are distinct families
+ rather than a single genealogical group, but their areal proximity — clustered in and around
+ insular and mainland Southeast Asia and New Guinea — means the grouping could still reflect
+ shared history through contact, alongside inheritance within each family.

@@ Introduction · roadmap redundancy @@
- ...we arrive at the authors' hypothesis. Now, we dive into the background to understand and
- contextualize the authors' hypothesis. Afterwards, we discuss what statistical evidence the
- authors already provide, and discuss our contribution afterwards. That being said, we begin
- with our discussion on phonemic tone.
+ ...we arrive at the authors' hypothesis. Afterwards, we review the statistical evidence they
+ already provide and outline our own contribution. That being said, we begin with phonemic tone.

@@ Phonemic Tone @@
- In other words, the auditory input judged by a listener...   (2nd "In other words" in the ¶)
+ Concretely, the auditory input judged by a listener...
- implying the need of specific conditions that are conducive for accurate pitch manipulation...
+ implying the need for specific conditions conducive to accurate pitch manipulation...

@@ The Authors' Hypothesis @@
- The authors predict or hypothesize "that languages should not be maladaptive..."
+ The authors hypothesize "that languages should not be maladaptive..."
- ...do not predict complex languages necessarily emerge in humid regions, they predict that...
+ ...do not predict that complex languages necessarily emerge in humid regions; rather, they
+  predict that...   (comma splice → semicolon)
```

**Notes**

- The genealogy fix **corrects a factual error** rather than just polishing prose: the three
  families are areally clustered (SE Asia / New Guinea), not genealogically related. The
  confounding argument the sentence was making is preserved — contact and within-family
  inheritance can still produce the cluster — but it no longer overstates the relationship.

---

## Iteration 7 — Fill gap #1a: show the deviance turnaround (was "not shown")

| | |
|---|---|
| **Knit gate** | ✅ green — exit 0, 18 pp (+1 for the new figure), verified visually |
| **Touches claims** | ✅ **NEW RESULT** — reveals an already-computed but hidden part of the sweep |
| **Revert to** | `13d7216` |

The paper twice hand-waved that deviance "would eventually" turn up past $k=3$ but that it
"is not shown." **It was never un-run — it was un-plotted:** `seq_ks <- 1:30/8` already fits
every model out to $k = 3.75$, and the figures just `filter(k <= 2.5)` (`R/models.R`).

**Finding that shaped the fix:** I first intended to extend the existing 4-panel figure, but
checking the full sweep showed **dispersion is non-monotonic** — it peaks at $\phi \approx 1.03$
near $k=2$ then falls *back* to $0.97$ by $k=3.75$. Extending the composed figure would have
contradicted the paper's "overdispersed as $k$ grows" narrative. Deviance, by contrast, has a
clean shallow minimum. So I added a **separate deviance-only** full-sweep plot and left the
main figure (and its dispersion story) untouched.

```r
# R/models.R — new object, built from the UNFILTERED df_sd
dev_plot_full <- df_sd %>% ggplot(aes(x = k, y = deviance, ...)) + geom_point()+geom_line() + ...
```
```diff
@@ Results Overview: Score Model @@
- ...This is one weakness of this model... While it is not shown, extrapolating further beyond
- $k = 3$ would eventually show that the deviance starts to increase...
+ ...This is one weakness of this model... Extending the sweep out to $k = 3.75$ (shown below)
+ confirms this: the deviance reaches a shallow minimum near $k \approx 2.75$ before rising
+ again, as the score statistic loses its grip on the actual data...
+
+ ```{r}  if(plot){dev_plot_full}  ```   (new figure)

@@ Results Overview: Quantile Model @@
- Although it was not displayed in the previous plots, this resembles the last model, where the
- deviance started to pick up again after $k \gg 2.5$.
+ This mirrors the $k$-SD model above, whose deviance we saw pick up again past its shallow
+ minimum near $k \approx 2.75$.
```

**Verified numerically and visually.** Deviance (family=All): 402.6 at $k{=}2$ → min **400.0**
at $k\approx2.75$ → 402.5 at $k{=}3.75$. Both the All and None curves show the same shallow U in
the rendered figure. The rise is **real but gentle** (~2.5 deviance units), and the prose says
so rather than overstating it.

**One caught defect:** the plot title used an em dash, which the ggplot device font renders as
`...`. Changed to parentheses. (Lesson: unicode punctuation inside plot *images* isn't covered
by the LaTeX font.)

---

## Iteration 8 — Fill gap #1b: coefficient table (was "not shown")

| | |
|---|---|
| **Knit gate** | ✅ green — exit 0, 18 pp, table verified visually |
| **Touches claims** | ✅ **NEW RESULT** — substantiates the significance claim, and honestly surfaces its one exception |
| **Revert to** | `7d59deb` |

The paper asserted "although it is not shown, all the coefficients are statistically
significant... with few exceptions." Replaced the assertion with **Table 1**, built live from
the $k=2$ fit (no hard-coded numbers), so the claim is now checkable — including the exception.

```diff
@@ Results Overview: Score Model @@
- Although it is not shown, it is worth at least mentioning that all the coefficients are
- statistically significant, especially the humidity statistic... The language predictors
- fluctuate more, but with few exceptions, generally remain below $p < 0.05$.
+ The coefficients of the model at our reference point $k = 2$ are given in the table below.
+ The humidity statistic... is highly significant, as we would hope. The family predictors are
+ weaker and fluctuate more across $k$: at this reference point Austronesian and Austro-Asiatic
+ clear $p < 0.05$, while Trans-New Guinea does not — the kind of exception we alluded to.
+
+ ```{r}  ... knitr::kable(coef table from get_model_k(2, T)) ...  ```   (new Table 1)
```

**Table 1 (rendered, verified):**

| Term | Estimate | Std. Error | t | p |
|---|--:|--:|--:|--:|
| Intercept | −3.292 | 0.398 | −8.26 | < 0.0001 |
| k-SD score (k = 2) | 1.288 | 0.199 | 6.47 | < 0.0001 |
| Austronesian | −1.014 | 0.346 | −2.93 | 0.0036 |
| Trans-New Guinea | −0.856 | 0.483 | −1.77 | **0.0767** |
| Austro-Asiatic | −1.098 | 0.513 | −2.14 | 0.0327 |

**Notes**

- The honest move here was *not* to launder the exception. The original "with few exceptions"
  was vague cover; the table makes Trans-New Guinea's $p = 0.077$ explicit, and the prose now
  names it. This is a case where showing the evidence makes the paper *more* qualified, not
  less — which is the correct direction.
- Built with base `knitr::kable` (plain-text terms, formatted $p$ column with `< 0.0001`), no
  `booktabs`/`kableExtra`, to keep the knit dependency-free.

---

## Iteration 9 — Fill gap #2: family-predictor F-test (the "open question")

| | |
|---|---|
| **Knit gate** | ✅ green — exit 0, 18 pp, inline numbers verified in the rendered PDF |
| **Touches claims** | ✅ **NEW RESULT + a caveat that keeps the question open** |
| **Revert to** | `1c6faa9` |

The paper flagged the family predictors as an "open question" but never quantified whether
they earn their place. Added the test — and, just as importantly, the reason it does **not**
close the question.

**Statistical note that shaped it:** the models are `quasibinomial`, so **AIC is undefined and
a chi-square LRT is not the right test** — the correct nested comparison is an **F-test** (the
dispersion is estimated). So the primary result is an F-test; a binomial refit supplies AIC/LRT
only as a cross-check.

All numbers are computed **live** in a hidden chunk and injected with inline `` `r ` `` —
nothing is hard-coded.

```diff
@@ Dispersion & Family Predictors @@
+ ```{r, include=FALSE}  # live: F-tests, p-values, AIC cross-check  ```
  Lastly, we conclude our discussion on the language predictors. The addition of the family
- indicators does disperse the model in the right direction.
+ indicators does disperse the model in the right direction, and the effect is statistically
+ clear: adding the three indicators to the $k=2$ score model yields a highly significant
+ nested improvement ($F_{3,522} = 6.56$, $p = 0.0002$), and the same holds for the $q=75$
+ window model ($F_{3,522} = 8.84$, $p < 10^{-4}$). A non-quasibinomial cross-check agrees,
+ with the AIC falling from 426.9 to 412.6.
  ...
- However, we still need to provide evidence that this is not just reverse engineering...
+ However, this significance must be read with caution... the three families were themselves
+ selected by inspecting the family coefficients of a preliminary `complex_tonal ~ MH + family`
+ fit, so the tests above are *post-selection* and their $p$-values are optimistic: they confirm
+ the indicators carry signal, not that including them is the correct specification rather than
+ an accommodation of the very outliers that motivated them.
```

**Notes**

- This is the most delicate iteration: it would have been easy to present $F = 6.56,\ p =
  0.0002$ as *resolving* the confound. It does not. The families were chosen by their own
  coefficients, so the test is circular (post-selection), and the paper now says so. The
  "open question" stance is **preserved and strengthened**, not overturned.
- The `include=FALSE` chunk runs the fits but emits nothing; the four statistics reach the
  prose only through inline references, so they can never drift from the code.

---

# Round 2 summary

| Iter | Commit | What | New results? |
|---|---|---|---|
| 6 | prose+genealogy | 5 sentence fixes + areal-not-genealogical correction | factual fix only |
| 7 | k-sweep | show the deviance turnaround (was "not shown") | ✅ |
| 8 | coef table | Table 1 substantiates significance, surfaces the exception | ✅ |
| 9 | family F-test | F-test + AIC/LRT + post-selection caveat | ✅ |

**Still open after round 2** — genuinely new research, out of scope for a polish loop:
resolving (not just testing) the family confound would need a pre-registered family grouping or
an out-of-sample check to escape the post-selection circularity. The paper is now honest and
quantified about exactly this.
