#!/bin/bash
# Installs draw.io desktop CLI, Graphviz and xvfb for the drawio-skill (cloud sessions).
# Export usage: xvfb-run -a drawio -x -f png --no-sandbox -o out.png in.drawio
set -e
command -v drawio >/dev/null && command -v dot >/dev/null && exit 0
apt-get update -qq
apt-get install -y -qq graphviz xvfb
tag=$(git ls-remote --tags --refs https://github.com/jgraph/drawio-desktop | sed 's|.*refs/tags/||' | sort -V | tail -1)
curl -sSL -o /tmp/drawio.deb "https://github.com/jgraph/drawio-desktop/releases/download/$tag/drawio-amd64-${tag#v}.deb"
apt-get install -y -qq /tmp/drawio.deb
