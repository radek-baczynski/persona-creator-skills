---
name: persona-creator
description: Create rich buyer or user personas from a real website, then turn approved personas into reusable persona-* skills. Use whenever the user wants personas, ICPs, customer segments, buyer profiles, or audience hypotheses from a URL. Also use when the user wants you to browse a site, crawl supporting pages, propose human-feeling personas, and generate reusable persona skills for research, messaging, testing, or critique.
---

# persona-creator

Use this skill to go from "here is a website" to "here are believable personas" to "here are reusable persona skills."

This repository ships only `persona-creator`. Running the skill creates additional `persona-*` skills on the user's machine in their agent skills directory.

## What this skill produces

1. A short evidence-backed site analysis based on multiple relevant pages.
2. A set of candidate personas that feel like real people rather than flat labels.
3. After the user approves or edits the list, one dedicated skill per persona in the user's agent skills directory (see below).

## Required dependencies

This skill depends on:

- `agent-browser` for webpage browsing and analysis
- `skill-creator` or a similar skill-generation capability for creating approved `persona-*` skills

Before browsing:

1. Confirm that `agent-browser` is available in the current environment.
2. Confirm that `skill-creator` or an equivalent skill-authoring workflow is also available.
3. Read the `agent-browser` skill.
4. If `skill-creator` is available, prefer using it when generating the final persona skills.
5. Load the `agent-browser` live core workflow with:

```bash
agent-browser skills get core
```

If dependencies are missing, stop and tell the user what is missing. Suggested installs:

```bash
npx skills add vercel-labs/agent-browser --skill agent-browser -y
npx skills add anthropics/skills --skill skill-creator -y
npm i -g agent-browser && agent-browser install
```

If `agent-browser` is not available, do not substitute a different browser workflow without telling the user.

If `skill-creator` is not available, persona analysis can continue, but reusable `persona-*` skill creation requires that dependency.

## Where to write generated persona skills

After `npx skills add`, skills install into the **user's agent skills directory**, not this repo's `skills/` folder. Use the **same directory where `persona-creator` is installed**:

- **Cursor / Codex / OpenCode / most agents:** `.agents/skills/persona-<slug>/SKILL.md`
- **Claude Code:** `.claude/skills/persona-<slug>/SKILL.md`

Do not commit generated `persona-*` skills to the `persona-creator-skills` repo unless the user explicitly wants that.

## Inputs to collect

Collect these if the user has not already provided them:

- target webpage URL
- what kind of personas they want, if stated: buyers, end users, decision makers, researchers, and so on
- max persona count, defaulting to 3 to 5
- audience constraints such as region, B2B or B2C, price sensitivity, or industry

If the user gives only a URL, use reasonable defaults and continue.

## Workflow

### 1. Clarify the target and goal

- Confirm which page to analyze.
- Treat the provided page as the entry point, not the only source.
- Unless the user explicitly says otherwise, expand to a small supporting crawl across the same site.

### 2. Crawl the site with `agent-browser`

Do not stop at the single provided page. Inspect enough surrounding pages to understand the product, audience, buying motion, and trust signals.

Aim to review the seed page plus 3 to 7 additional relevant pages when they exist. Prioritize pages such as:

- home or product overview
- pricing or plans
- about / company
- use case, solution, or industry pages
- customer stories, testimonials, or case studies
- FAQ or help content
- demo, signup, or contact-sales flow
- integrations or technical docs when the product has a technical buyer

If the site is large, prefer breadth over exhaustive crawling. Choose the pages that reveal who the product is for and how they decide.

When possible, create a compact evidence table while browsing:

- page
- audience clues found
- goals revealed
- objections or friction revealed
- confidence

### 3. Optional outside-in validation

If `WebSearch` is available, use it sparingly after the site crawl to validate your understanding of the category, audience language, and buying context.

Do not let outside sources overpower the website itself. Website evidence remains primary.

### 4. Turn evidence into candidate personas

Use best-practice persona thinking:

- Persona value comes from helping future decisions, not from decorative detail.
- Ground the persona in observed goals, frustrations, behaviors, and buying questions.
- Humanize the persona enough that it feels memorable and usable.
- Do not pad personas with random hobbies or stereotypes.

Propose personas as likely hypotheses, not proven facts. Separate observed facts, reasonable inferences, and uncertainty. Prefer 2 to 4 strong personas over a bloated list.

Before presenting personas, run a curation pass: merge near-duplicates, drop weakly supported personas, mark each as `Primary`, `Secondary`, or `Speculative`.

### 5. Make each persona feel individual

Each persona should read like a normal product or marketing persona. Give each persona a memorable name, role context, bio, goals, frustrations, behaviors, decision style, buying triggers, objections, trust signals, and a short quote.

Do not accidentally localize the persona unless the site or user gives a reason.

### 6. Add evidence anchors and distinctiveness checks

For every persona, capture observed signals, reasonable inferences, open questions, primary job-to-be-done, top buying trigger, top deal-breaker, and why this is distinct from other personas.

### 7. Present candidate personas and pause for approval

Use this structure:

```markdown
## Site Read
- Product:
- Problem solved:
- Pages reviewed:
- Strong audience signals:
- Key evidence from the site:
- Gaps / uncertainties:

## Candidate Personas
### 1. `persona-...`
- Priority: Primary | Secondary | Speculative
- Persona label:
- Archetype:
- Bio:
- Mindset / personality:
- Quote:
- Why this persona is plausible:
- Goals:
- Frustrations:
- Current workarounds or behaviors:
- Decision style:
- Buying triggers:
- Objections:
- Trust signals they need:
- What they would care about on this site:
- Primary job-to-be-done:
- Top deal-breaker:
- Why this is distinct:
- Observed signals:
- Reasonable inferences:
- Open questions:
- Confidence: High | Medium | Low
```

After the list, explicitly ask the user to approve, reject, merge, rename, reprioritize, or edit the personas.

### 8. Do not generate persona skills yet

Wait for explicit user approval. If the user partially approves the list, only create skills for the approved personas.

### 9. After approval, create one skill per persona

For each approved persona:

- confirm again that `skill-creator` or an equivalent skill-authoring workflow is available
- create `persona-<slug>/SKILL.md` in the user's agent skills directory (same location as this skill)
- keep the `persona-` prefix and lowercase kebab-case slugs
- read `references/persona-skill-template.md` in this skill folder for the full template and naming guidance
- avoid creating two skills that are nearly the same persona with different labels

### 10. Generate each persona skill as a reusable research lens

Each generated persona skill should include YAML frontmatter, persona snapshot, boundaries, evidence anchors, how to work, and output shape. See `references/persona-skill-template.md` for the complete template.

## Quality bar

A good run of this skill:

- crawls beyond the entry page and uses broader site evidence before persona invention
- produces a compact, useful set of personas rather than a bloated list
- ranks personas by priority
- shows what is observed versus inferred
- asks for approval before creating persona skills
- creates skills reusable in later chats without repeating the whole webpage analysis
- keeps uncertainty visible

## Example requests

- "Analyze `https://example.com` and tell me who would be most interested in this product."
- "Browse this landing page, propose likely buyer personas, and after I approve them create reusable persona skills."
- "Look at this SaaS page and make 3 personas I can use later for messaging research."
