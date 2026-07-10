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
