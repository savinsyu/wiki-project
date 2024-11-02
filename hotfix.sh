#!/bin/bash
DATE=$(date)
TEXT="Hotfix: $DATE"
git add .
git commit -m "$TEXT"
git push
time=$(date +%s)
tar -cf flask-project.tar * && 
mv flask-project.tar /o 
echo $(($(date +%s)-$time))