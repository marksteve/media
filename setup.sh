#!/bin/sh
set -ex

PROJECT_ID=playground-163312
ZONE=us-west1-b

gcloud beta compute \
  scp --recurse \
  --project $PROJECT_ID \
  --zone $ZONE \
  cloudflared media:/tmp/cloudflared

for script in $(ls docker/*.sh)
do 
  gcloud beta compute ssh \
    --project $PROJECT_ID \
    --zone $ZONE \
    media < $script
done