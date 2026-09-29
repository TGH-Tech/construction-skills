# Reference activity library — sample (setup and substructure)

A generic first pass for a conventional RCC-framed building. Durations are
**provisional planning assumptions** for a small residential unit, in working
days, and carry no project's measurements. Every relationship ships with logic
status **P (provisional)** until someone with site knowledge reviews it
(R = reviewed, A = approved).

This file holds 13 of the 33 activities in Bleno's library. The superstructure
floor cycle (repeated per storey), envelope, services, finishes, commissioning,
handover and the procurement chain are part of the full workflow at
https://constructions.bleno.io.

## Activities

| ID | Activity | Days | Predecessors | Crew | Rate unit | Selected when the scope mentions |
|---|---|---|---|---|---|---|
| A010 | Mobilization | 5 | — | — | — | every project |
| A020 | Site establishment | 7 | A010 FS | — | — | every project |
| A030 | Survey and setting out | 2 | A020 FS | — | — | every project |
| B010 | Excavation | 7 | A030 FS | Equipment fleet | m³/day | "foundation", "excavation", "earthwork", "footing" |
| B020 | Foundation-base preparation | 2 | B010 FS | — | — | "foundation", "footing" |
| B030 | PCC / blinding concrete | 2 | B020 FS | Concrete crew | m³/day | "foundation", "pcc", "blinding", "footing" |
| B040 | Footing reinforcement | 5 | B030 FS | Steel-fixing crew | tonne/day | "foundation", "footing", "reinforcement" |
| B050 | Footing formwork | 4 | B040 FS | Carpentry crew | m²/day | "foundation", "footing", "formwork" |
| B060 | Foundation inspection | 1 | B040 FS, B050 FS | — | — | "foundation", "footing" |
| B070 | Footing concrete | 1 | B060 FS | Concrete crew | m³/day | "foundation", "footing", "footing concrete" |
| B080 | Foundation curing / strength period | 7 | B070 FS | — | — | "foundation", "footing" |
| B090 | Columns / pedestals to plinth | 5 | B080 FS | — | — | "pedestal", "plinth", "column footing" |
| B100 | Backfilling and compaction | 4 | B090 FS | — | m³/day | "foundation", "earth filling", "backfill", "filling" |

Predecessors are written `ID RELATION [lag]`; every link here is finish-to-start
with no lag. "Every project" activities are not tied to a scope heading.

## Notes on specific activities

- **A010 Mobilization** — Every project starts here; not tied to a scope heading.
- **B060 Foundation inspection** — A hold point: the pour cannot start until this is released.
- **B080 Foundation curing / strength period** — A waiting period represented as an activity so it stays visible.

## How to use this sample

- A "Foundation" heading in the scope supports the whole substructure block;
  say so once rather than repeating it as every activity's reason.
- The library links backfilling (B100) straight after the plinth pedestals.
  If you add plinth beams, an RCC belt or block work above the plinth, make
  backfilling follow them — otherwise it shows float it does not really have.


- Match scope wording to the last column **case-insensitively**, on whole
  words and phrases. A match on any one listed word is enough to propose the
  activity; the reviewer confirms it.
- If an exclusion names the work (for example "earth filling not in scope"),
  drop the activity — unless another included scope line still supports it.
- If the scope has no substructure at all (an interior fit-out, say), keep
  A010–A030 and build the rest with the user.
- `assets/example-schedule.json` is this sample as calculator input: run
  `python3 scripts/cpm.py assets/example-schedule.json` to see the result:
  52 working days, every activity critical — setup and substructure are one
  chain, so any day lost anywhere in it moves completion.
