#!/usr/bin/env bash

OPENAI_API_KEY="your key"
read -p " Input  " message

curl https://api.openai.com/v1/chat/completions \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $OPENAI_API_KEY" \
  -d "{
     \"model\": \"gpt-4o-mini\",
     \"messages\": [{\"role\": \"user\", \"content\": \"$message\"}],
     \"temperature\": 0.7
   }"

