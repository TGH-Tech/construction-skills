#!/usr/bin/env bash
# Builds dist/ — committed, so every file has a stable URL on GitHub:
#
#   dist/<skill>.zip  the skill folder as the zip's root: what claude.ai
#                     (Customize → Skills) and ChatGPT (Skills → Create →
#                     Upload) expect.
#   dist/<skill>.md   the whole skill in one Markdown file — instructions,
#                     references and scripts inlined — so a chat can be
#                     pointed at its URL ("follow the instructions at …")
#                     without installing anything.
set -euo pipefail
cd "$(dirname "$0")/.."
rm -rf dist && mkdir -p dist
for dir in skills/*/; do
  name=$(basename "$dir")
  [ -f "$dir/SKILL.md" ] || continue
  (cd skills && zip -qr -X "../dist/$name.zip" "$name" -x '*/__pycache__/*' '*.pyc' '*/.DS_Store')
  python3 - "$dir" "dist/$name.md" <<'PY'
import os, sys
root, out = sys.argv[1].rstrip("/"), sys.argv[2]
name = os.path.basename(root)
skill = open(os.path.join(root, "SKILL.md"), encoding="utf-8").read()
# frontmatter stays first, so the file still works saved as a SKILL.md
head, sep, body = skill.partition("\n---\n")
note = f"<!-- {name}: single-file edition of https://github.com/TGH-Tech/construction-skills/tree/main/skills/{name} -->"
parts = [
    head + sep + note + "\n" + body.rstrip(),
    "",
    "---",
    "",
    "# Bundled files",
    "",
    "This single-file edition inlines every file the instructions above refer to. "
    "Where they say to read a file, read its section below. Where they say to run a "
    "script, save the code block under its file name (and any JSON assets it loads "
    "next to it, in the same folders) and run it with Python 3; if code cannot run "
    "here, follow the method by hand.",
]
lang = {".py": "python", ".json": "json", ".yaml": "yaml", ".sh": "bash"}
for folder in ("references", "assets", "scripts"):
    path = os.path.join(root, folder)
    if not os.path.isdir(path):
        continue
    for f in sorted(os.listdir(path)):
        full = os.path.join(path, f)
        text = open(full, encoding="utf-8").read().rstrip()
        parts += ["", f"## `{folder}/{f}`", ""]
        ext = os.path.splitext(f)[1]
        if ext == ".md":
            # demote the file's own headings so they nest under this section
            parts.append("\n".join(("#" + l) if l.startswith("#") else l for l in text.splitlines()))
        else:
            parts += [f"```{lang.get(ext, '')}", text, "```"]
parts += ["", "---", "", "License: free to use, no redistribution — see "
          "https://github.com/TGH-Tech/construction-skills/blob/main/LICENSE", ""]
open(out, "w", encoding="utf-8").write("\n".join(parts))
PY
  echo "dist/$name.zip  dist/$name.md"
done
