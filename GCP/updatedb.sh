#!/bin/bash
if [ -z "$3" ]; then
    echo "incomplete params"
    echo "./updatedb.sh <project> <instnace> <policy>"
    exit 1
fi
PROJECT=$1
SQL=$2
POLICY=$3
echo "db "$PROJECT"/"$SQL" update request with flag "$POLICY
gcloud sql instances patch $SQL --project $PROJECT --activation-policy $POLICY
