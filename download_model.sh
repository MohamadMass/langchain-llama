#!/bin/bash

# Directory where the model will be saved
MODEL_DIR="model"

# Model URL
MODEL_URL="https://huggingface.co/TheBloke/OpenOrca-Platypus2-13B-GGUF/resolve/main/openorca-platypus2-13b.Q4_K_M.gguf?download=true"

# Create the directory if it doesn't exist
if [ ! -d "$MODEL_DIR" ]; then
    mkdir "$MODEL_DIR"
fi

# Download the model using wget
wget -O "$MODEL_DIR/openorca-platypus2-13b.gguf" "$MODEL_URL"

echo "Download complete. Model saved in $MODEL_DIR"
