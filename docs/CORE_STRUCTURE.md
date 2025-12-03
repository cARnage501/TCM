# TCM — CORE.STRUCTURE

## 0. Definition

TCM is a **small, local reasoning engine** built on top of an open-source base model.  
It is designed to act as a structured cognitive assistant, not a personality replica.  
Its purpose is to support coherent planning, reasoning, memory organization, and structured output.

---

## 1. Core Design Principles (Non-Negotiable)

1. **Structured Reasoning**  
   - Prioritize clarity, compression, and stable logic chains.

2. **Local-First Architecture**  
   - Runs on local hardware when possible.  
   - Minimizes external dependencies.

3. **Mode-Based Behavior**  
   - One engine, multiple “lenses” for different tasks.

4. **Composable System**  
   - Core engine + modular layers.  
   - Each layer removable or upgradable without breaking the whole.

5. **Continuity & Self-Calibration**  
   - Organized memory.  
   - Consistent context handling.  
   - Ability to refine based on user feedback.

---

## 2. High-Level Architecture (5-Layer Stack)

### 2.1 Base Model Layer — “The Engine”
- Small open-source model (3B–7B scale).  
- Performs raw reasoning and token prediction.  
- Unmodified beyond standard fine-tunes.

### 2.2 Instruction Layer — “The Cognitive Skeleton”
Includes:
- A system prompt defining reasoning expectations.  
- A curated training/fine-tuning dataset (TCM dataset).  
- Mode instructions that change behavior depending on the task.

Purpose: Shape the base model into a predictable reasoning style.

### 2.3 Orchestrator Layer — “The Conductor”
Handles:
- Selecting the correct mode for each request.  
- Managing context assembly.  
- Integrating memory.  
- Collecting user feedback for future refinement.

This layer is logical, not emotional — just routing and control.

### 2.4 Memory & Context Layer — “The Spine”
Three tiers:

1. **Short-Term Context**  
   - Active session goals, constraints, recent exchanges.

2. **Medium-Term Project Memory**  
   - Per-project logs.  
   - Summaries.  
   - Task states.

3. **Long-Term Canonical Documents**  
   - Core architecture.  
   - Operating principles.  
   - Project definitions.  
   - Reference materials.

Simple to start (text files, JSON, markdown).  
Can evolve into embedding-based retrieval later.

### 2.5 Interface Layer — “User Interaction Surface”
Three forms:

1. **Console / REPL**  
   - Development and deep work.

2. **Mode Tags or UI**  
   Examples:  
   - `[MIRROR]`  
   - `[ARCHITECT]`  
   - `[GREMLIN]`  
   - `[LIBRARIAN]`  
   - `[COMPILER]`

3. **Batch / Background Runs**  
   - Summaries  
   - Cleanups  
   - Context consolidation

Interface is thin. Core logic sits in previous layers.

---

## 3. Primary Operating Modes (Behavioral Lenses)

### 0. Logic Consult
Purpose: adversarial logical auditor; evaluates claims and structure.  
Behavior: extracts propositions, lists unknowns, proposes models, weighs support, calls contradictions, and concludes with the best-supported interpretation plus explicit gaps.

### 1. Mirror
Purpose: reflection, clarity, evaluating internal states.  
Behavior: concise, analytical, neutral.

### 2. Architect
Purpose: plans, blueprints, decomposition.  
Behavior: structured, hierarchical, systematic.

### 3. Gremlin
Purpose: creativity, idea generation, exploratory thinking.  
Behavior: playful, generative, flexible.

### 4. Librarian
Purpose: retrieval, summarization, cross-linking.  
Behavior: organized, calm, information-dense.

### 5. Compiler
Purpose: turn raw or messy input into clean artifacts.  
Behavior: compressive, output-focused, strict formatting.

Modes are not personalities — they are functional stances.

---

## 4. Development Phases

### v0.1 — Static Core
- Base model  
- TCM instruction prompt  
- Initial dataset  
- Manual mode selection

### v0.2 — Orchestrated Core
- Basic orchestration  
- Automatic mode routing  
- Context management

### v0.3 — Memory Core
- Structured working memory  
- Project logs & summaries  
- Mode reasoning refinements

### v1.0 — Fully Integrated Core
- Stable mode transitions  
- Reliable context usage  
- Coherent memory system  
- Predictable outputs  
- Core structure finalized

---

## 5. Summary Line

TCM is a modular, mode-driven reasoning engine built on a small local model, guided by structured instructions, controlled by a lightweight orchestrator, supported by a layered memory system, and accessed through a thin interface for clarity, planning, creativity, and organization.
