# Persona card template

Canonical persona card shape based on [What's On a Persona Card?](https://storiesonboard.com/blog/what-is-on-a-user-persona-card) (StoriesOnBoard). Read this file before proposing candidate personas or writing approved `persona-*` skills.

Persona cards are fictional, generalized characters that capture needs, goals, and observed behavior patterns so product teams can build empathy and keep users at the center of discovery.

## Field reference

| Field | Purpose | Notes |
|-------|---------|-------|
| Name | Humanize the persona; anchor stakeholder memory | Fictional, memorable |
| Avatar | Visual anchor for empathy | Short text description only in skills (no image required in-repo) |
| Age / location / education | Optional richness | Include when site or user supports them; mark observed vs inferred in evidence anchors |
| **Persona group or job role** | **Starting point** — who this person is | **Required.** B2C: persona groups (e.g. hikers, dog owners). B2B: job roles (e.g. product owner) |
| Challenges / pain points | What the product must solve or support | Tie to role/context and site evidence |
| Goals and benefits | Outcomes and gains the persona wants | What success looks like for them |
| Company and branch | Segment when pains are generic | B2B: company type, industry, size, or branch when relevant. B2C: use `N/A` with brief reason |
| Interests and hobbies | Discovery paths and marketing context | Channels, communities, media — not random filler stereotypes |
| Quote | Optional voice check | One line in this persona's voice |

## B2B vs B2C

- **B2C:** Lead with a **persona group** (life situation or audience segment). Company and branch is usually `N/A`.
- **B2B:** Lead with a **job role**. Add **company and branch** when the site signals industry, company size, or vertical.

## Evidence discipline

- Ground challenges, goals, and role in site crawl evidence when possible.
- Demographics and interests: only add detail that helps decisions or reflects observed positioning; say when inferred.
- Interests/hobbies should explain **where they might discover the product or related content**, not decorative biography.

## Empty template (proposals and skills)

Use this block for each persona in candidate proposals and in each generated `persona-*` skill.

```markdown
## Persona Card
- Name:
- Avatar:
- Age / location / education: (optional; observed or inferred)
- Persona group or job role:
- Archetype:
- Priority: Primary | Secondary | Speculative
- Short bio:
- Challenges / pain points:
- Goals and benefits:
- Company and branch:
- Interests and hobbies: (channels / communities / media)
- Current behaviors / workarounds:
- Buying context:
  - Buying triggers:
  - Objections:
  - Trust signals:
- Temperament / decision style:
- Likely level of expertise:
- Quote:
```

For generated skills, pair this card with **Boundaries**, **Evidence Anchors**, **How to work**, and **Output shape** from `persona-skill-template.md`.
