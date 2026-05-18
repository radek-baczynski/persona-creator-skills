# Changelog

All notable changes to this project are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [1.1.0] - 2026-05-18

### Added

- `references/persona-card-template.md` — canonical persona card fields based on [StoriesOnBoard](https://storiesonboard.com/blog/what-is-on-a-user-persona-card)

### Changed

- `persona-creator` workflow and candidate proposal format require a full Persona Card per persona
- `references/persona-skill-template.md` uses `## Persona Card` instead of `## Persona Snapshot`
- All ten example personas under `examples/personas/` migrated to Persona Card format
- Eval expectations updated for Persona Card fields in proposals and generated skills

## [1.0.0] - 2026-05-17

### Added

- `persona-creator` skill under `skills/persona-creator/` (site crawl → personas → approved `persona-*` skills)
- `references/persona-skill-template.md` for generated persona skills
- `evals/evals.json` with sample eval cases
- Ten example personas under `examples/personas/`
- MIT license, README with install flow, motivation (Transcriptmate), and mocked usage
- Support for Cursor, Claude Code, OpenCode, Codex, Gemini CLI via `npx skills add`

[Unreleased]: https://github.com/radek-baczynski/persona-creator-skills/compare/v1.1.0...HEAD
[1.1.0]: https://github.com/radek-baczynski/persona-creator-skills/releases/tag/v1.1.0
[1.0.0]: https://github.com/radek-baczynski/persona-creator-skills/releases/tag/v1.0.0
