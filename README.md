# Synapse AI Engineering Labs

Practical, hands-on labs for transitioning from software engineering to AI engineering.

These labs are part of the core curriculum at [AI in a Shell](https://ai-in-a-shell.com).

## 🚀 Lab Roadmap

### Phase 1: AI-Native Engineering Mindset

- **[01-mindset-challenge.ipynb](./ai-native-engineer/01-ai-engineering-mental-models/01-mindset-challenge.ipynb):** Bridge the gap between probabilistic models and deterministic code. Learn to measure latency, calculate cost, and build defensive boundaries for AI components.

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

## 🧪 About Synapse

Synapse is an AI-native learning platform designed specifically for software engineers. We don't teach you how to build models from scratch; we teach you how to build robust, production-ready applications _using_ models.

Visit [ai-in-a-shell.com](https://ai-in-a-shell.com) to start the full curriculum.
