#!/bin/sh

if [[ $NAME == "" ]]; then
  read -p "What is your name again? (export NAME to automate this) "

  if [[ $REPLY == "" ]]; then
    echo "Need to know your name.\n"
    exit 1
  else
    NAME=$REPLY
  fi
fi

# # otherwise links are opened within iframe
# sed -e 's/href="[^"]*"/& target="_blank"/g' resume.html > resume-to-embed.html

template=$(<index.html.template)
echo "${template//%NAME%/$NAME}" > index.html
