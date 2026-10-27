#!/bin/sh
# Install AGENTS.md and every skill into ~/.agents, replacing same-named copies and leaving the rest. Safe to rerun.
#   sh -c "$(curl -fsSL https://raw.githubusercontent.com/okbytes/agents/main/install.sh)"
set -eu

agents=$HOME/.agents
# Links into ~/.agents survive reinstalls only if it and its skills folder are real directories.
for dir in "$agents" "$agents/skills"; do
  [ ! -L "$dir" ] || { echo "skills: $dir is a symlink; make it a real directory first" >&2; exit 1; }
done
mkdir -p "$agents/skills"

tmp=$(mktemp -d "$agents/.install.XXXXXX")
trap 'rm -rf "$tmp"' EXIT
trap 'exit 1' HUP INT TERM

if [ -f "$0" ] && [ -f "$(dirname "$0")/AGENTS.md" ]; then
  src=$(CDPATH= cd -P "$(dirname "$0")" && pwd)
else
  curl -fsSL https://github.com/okbytes/skills/archive/refs/heads/main.tar.gz -o "$tmp/skills.tar.gz"
  tar -xzf "$tmp/skills.tar.gz" -C "$tmp"
  src=$tmp/skills-main
fi

# Replace TARGET with a copy of SOURCE, staged first so an interrupted run leaves TARGET intact.
put() {
  if [ -e "$2" ] || [ -L "$2" ]; then
    if [ ! -L "$2" ] && diff -rq -x .DS_Store "$1" "$2" >/dev/null 2>&1; then
      echo "unchanged $2"
      return
    fi
    verb=updated
  else
    verb=added
  fi
  rm -rf "$tmp/staged"
  cp -R "$1" "$tmp/staged"
  find "$tmp/staged" -name .DS_Store -delete
  rm -rf "$2"
  mv "$tmp/staged" "$2"
  echo "$verb $2"
}

put "$src/AGENTS.md" "$agents/AGENTS.md"
for skill in "$src"/*/SKILL.md; do
  [ -f "$skill" ] || continue
  dir=${skill%/SKILL.md}
  put "$dir" "$agents/skills/${dir##*/}"
done
