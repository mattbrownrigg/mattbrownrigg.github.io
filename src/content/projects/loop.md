---
title: Learning and Optimization Platform
shortTitle: LOOP
order: 3
category: Database Engineering
year: 2025
draft: false
blurb: Infrastructure that turns scattered experiments into integrated, queryable records.
summary: >-
  A platform that serves as the connective tissue between literature,
  computation, and experimentation — capturing the metadata that materials
  prediction depends on.
role: Lead Engineer
stack:
  - Python
  - Django
  - MongoDB
  - Atlas Vector Search
link:
  label: Visit LOOP
  href: 'https://s4e.ai/loop/'
screenshots:
  - caption: Discretized experiment record — steps, embeddings, and content-hash lineage.
---

LOOP — the **Learning and Optimization Platform** — is the connective tissue of a
materials-discovery pipeline, built so the metadata most critical to prediction
never dies in a lab notebook or an unshared spreadsheet again. It serves two
audiences at once: **experimentalists**, who need a frictionless place to record
what they made and measured, and **ML researchers**, who need that record as clean,
vectorizable signal for predictive models.

The platform closes a loop. ML researchers mine literature and run DFT
computations to propose theoretical materials; experimentalists synthesize and
characterize those candidates, then upload their results; that experimental data
flows back to inform the next generation of computational models. Literature —
pulled from anywhere — continually fuels new ideas and new computations, so the
**computational–experimental cycle sustains itself** rather than stalling at any
single handoff.

Before LOOP, the metadata essential to materials prediction lived in logbooks and
hard-to-reach Excel files; there was no central store, and every disconnected
record was signal the models never saw. LOOP parses experimental work into
**discretized steps**, turning loose process notes into structured records an ML
pipeline can read directly.

The stack is deliberately pragmatic. **Django** keeps the platform easy to deploy
and operate; **MongoDB** stores the data as documents with the dense relations
that map naturally onto how models consume it. On top, **sentence embeddings**
indexed for **Atlas vector search** power semantic and related-material lookup —
finding experiments and materials by meaning rather than exact-match metadata.
**LLM-capable queries** and **batch uploading** let experimentalists search and
contribute without learning the system's internals, lowering the cost of capturing
data and, in turn, surfacing even more of it.

Provenance is enforced by **content hashing**, with optional literature-reference
linking so an experimentalist can tie a result back to the paper that inspired it —
any record traces cleanly to its origin.

LOOP sits above **CHAOS**, the computational database that serves the DFT
calculations LOOP draws on: CHAOS is the engine room for ML researchers, LOOP the
shared surface for everyone. The system is **live and in production** under active
development, today spanning **300 literature records, 60 experiments, and 200,000
computations**.

> Access LOOP at: [s4e.ai/loop](https://s4e.ai/loop/)