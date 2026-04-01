FROM ollama/ollama

# Install Node.js and Claude Code
RUN apt-get update && apt-get install -y curl gnupg && \
    curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g @anthropic-ai/claude-code
	
RUN useradd -m claudeuser
USER claudeuser
WORKDIR /home/claudeuser

COPY entrypoint.sh /entrypoint.sh 
RUN chmod +x /entrypoint.sh 

ENTRYPOINT ["/entrypoint.sh"]