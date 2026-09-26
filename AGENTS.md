# Labs

For Python/Colab lab changes, read `../.codex/rules/labs-architecture.md` and
`../.codex/rules/testing-strategy.md`. Labs are teaching artifacts, not production application code.

- Treat LLMs as slow, paid, probabilistic services; validate their outputs deterministically.
- Instrument latency, cost, tokens, and failure paths. Prefer clear type hints and readable notebooks.
- Avoid heavy frameworks unless a lesson is about that framework.
- Teach the learner's mental model with familiar engineering patterns. Ask a short recall question
  only when useful and the learner is not blocked; when blocked, show the concrete fix and explain it.
- Reply in the learner's language.
