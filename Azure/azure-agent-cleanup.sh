#!/bin/bash

#script to clean the self hosted agents on azure

# Array of directories
agents=("frkagent01" "frkagent02" "frkagent03" "frkagent04" "frkagent05")

# Remove _work and _diag directories for each agent
for agent in "${agents[@]}"; do
    cd "../$agent"
    rm -rf _work/* _diag/*
done
