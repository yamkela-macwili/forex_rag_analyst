#!/bin/bash

# ===============================
# AI Forex Market Analyst Setup
# ===============================

echo "Setting up AI Forex Market Analyst environment..."

# -------- Create virtual environment --------
if [ ! -d ".venv" ]; then
    echo "Creating virtual environment..."
    python3 -m venv .venv
else
    echo "Virtual environment already exists."
fi

# Activate venv
source .venv/bin/activate

# -------- Upgrade pip --------
echo "Upgrading pip..."
pip install --upgrade pip

# -------- Install dependencies --------
if [ -f "requirements.txt" ]; then
    echo "Installing Python dependencies..."
    pip install -r requirements.txt
else
    echo "Requirements.txt not found. Please create one with required packages."
fi

# -------- Create .env template --------
ENV_FILE=".env"
if [ ! -f "$ENV_FILE" ]; then
    echo "Creating .env template for API keys..."
    cat <<EOL > $ENV_FILE
# API Keys for Market Data
FOREX_API_KEY=
MACRO_API_KEY=
NEWS_API_KEY=
# Ollama LLM config
OLLAMA_MODEL=deepseek-coder-6.7B
OLLAMA_HOST=http://localhost:11434
EOL
    echo ".env created. Fill in your API keys before running ingestion."
else
    echo ".env already exists."
fi

# -------- Optional: Download sample historical data --------
DATA_DIR="data/raw/sample"
mkdir -p $DATA_DIR

if [ ! -f "$DATA_DIR/XAUUSD_sample.csv" ]; then
    echo "Downloading sample XAUUSD historical data..."
    curl -o "$DATA_DIR/XAUUSD_sample.csv" "https://www.dukascopy.com/datafeed/XAUUSD/sample.csv"
else
    echo "Sample data already exists."
fi

# -------- Completion message --------
echo "✅ Setup complete!"
echo "Activate environment: source venv/bin/activate"
echo "Edit .env with your API keys, then run ingestion: python scripts/run_ingestion.py"