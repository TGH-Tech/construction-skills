# Method — from an agreement to a critical path

## 1. Reading the scope

- Work from the document's own headings: "Foundation", "RCC work",
  "Plastering – Ceiling, inside, external". Keep each item to a few words.
- Copy exclusions **verbatim**. "Open terrace plastering, yard filling and
  compound wall are not in scope" excludes exactly those three things — not
  plastering, not filling, not walls in general.
- An exclusion removes an activity only when **no included wording still
  supports it**. If the scope buys "earth filling with anti-termite treatment"
  under Foundation and excludes "yard filling", backfilling stays.
- A broad exclusion ("interior works", "finishing works") does not override
  work the scope buys by name: if the scope lists "inside plastering" and the
  exclusions say "interior works", keep the plastering and ask the user to
  confirm your reading.
- Scope that matches no activity is a finding, not noise: list it as
  "in the contract, not yet scheduled" and ask how the user wants it planned.
- Contract duration, if the agreement states one, is a target to compare the
  result with — never a reason to shorten durations.

## 2. Logic

| Relation | Meaning | Successor may… |
|---|---|---|
| FS | finish-to-start | start after the predecessor finishes (+ lag) |
| SS | start-to-start | start after the predecessor starts (+ lag) |
| FF | finish-to-finish | finish after the predecessor finishes (+ lag) |
| SF | start-to-finish | finish after the predecessor starts (+ lag) |

- Lags are working days; negative lags are overlaps. Write down why each lag
  exists (curing, inspection release, delivery).
- Waiting periods (curing, strength gain) are better as activities than as
  lags — they stay visible and can be tracked.
- Hold points (inspections) sit between the work they release and the work
  that waits for them.
- Every activity except the finish needs a successor; a dangling activity is
  missing logic.

## 3. Calculation by hand (when code cannot run)

Day 0 is the morning work starts; an activity of duration *d* starting on
day *s* finishes on day *s + d*.

**Forward pass** — in dependency order, for each activity:

- ES = 0 if it has no predecessors, otherwise the largest of:
  - FS: predecessor EF + lag
  - SS: predecessor ES + lag
  - FF: predecessor EF + lag − own duration
  - SF: predecessor ES + lag − own duration
  (never below 0)
- EF = ES + duration.
- Project finish = the largest EF.

**Backward pass** — in reverse order, for each activity:

- LF = project finish if nothing follows it, otherwise the smallest of, over
  its successors:
  - FS: successor LS − lag
  - SS: successor LS − lag + own duration
  - FF: successor LF − lag
  - SF: successor LF − lag + own duration
- LS = LF − duration; total float = LS − ES.

**Critical path** — start at the activity that finishes the project with zero
float and walk back through the zero-float predecessor that actually sets its
ES. That chain, reversed, is the critical path. Activities with 1–2 days of
float are near-critical: report them.

Show the forward and backward pass as a table so the user can check every
number.

## 4. Checks before trusting the result

- Does the finish exceed the contract duration? Use the calculator's
  `--deadline` comparison and say by how much; do not compress durations to
  make it fit.
- Several branches can have zero float at once; report every critical
  activity, not only the ones on the printed chain.
- Is anything on the critical path that "shouldn't" be (a long curing period,
  a single inspection)? That is where the programme is most sensitive.
- Are durations still the library's provisional ones? Say so next to the
  result.
