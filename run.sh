#!/usr/bin/env sh


echo "running hugo  in $HUGO_MODE mode"

if [[ $HUGO_MODE == "server" ]]; then
  ls -la src
  echo $PWD
  hugo server --bind="0.0.0.0" --port=1313 --source src/
elif [[ $HUGO_MODE == "build" ]]; then
  hugo --source "src/" --destination public/
fi
