#!/usr/bin/env bash

# bring docker online (background)
docker-compose up -d

# launch in browser
sleep 2
python -m webbrowser http://localhost:8000

# regen assets and watch for changes
make watch
