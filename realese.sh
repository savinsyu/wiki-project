#!/bin/bash
echo Привет, сообщи мне номер релиза?
read varname
echo Молодец релиз номер: $varname
DATE=$(date)
TEXT="Release#$varname"
git add .
git commit -m "$TEXT"
git push
time=$(date +%s)
echo $(($(date +%s)-$time))