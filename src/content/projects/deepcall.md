---
title: Deepcall
order: 2
category: Recommender Systems
year: 2025
draft: false
blurb: Active learning recomendation system trained on per user modeling
summary: >-
  A recommendation engine built around user networks and outreach fighting against user churn rate.
role: ML Engineer
stack:
  - Python
  - Pytorch
  - PyG
link:
  label: View the Repository
  href: '#'
screenshots:
  - caption: Candidate ranking surface with score attribution.
---

Deepcall is a recommender system oriented around reaching users at an individual
level, reducing overall churn rate. Uses population of similar users and a history of interactions for accurate predictions of user baskets. 

The model combines learned embeddings with an interpretable ranking layer,
so each recommendation carries a legible reason rather than an opaque score.
