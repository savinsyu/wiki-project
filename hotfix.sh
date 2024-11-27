#!/bin/bash
DATE=$(date)
TEXT="Hotfix: $DATE"
git add .
git commit -m "$TEXT"
git push
time=$(date +%s)
echo $(($(date +%s)-$time))