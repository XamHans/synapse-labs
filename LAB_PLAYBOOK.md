# 📓 Synapse Lab Playbook: The "Red Thread" Narrative

## Why this playbook exists

Labs are where the "AI Native Engineer" title is earned. While the Synapse app teaches the concept, the lab proves the concept can be used to solve a real-world engineering problem. 

Modules drift in quality when labs are just "chat demos." This document ensures every lab is a **breakthrough** by applying the **Red Thread** narrative: moving from a naive failure to a deterministic software solution.

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
                   Stage 3: The Red Thread (The Flow)
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

- **Primary Concept:** The single noun phrase naming the *engineering mechanism* being taught. (e.g., _Constrained Decoding_).
- **Secondary Concepts:** Related concepts that support it (e.g., _Latency/Cost instrumentation_).
- **The Evolution:** Identify the "Old Way" (brittle) vs. the "AI-Native Way" (guaranteed).

---

## Stage 2: Ground the Scenario

Every lab must be grounded in a realistic engineering task. 

- **The Assignment:** "You have been assigned to build a [System Name]. Your goal is to [Specific Action]."
- **Real Constraints:** Use real numbers for grounding (e.g., "We have 10,000 requests/day, we can't afford retries").
- **The Failure Mode:** Identify why a simple API call isn't enough (e.g., "The model is chatty and includes filler text that crashes `json.loads()`").

---

## Stage 3: The Red Thread (Notebook Flow)

Every notebook must follow this exact four-part narrative:

### Part 1: The Naive Approach (Tension)
- **Action:** Provide a simple, pre-written function that calls the LLM.
- **The Lesson:** Instrument the call. Show the **latency** and **cost**. 
- **The Narrative:** "It's slow and expensive. We can't afford to retry if it fails."

### Part 2: The Real-World Crash (The Problem)
- **Action:** Run the naive code on a "chatty" input that includes Markdown backticks or conversational filler.
- **The Result:** Let the user see a loud `JSONDecodeError` (or similar).
- **The Narrative:** "Models love to talk. In production, 'chatty' responses will crash your server. We need a boundary."

### Part 3: The Brittle Boundary (The Challenge)
- **Action:** Ask the user to solve it the "hard way" using Python logic and **Regex**.
- **Hint:** Provide a hint like `re.search(r"(\{.*\})", text, re.DOTALL)`.
- **Goal:** Build empathy for the problem and understand how engineers solved this before modern features existed.

### Part 4: The AI-Native Solution (The Breakthrough)
- **Action:** Introduce a modern, built-in tool (e.g., Structured Outputs, Function Calling).
- **Research Step:** Tell the user: *"The industry moves fast. Use Google/WebSearch to find the latest syntax for [Feature Name] in the [Library] SDK."*
- **Final Challenge:** Apply the modern tool to the same problem. Show how it replaces 20 lines of brittle Regex with 3 lines of guaranteed schema adherence.

---

## Stage 4: Draft with SUCCESs

- **Simple:** Avoid 50-line boilerplate functions. The code should be about the AI primitive.
- **Unexpected:** The "Crash" in Part 2 should be a genuine "Aha!" moment.
- **Concrete:** Use real strings, real error messages, and real performance metrics.
- **Stories:** The notebook is a debugging journey. Each cell leads inevitably to the next.

---

## Stage 5: Self-review checklist

- [ ] Does the lab have a clear "Assignment" (e.g., "Build a Support Router")?
- [ ] Does Part 1 show latency/cost to justify why we can't just "retry"?
- [ ] Does Part 2 demonstrate a specific, realistic failure (like "chatty filler")?
- [ ] Does Part 3 force the user to build a manual "Boundary" (Regex/Try-Except)?
- [ ] Does Part 4 introduce a modern "AI-Native" tool that makes the boundary redundant?
- [ ] Is there a research step using WebSearch to find the latest SDK syntax?
- [ ] Does the Scorecard test at least 3 distinct scenarios, including an edge case?

---

## 🛠️ Tech Stack Consistency
Always use the Nix-provided environment:
- `openai` (API calls)
- `tiktoken` (Token counting)
- `qrcode` / `pillow` (Handoff)
- `python-dotenv` (Local .env handling)
- `pydantic` (Structured Outputs)
