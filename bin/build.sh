#!/bin/bash
set -e

rm -r ./dist

npm install
npm run dev
