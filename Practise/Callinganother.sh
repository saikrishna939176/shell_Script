#!/bin/bash
Course="Devops from current script"

echo "Before calling other script, course: $Course"
echo "process ID of current shell script:: $$"

source ./otherscript.sh
echo "After calling other script, course: $Course"