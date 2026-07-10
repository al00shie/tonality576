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
