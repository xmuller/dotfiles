#!/bin/bash

date="$(date +"%F, %a %l:%M:%S%p"| sed 's/  / /g')"
echo -e "$date"
