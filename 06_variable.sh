#!/bin/bash
useradd krishna
touch sample.txt
vi sample.txt
echo "My name is sai"
chgrp harsha sample.txt
usermod -aG harsha harsha