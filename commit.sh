#!/bin/bash
DATE=$(date)
TEXT="Hotfix: $DATE"
git add .
git commit -m "$TEXT"
git push