
# AI Forex Market Analyst — Local RAG System

**Status:** Prototype / Portfolio Project
**Author:** Yamkela Macwili

---

## **Project Overview**

The **AI Forex Market Analyst** is a **local, CPU-friendly Retrieval-Augmented Generation (RAG) system** designed to provide **reasoned market insights** for Forex trading pairs like **EURUSD, GBPUSD, USDJPY, and XAUUSD**.

It is **not a trading bot** and does **not provide buy/sell signals**. Instead, it serves as an **AI market research assistant**, grounding its answers in historical data, macroeconomic context, news sentiment, and technical indicators.

**Key capabilities:**

* Retrieve recent market news and macroeconomic data
* Explain daily and weekly market movements
* Identify macro drivers like USD strength, inflation, and central bank policy
* Combine technical analysis with macro context
* Produce **grounded, referenceable reasoning** to aid trading decisions

---

## **Features**

| Feature                   | Description                                                                                 |
| ------------------------- | ------------------------------------------------------------------------------------------- |
| **Hybrid Retrieval**      | Combines semantic vector search (FAISS) with keyword search (BM25)                          |
| **LLM Grounding**         | Ollama-compatible LLMs (DeepSeek Coder 6.7B / Qwen 2.5B-Coder) grounded with retrieved data |
| **Market Context Engine** | Converts raw price and macro data into interpretable signals                                |
| **Incremental Updates**   | New market data, news, and events can be ingested without full rebuild                      |
| **Evaluation Framework**  | Metrics for retrieval accuracy, hallucination rate, and reasoning quality                   |
| **Portfolio-Friendly**    | Fully local, CPU-compatible, and structured for demonstration                               |

---

## **System Architecture**

```
User Query
 ↓
Query Processing & Classification
 ↓
Hybrid Retrieval (FAISS + BM25 + Metadata Filter)
 ↓
Candidate Reranking (Cross-Encoder)
 ↓
Context Packing (Top 6–10 Chunks)
 ↓
LLM Reasoning Layer (Ollama)
 ↓
Grounded Market Analysis Answer
```

**Core Modules:**

* `modules/ingestion` → Collects news, economic events, and historical market data
* `modules/processing` → Cleans, normalizes, and computes technical indicators
* `modules/knowledge` → Generates hierarchical chunks with metadata
* `modules/retrieval` → Hybrid vector + keyword search engine
* `modules/reranker` → Improves candidate chunk relevance
* `modules/market_context` → Summarizes market signals and trends
* `modules/llm` → LLM reasoning interface, grounding prompts
* `modules/evaluation` → Metrics and automated testing framework
* `modules/utils` → Shared utilities, logging, and helpers

---

## **Installation**

**Clone repository:**

```bash
git clone https://github.com/username/ai_forex_rag.git
cd ai_forex_rag
```

**Setup Python environment:**

```bash
python -m venv venv
source venv/bin/activate   # Linux / macOS
venv\Scripts\activate      # Windows
pip install -r requirements.txt
```

**Optional:** Use `scripts/create_structure.sh` to generate folder layout.

---

## **Quick Start**

### **1. Ingest Data**

```bash
python scripts/run_ingestion.py
```

* Fetches market data, economic events, and financial news
* Computes technical indicators
* Generates hierarchical chunks

### **2. Query the System**

```bash
python scripts/run_llm_query.py --query "What is expected for XAUUSD this week?"
```

* Retrieves relevant chunks
* Packs context for LLM
* Returns **grounded market analysis**

### **3. Evaluate System**

```bash
python scripts/run_evaluation.py
```

* Measures retrieval accuracy, grounding, and hallucination rates
* Generates logs and performance reports

---

## **Folder Structure**

```text
ai_forex_rag/
├── data/
│   ├── raw/
│   ├── processed/
│   └── embeddings/
├── scripts/
│   ├── run_ingestion.py
│   ├── run_retrieval.py
│   ├── run_evaluation.py
│   └── run_llm_query.py
├── modules/
│   ├── ingestion/
│   ├── processing/
│   ├── knowledge/
│   ├── retrieval/
│   ├── reranker/
│   ├── market_context/
│   ├── llm/
│   ├── evaluation/
│   └── utils/
├── notebooks/
├── logs/
├── README.md
└── .gitignore
```

---

## **Example Queries**

* “Why is gold dropping today?”
* “How does USD strength affect EURUSD?”
* “Upcoming macro events affecting GBPUSD this week”
* “Weekly technical and macro outlook for XAUUSD”

**Example output:**

> "Gold may face selling pressure this week due to upcoming US CPI data and strong USD momentum. Historically, higher inflation strengthens the dollar, which often pushes gold lower."

---

## **Technologies & Tools**

| Component       | Technology / Library                                                      |
| --------------- | ------------------------------------------------------------------------- |
| LLM             | Ollama DeepSeek Coder 6.7B / Qwen2.5B-Coder                               |
| Vector DB       | FAISS                                                                     |
| Keyword Search  | Whoosh (BM25)                                                             |
| Data Sources    | Yahoo Finance, Alpha Vantage, FRED, ForexFactory Calendar, RSS news feeds |
| Data Processing | pandas, numpy, TA-Lib, yfinance                                           |
| API / Scripts   | Python 3.10+                                                              |
| Logging         | standard `logging` module                                                 |
| Notebook Demos  | Jupyter / IPython                                                         |

---

## **Portfolio / Blog-Friendly Features**

* Notebook demonstrations of ingestion & retrieval pipelines
* Visualizations of market context signals (USD index, volatility, support/resistance)
* Blog posts about:

  * “Designing a CPU-Friendly RAG System for Forex Analysis”
  * “Grounding LLMs with Real Market Data”
  * “Hybrid Vector + BM25 Retrieval in Financial Applications”

---

## **Roadmap & Milestones**

| Phase   | Goal                                      |
| ------- | ----------------------------------------- |
| Phase 1 | Data ingestion & cleaning pipeline        |
| Phase 2 | Knowledge chunking & embedding generation |
| Phase 3 | Hybrid retrieval + reranker setup         |
| Phase 4 | Market context engine development         |
| Phase 5 | LLM reasoning & grounded prompts          |
| Phase 6 | Evaluation framework & automated testing  |
| Phase 7 | Notebook demos & portfolio blogs          |

---

## **Notes & Limitations**

* System relies on **public data sources**; news latency may affect analysis
* CPU-only deployment limits LLM model size (6–7B recommended)
* Designed for **analysis and reasoning**, not trading execution
* Grounded retrieval prevents hallucination but may still miss obscure events

---

**Goal:** A fully local, reproducible, and explainable **AI market research assistant** for Forex that doubles as a **portfolio-grade technical project**.

---
