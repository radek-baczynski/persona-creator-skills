# Examples

Sample **outputs** from running [`persona-creator`](../skills/persona-creator/) on real websites. These are reference personas, not installable skills.

## What is here

The [`personas/`](personas/) folder contains example `persona-*` skill files showing what the factory produces after site analysis and approval. For instance, `persona-solo-creator` was generated from a creator-focused transcription product site.

## Not installable

Files under `examples/` are **not** discovered by `npx skills add`. To use an example as a live skill, copy it into your agent skills directory (for example `.agents/skills/` on Cursor) or ask your agent to create a new skill based on the example.

## Install the factory skill

```bash
npx skills add radek-baczynski/persona-creator-skills --skill persona-creator -y
```
