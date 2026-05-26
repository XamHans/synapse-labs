# Synapse AI Engineering Labs

Practical, hands-on labs for transitioning from software engineering to AI engineering.

These labs are part of the core curriculum at [AI in a Shell](https://ai-in-a-shell.com).

## 🚀 Lab Roadmap

### Phase 1: AI-Native Engineering Mindset

- **[01-mindset-challenge.ipynb](./ai-native-engineer/01-ai-engineering-mental-models/01-mindset-challenge.ipynb):** Bridge the gap between probabilistic models and deterministic code. Learn to measure latency, calculate cost, and build defensive boundaries for AI components.

### Phase 2: Embeddings & Semantic Search

- **[03-semantic-search-lab.ipynb](./ai-native-engineer/04-embeddings-semantic-search/03-semantic-search-lab.ipynb):** Move from "vibe-based" search to instrumented retrieval. Learn to build a diagnostic eval table, identify failure shapes like "Wrong Subset," and apply foundational fix layers like metadata filtering.

## 🛠️ How to use these labs

### 1. Browser (Recommended for Beginners)

The easiest way to run these labs is via **Google Colab**.

- Browse to the lab you want to run.
- Replace `github.com` in the URL with `colab.research.google.com/github/`.
- Or use the "Open in Colab" buttons provided in the [AI in a Shell](https://ai-in-a-shell.com) course platform.

### 2. Local (Recommended for AI Native Engineers)

These labs use **Nix** to provide a perfectly reproducible development environment.

We provide a one-click setup script for macOS and Linux:

1.  **Clone the Repo:**
    ```bash
    git clone https://github.com/XamHans/synapse-labs.git
    cd synapse-labs
    ```
2.  **Run Setup:**

    ```bash
    ./setup.sh
    ```

    This script will check for Nix, offer to install it if missing, and initialize your environment.

3.  **Start the Labs:**
    ```bash
    jupyter notebook
    ```

### 💻 VS Code Setup (Recommended)

1.  **Install Extensions:** Install the **direnv** and **Jupyter** extensions.
2.  **Allow direnv:** When prompted by VS Code, click **"Allow"** to load the Nix environment.
3.  **Select Kernel:** Open a `.ipynb` file, click the kernel name (top right), and select the **Python 3.11** environment from the `/nix/store/...`.

## 🛠️ Troubleshooting

### ❌ `ModuleNotFoundError` in Jupyter
If you run a cell and see an error like `ModuleNotFoundError: No module named '...'`, it usually means your Jupyter session is using an outdated snapshot of the Nix environment.

**Why this happens:**
Nix environments are immutable. When we update `flake.nix` (e.g., adding a new package like `qrcode`), the environment effectively becomes a "new" one. An already-running Jupyter server or kernel won't automatically see these changes because it's still linked to the "old" environment path in the `/nix/store`.

**How to fix it:**
1.  **Restart the Kernel:** In VS Code or Jupyter, go to the Kernel menu and select **"Restart Kernel"**.
2.  **Re-select & Refresh:** Click on the kernel name in the top right. If you don't see the new environment, **click the "Refresh" button** in the kernel selection list to force VS Code to scan for new Jupyter kernels (like the one created by Nix).
3.  **Reload Window (VS Code):** If the refresh doesn't work, run the command `Developer: Reload Window` from the Command Palette (`Cmd+Shift+P`) to force a complete environment refresh.

## 🧪 About AI in a Shell

AI in a Shell is an AI-native learning platform designed specifically for software engineers. We don't teach you how to build models from scratch; we teach you how to build robust, production-ready applications _using_ models. 

**Synapse**, our integrated AI mentor, is available within the platform to help guide you through these challenges using the Socratic method.

Visit [ai-in-a-shell.com](https://ai-in-a-shell.com) to start the full curriculum.
