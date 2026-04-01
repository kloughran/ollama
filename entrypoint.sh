#!/bin/bash

ollama serve &
pid=$!

# Wait for server to be ready
until curl -sf http://localhost:11434/api/tags > /dev/null 2>&1; do
    sleep 1
done

# Pull model if not already present
if ! ollama list | grep -q "llama3.2:3b"; then
    echo "Pulling llama3.2:3b..."
    ollama pull llama3.2:3b
fi

wait $pid
