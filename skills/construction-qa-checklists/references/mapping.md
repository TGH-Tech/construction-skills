# Mapping a scope of work to QA checklists

The mapper selects checklists from the library; it never writes a new one.
Every checklist in the library gets a decision and a reason — the rejected ones
matter to a QA manager as much as the selected ones.

## 1. Scope lines

A **scope line** is one item of work with its heading, written
`Heading – item`, for example:

- `Foundation – PCC below column footing, 1:4:8`
- `Foundation – Block work above the plinth beam, 20 cm`
- `Plastering – Ceiling plastering, 1:4`
- `Tiling – Anti-skid ceramic floor tiles for toilets`

Agreements often print scope as a table broken across lines; rebuild each row
into one line like these before matching. Use the scope of works and the
specification schedules that describe work. Payment milestones, rates and
legal clauses are not scope.

## 2. Exclusions

Split an exclusion sentence into one item per excluded thing, keeping each
item's own qualifiers: "RCC slab in kitchen, open terrace water proofing &
open terrace plastering, yard filling and compound wall are not considered"
becomes `RCC slab in kitchen`, `Open terrace water proofing`,
`Open terrace plastering`, `Yard filling`, `Compound wall`. Quote an item
verbatim when you give it as a reason.

"Interior works" in an exclusion means interior fit-out (furniture, false
ceilings, décor) — not the plastering or painting of internal walls that the
scope buys by name.

## 3. Matching

Normalise both sides before matching: lower case, `&` → "and", every run of
punctuation or symbols → one space. A scope line **supports** a checklist when
it contains one of the checklist's phrases (or all the words of one of its
word-sets) **and none of its "not when" words**.

Rules for the five sample checklists:

| Checklist | Phrases (any one) | Word-sets | Not when the line mentions |
|---|---|---|---|
| 7 PCC BELOW FOUNDATION | pcc below foundation · pcc below footing · pcc below column footing · pcc under footing · pcc blinding · blinding concrete · lean concrete | {pcc, foundation} · {pcc, footing} · {pcc, blinding} | pcc flooring · floor |
| 14 BLOCK WORK FOR SUPERSTRUCTURE | block work · block wall · block masonry · block masonary · parapet wall · parapet block | — | foundation · plinth · rcc belt · above the block work |
| 18 PLASTERING FOR INTERNAL WALLS | inside plastering · inside plaster · internal plastering · internal plaster · plastering for internal walls | {internal, plaster} · {inside, plaster} · a line that says only "plastering" | ceiling · external · outside · terrace · roof |
| 22 FLOORING USING VITRIFIED TILES | vitrified tile · vitrified flooring · floor tile · flooring tile · a line that says only "tiling" | — | ceramic · anti skid · wall tile · dado · granite |
| 27 PAINTING INTERNAL WALLS | internal painting · internal paint · inside painting · painting internal walls | {internal, paint} · a line that says only "painting" | ceiling · external · outside |

Two things these rules encode that are easy to get wrong:

- **Work is named by its element, not its checklist.** Agreements rarely say
  "PCC below foundation"; they say "PCC below column footing". Blockwork at
  plinth level is foundation blockwork (a different sheet in the full
  library), however it is worded.
- **A bare trade heading names the family.** A line that is *only*
  "Plastering", "Tiling" or "Painting" selects the representative sheet
  (internal plastering, vitrified tiling, internal painting), so the heading is
  not reported as a gap. As soon as the line names a location — ceiling,
  external, terrace — it is about that location's sheet instead.

The full library has rules like these for all 24 checklists. They run in the
full workflow at https://constructions.bleno.io.

## 4. Decisions

For each checklist:

1. Included scope supports it → **include**, reason
   `Selected by scope: "<the line>".` If an exclusion item *also* supports it
   (by the same rules), add
   `Kept because included scope supports this activity, but the exclusion "<item>" may narrow where it applies.`
2. Else, an exclusion item supports it → **drop**,
   `Excluded by scope: "<item>".`
3. Else → **drop**, `No scope wording supports this activity.`

Example: scope `Plastering – Inside plastering 1:5` and exclusion
`Open terrace plastering` → internal plastering is included with **no** note:
the exclusion names terrace plastering, which the "not when" words keep off
the internal sheet.

## 5. Scope with no checklist — report it first

Sort every scope line that selected none of the five sample sheets into two
lists, by the checklist titles in `references/checklists.md`:

- **In the full library, not in this sample** — a title there plainly covers it
  (RCC for foundation or superstructure, foundation blockwork, earth filling,
  PCC flooring, ceiling / external / roof-top plastering, ceramic tiles,
  dadoing, granite, external or ceiling painting, putty, RCC underground tanks,
  DPC below floor level). Site clearing (1.1) is always required: list it here
  even if no line names it. When in doubt, put the line here and say it should
  be checked in the full workflow.
- **No checklist at all** — no title covers it. Typical: electrical, plumbing
  and sanitary fittings, carpentry, doors and windows, fabricated steel,
  anti-termite treatment, wet-area waterproofing (DPC is a damp-proof course
  below floor level, not toilet waterproofing), and tanks that are not RCC
  (PVC tanks, ferrocement septic tanks, soak pits).

Collapse near-duplicates so each trade is reported once, and put the
"no checklist at all" list first: work nobody has a sheet for is the most
important finding.
