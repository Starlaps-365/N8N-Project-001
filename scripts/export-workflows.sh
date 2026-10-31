#!/bin/bash
set -e
echo "Exporting production workflows..."
docker exec n8n-production mkdir -p /tmp/export
docker exec n8n-production n8n export:workflow --all --separate --output=/tmp/export/
rm -rf workflows/production/*.json
docker cp n8n-production:/tmp/export/. ./workflows/production/
docker exec n8n-production rm -rf /tmp/export
echo "Exported $(ls workflows/production/ | wc -l) workflows"
ls -lh workflows/production/
