---
title: Deepcall
order: 2
category: Recommender Systems
year: 2025
draft: false
blurb: A continually-trained recommender that predicts each user's next meal basket to win back churning customers.
summary: >-
  A graph-based, self-attentive recommender that predicts a user's next meal
  basket — turning next-order prediction into targeted offers that re-engage
  customers before they churn.
role: Lead Developer
stack:
  - Python
  - PyTorch
  - PyG
  - SASRec
screenshots:
  - caption: Next-basket ranking with per-item linear-probe attribution.
---

Deepcall is a meal-recommendation engine built for one sharp business problem:
keeping customers from quietly churning. In food ordering, a lapsing user rarely
announces they are leaving — they simply stop coming back. Deepcall predicts the
**next basket** a user is most likely to order and uses that prediction to surface
a targeted offer for their *exact* dish, reaching at-risk and recently-lapsed
customers before their loyalty is gone. The name is the mandate: a deliberate call
back to the users worth re-engaging.

Ordering history is modeled as a graph. Each user is a root node whose
interactions branch outward — **user → basket → menu item** — so a single
customer's history becomes a connected subgraph rather than a flat event log. As
new dishes and orders arrive, the graph grows fresh item nodes and edges in place,
keeping the menu and customer base a living structure rather than a fixed
vocabulary.

On top of this sits a custom **SASRec** self-attentive sequential model over
learned embeddings, predicting the next order with a structural bias toward
well-formed baskets — building, main, sides, dessert — rather than isolated items.
Interpretability is not bolted on after the fact: **linear probes at every item
prediction** make each recommendation legible, so a candidate dish carries a
readable reason instead of an opaque score. The system trains **continuously**,
folding in new orders as data arrives so it tracks shifting tastes instead of
decaying against a stale snapshot.

Trained on **six years of ordering data — 14 million orders across 4 million
users** — Deepcall delivers a **115% lift over baseline**, an **NDCG@10 of 0.75**,
and a **15% reduction in churn**.

> Built as lead developer. The repository is private — the work is proprietary.
