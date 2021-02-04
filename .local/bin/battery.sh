#!/bin/bash

acpi | cut -d "," -f 2 | sed 's/ //g'
