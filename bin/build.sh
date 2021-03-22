#!/bin/bash
set -e

if [ -d "./dist" ]; then
  rm -r ./dist
fi

npm install
npm run dev
