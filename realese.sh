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
tar -cf flask-project.tar * && 
mv flask-project.tar /r 
echo $(($(date +%s)-$time))