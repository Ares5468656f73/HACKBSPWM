#!/usr/bin/env bash

#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"


OPENAI_API_KEY="your key"
echo -e "${blueColour} ${endColour} ${yellowColour}Input${endColour} ${redColour} ${endColour}" 
read message

curl https://api.openai.com/v1/chat/completions \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $OPENAI_API_KEY" \
  -d "{
     \"model\": \"gpt-4o-mini\",
     \"messages\": [{\"role\": \"user\", \"content\": \"$message\"}],
     \"temperature\": 0.7
   }"

