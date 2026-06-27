---
title: Examining Long-tailed Compositional Reasoning
order: 1
category: NLP Research
year: 2026
draft: false
blurb: Probing language models failure on multi-step reasoning on uncommon data.
summary: >-
  A study of inference-time reasoning on the long tail: the rare,
  compositionally novel data where large models often hallucinate.
role: Lead researcher
stack:
  - PyTorch
  - vLLM
  - Inference-time scaling
link:
  label: Read the paper
  href: '#'
screenshots:
  - caption: Accuracy across compositional depth, head vs. long-tail splits.
---

This project examines how language models handle **compositional
reasoning** at the long tail of the pre-train distribution. Models 
are trained on all data but their parametric and non-parametric 
memory fails to remember unfamiliar data. This paper focuses on how 
well a model is able to reason within these constraints.

The work pairs a controlled evaluation suite with inference-time
interventions, isolating where reasoning traces diverge from correct
composition and what scaling the inference budget actually buys.

