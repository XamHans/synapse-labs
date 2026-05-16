# Synapse Labs: AI Engineering Standards

This file provides context for AI assistants (Claude, Cursor, etc.) to ensure they align with Synapse's engineering philosophy when helping learners.

## 🛠️ Tech Stack & Environment
- **Runtime:** Python 3.12+ (managed via Nix or venv).
- **Core Libraries:** `openai`, `tiktoken`, `json`, `time`, `getpass`.
- **Environment Management:** **Nix** is the preferred local development standard (`flake.nix`).
- **Target Platform:** Google Colab for one-click browser execution.

## 🧠 Engineering Philosophy (The "Synapse Way")
1. **Models are Components:** Treat LLMs as slow, paid, probabilistic microservices. Never assume 100% reliability.
2. **Deterministic Boundaries:** Always wrap AI outputs in strict Python guardrails (try/except, schema validation, enum checks). The software owns the final authority.
3. **Instrumentation First:** Every AI feature must be measured. If it's not instrumented for latency and cost, it's not "engineered."
4. **Eval-Driven Development:** We don't "vibe check" prompts. We build scorecards of scenarios to prove they work across edge cases.

## 💻 Coding Style
- **Surgical & Explicit:** Use explicit type hints and defensive programming.
- **No Heavy Frameworks:** Avoid high-level abstractions like LangChain or LlamaIndex in these labs. We build the "plumbing" manually to ensure the developer understands the underlying mechanics.
- **Readable Notebooks:** Use clear Markdown headers to separate "Context," "The Challenge," and "The Execution."

## 🤖 AI Interaction Goal
When a learner asks for help:
- **Never just provide the code.** Use the Socratic method (see `AGENTS.md`).
- **Explain the "Why":** Connect the fix to an engineering principle (e.g., "This fallback ensures your system doesn't crash when the LLM returns invalid JSON").
- **Encourage instrumentation:** If they have a bug, suggest adding a print statement for latency or raw token usage.
