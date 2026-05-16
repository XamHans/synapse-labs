# 📓 Synapse Lab Playbook

## Why this playbook exists

Labs are where the "AI Native Engineer" title is earned. While the Synapse app teaches the concept, the lab proves the concept can be used to solve a real-world engineering problem. 

Modules drift in quality when labs are just "chat demos." The reader feels it: some labs feel like homework, others feel like a breakthrough. This document ensures every lab is a breakthrough by applying the same rigorous pipeline we use for our core content.

---

## The pipeline

```
roadmap.md ┐
           ├─►  Stage 1: Name & Chain Concepts
brief.md   ┘                  │
                              ▼
                   Stage 2: Ground the Scenario
                              │
                              ▼
                   Stage 3: The Dependency Chain
                              │
                              ▼
                   Stage 4: Draft with SUCCESs
                              │
                              ▼
                   Stage 5: Self-review checklist
                              │
                              ▼
                     [lab-name].ipynb
```

---

## Stage 1: Name & Chain Concepts

Before you open a Jupyter Notebook, you must name the specific concepts the user will master.

| Field | What it is | Example |
|---|---|---|
| **Primary Concept** | The single noun phrase naming the *engineering mechanism* being taught. | _Deterministic JSON fallback boundaries_ |
| **Secondary Concepts** | (Optional) Related concepts that support or build upon the primary one. | _Latent cost instrumentation_ |

### Rules for chaining concepts
- **Build, don't just stack.** If a lab has two concepts (e.g., Latency measurement and JSON parsing), they must relate. *Example:* "Latency measurement proves the model is slow (Concept A), which motivates why we need a fast, deterministic fallback when the model fails (Concept B)."
- **Identify the Artifact.** Pin the concept to a specific code artifact the user will manipulate (e.g., `client.chat.completions`, `json.loads()`, `tiktoken.get_encoding`).

---

## Stage 2: Ground the Scenario

Every lab must be grounded in a realistic, non-generic engineering task. 

- **No Generic "Chat Bots."** Instead of "Building a chatbot," build "A high-throughput support router for a billing system."
- **Real Constraints.** Use real numbers for grounding:
    - *Latency:* "gpt-4o is too slow for our 200ms SLA—measure it."
    - *Cost:* "We have 10,000 tickets per day; calculate the daily burn."
    - *Failure:* "The model returned 'Sure, here is your JSON' inside the block—write the regex that fixes it."

---

## Stage 3: The Dependency Chain (Notebook Flow)

Concepts are sequenced so each one answers an implicit tension the previous one opened.

- **Part 1: The Tension (The Broken State).** 
    - Demonstrate why a naive approach fails. 
    - *Example:* Run an LLM call that returns malformed JSON, causing a `ValueError` in Python. 
    - The user must *feel* the fragility before they fix it.
- **Part 2: The Challenge (The Implementation).**
    - The user writes the logic to resolve the tension.
    - Provide a skeleton function with `# --- YOUR CODE HERE ---`.
- **Part 3: The Scorecard (Validation).**
    - End every lab with a **Scorecard**. 
    - It must test the implementation against multiple edge cases (Happy Path, Hallucination, Malformed Input).
    - Verification is deterministic, not probabilistic.

---

## Stage 4: Draft with SUCCESs

Apply the SUCCESs framework to your notebook cells:

- **Simple:** The lab focuses on the concept. Avoid 50-line boilerplate functions that have nothing to do with the AI primitive.
- **Unexpected:** Use the tension phase to show a failure mode the user might not have anticipated (e.g., "AI filler text" breaking `json.loads`).
- **Concrete:** Load-bearing nouns are code variables and API payloads. Use real strings, real error messages, and real performance metrics.
- **Stories:** The notebook should feel like a debugging journey. Each cell should lead logically to the next.

---

## Stage 5: Self-review checklist

- [ ] Concept names are written as noun phrases, not headlines.
- [ ] If multiple concepts exist, they form a logical dependency chain.
- [ ] The "Tension" phase clearly demonstrates a failure before the "Challenge" begins.
- [ ] The scenario uses grounded, realistic constraints (latency, cost, or specific failure modes).
- [ ] The Scorecard tests at least 3 distinct scenarios, including one edge case.
- [ ] No "in this lab"-style throat-clearing. Start with the tension.
- [ ] Code is formatted with clear docstrings and `# --- YOUR CODE HERE ---` markers.

---

## 🛠️ Tech Stack Consistency
Always use the Nix-provided environment:
- `openai` (API calls)
- `tiktoken` (Token counting)
- `qrcode` / `pillow` (Handoff)
- `python-dotenv` (Local .env handling)
