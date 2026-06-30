---
title: Combinatorial High-throughput Analysis & Optimization for Synthesis
shortTitle: CHAOS
order: 4
category: Database Engineering
year: 2024
draft: false
blurb: A federated network of databases for searching large combinatorial spaces.
summary: >-
  A federated, provenance-preserving database of high-throughput DFT
  computations — queryable in AFLUX or natural language — feeding GNN models
  for materials discovery.
role: Lead Engineer
stack:
  - C++
  - SQLite
  - AFLUX
  - RAG
link:
  label: Read the Paper
  href: 'https://s4e.ai/chaos.html'
screenshots:
  - caption: CHAOSGPT — natural-language search over the federated database (RAG).
    src: '../../media/ChaosGPT.png'
---

CHAOS — *Combinatorial High-throughput Analysis & Optimization for Synthesis* — is
a **federated** database for searching the enormous combinatorial space of
inorganic materials. With **200+ queryable elements** across more than
**200,000 publicly available DFT computations**, the space of possible queries is
vast; CHAOS makes it searchable without forcing any contributor to surrender their
data.

That federation is the core design choice. Rather than pooling everything into one
central store, each institution keeps and serves its **own** database. Data stays
owned, can be **retracted** if needed, and remains **traceable for proper
attribution** — and a researcher can search across the whole network at once or
scope a query to a single source.

Under the hood CHAOS is forked from **AFLOW** and speaks its **AFLUX** query
language, inheriting a mature, well-specified interface to high-throughput
materials data. The system is written in **C++** for the heavy compute and
high-volume ingestion the pipeline demands, with **SQLite** as the per-node store —
lightweight enough to deploy identically across every database in the federation.

CHAOS is the front of a discovery pipeline, not the end of it. Its computations
feed a **graph neural network** that predicts **formation energy and magnetic
moments** for **High-Entropy Oxides**, generating candidate lattice-structure
predictions for synthesis.

**CHAOSGPT** is a second way in. Instead of writing AFLUX, a researcher can ask in
plain language; a **RAG** layer interprets the question, narrows it to the relevant
queryable elements, and issues a tighter, more efficient search against the
database. It currently runs on **Gemini-Flash-2.5 via OpenRouter**, with a path
toward locally hosting a comparable open model (Qwen or Llama) for full
self-sufficiency.

The system is **online** — browsable at the link above and accessible
programmatically through the web API — with the paper currently in **preprint**. As
lead engineer I built the C++ core, manage the web interface, and implemented the
CHAOSGPT RAG system.

> To use CHAOS visit: [s4e.ai](https://s4e.ai/chaos.html)
