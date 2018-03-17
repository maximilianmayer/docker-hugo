#!/usr/bin/env sh


echo "running hugo  in $HUGO_MODE mode"

if [[ $HUGO_MODE == "server" ]]; then
  hugo server --bind="0.0.0.0" --port=1313
elif [[ $HUGO_MODE == "build" ]]; then
  hugo --destination public/
fi
