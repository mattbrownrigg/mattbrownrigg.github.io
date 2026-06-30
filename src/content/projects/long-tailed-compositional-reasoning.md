---
title: Examining Long-tailed Compositional Reasoning
order: 1
category: NLP Research
year: 2026
draft: false
blurb: Testing whether multi-step reasoning actively erodes a model's recall of long-tail facts.
summary: >-
  A study of how compositional reasoning interacts with the long tail of the
  pre-training distribution — and the hypothesis that multi-hop reasoning makes
  rare-fact recall worse, not better.
role: Lead researcher
stack:
  - PyTorch
  - vLLM
  - Inference-time scaling
screenshots:
  - caption: Reasoning accuracy as a function of fact popularity (PopQA / GECE).
---

Large models are trained on everything, but they do not *know* everything
equally. Knowledge thins out toward the **long tail** of the pre-training
distribution — the rare entities and relations that appear too infrequently
to be reliably encoded in parametric memory. This project asks what happens
to that fragile tail knowledge the moment we ask a model to **reason** over it.

The central hypothesis runs against the usual intuition that more reasoning is
strictly better. Multi-hop, compositional reasoning is *itself* learned from
common data. So when a model chains inferences toward a rare fact, every hop is
biased toward the high-frequency associations that dominate pre-training: the
composition routes **through the head of the distribution** rather than the tail
it is trying to reach. The prediction follows directly — asking a model to reason
its way to a rare fact can be *worse* than asking for it outright, because
reasoning recruits the very priors that crowd the long tail out. Each additional
hop is another chance to detour into a plausible, common-data substitute before
the chain ever arrives.

Making this measurable means treating rarity as a continuous variable rather
than a binary head/tail cut. The long-tail construction draws on
popularity-graded sampling from **PopQA** and the **GECE** metric introduced in
*On the Role of Long-tail Knowledge in Retrieval-Augmented Large Language
Models*, so reasoning accuracy can be read directly against how rare a target
fact is.

> Status: early-stage research. The evaluation suite and intervention design are
> under active development; this page describes the thesis, not finished results.

