# persona-creator-skills

Agent skills for creating reusable buyer and user persona skills from any website. Skills follow the [Agent Skills](https://agentskills.io/) format.

[![skills.sh](https://skills.sh/b/radek-baczynski/persona-creator-skills)](https://skills.sh/radek-baczynski/persona-creator-skills)

## persona-creator

Browse a site, propose evidence-backed personas, and after your approval generate reusable `persona-*` research lenses for messaging, UX critique, positioning, and buyer research.

**Use when:**

- You have a product URL and want to know who it is really for
- You want ICPs, buyer profiles, or audience hypotheses grounded in site evidence
- You want reusable persona skills for later chats without re-crawling the site

**Example prompts:**

- "Analyze `https://example.com` and tell me who would be most interested in this product."
- "Browse this landing page, propose buyer personas, and after I approve them create reusable persona skills."
- "Look at this SaaS page and make 3 personas I can use later for messaging research."

## Installation

```bash
npx skills add radek-baczynski/persona-creator-skills
```

Or install explicitly for Cursor:

```bash
npx skills add radek-baczynski/persona-creator-skills --skill persona-creator -a cursor -y
```

List skills in this repo:

```bash
npx skills add radek-baczynski/persona-creator-skills --list
```

## Dependencies

`persona-creator` expects these skills to be installed separately:

```bash
npx skills add vercel-labs/agent-browser --skill agent-browser -y
npx skills add anthropics/skills --skill skill-creator -y
```

You also need the `agent-browser` CLI:

```bash
npm i -g agent-browser && agent-browser install
```

## Usage

After installation, mention the site URL and what you want. The skill crawls supporting pages, proposes personas with evidence anchors, waits for your approval, then writes `persona-*` skills into your agent skills directory (for example `.agents/skills/` on Cursor).

Generated persona skills stay on your machine unless you choose to version them.

## Examples

See [`examples/personas/`](examples/personas/) for sample persona skills produced by `persona-creator`. These are not installable via `npx skills add`.

## Skill structure

Each skill in this repo is a folder under `skills/`:

- `SKILL.md` — instructions and workflow
- `references/` — supporting docs (persona skill template)
- `evals/` — eval cases for quality testing

## License

MIT
