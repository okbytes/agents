# skills

My global agent instructions and skills. `AGENTS.md` installs to `~/.agents/AGENTS.md`, and each folder with a `SKILL.md` installs to `~/.agents/skills/<folder>`.

## Install

From a checkout:

```sh
sh install.sh
```

Or without cloning:

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/okbytes/skills/main/install.sh)"
```

Rerun it after changing anything here. It replaces `AGENTS.md` and each same-named skill with a fresh copy, reports which ones changed, and leaves other skills in `~/.agents/skills` alone. A skill deleted here stays installed until you delete it there.

## Linking

Each tool reads from its own folder, so link it to `~/.agents` once per machine. The links point at paths the installer keeps in place, so they pick up every reinstall. For example:

```sh
ln -s ~/.agents/AGENTS.md ~/.claude/CLAUDE.md
ln -s ~/.agents/skills/clear-concise-prose ~/.claude/skills/clear-concise-prose
```
