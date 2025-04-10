#!/bin/bash

count=$(dnf check-update --refresh 2>/dev/null | grep -E '^[a-zA-Z0-9]' | wc -l)

if [ "$count" -eq 0 ]; then
    echo " Fedora is up-to-date"
else
    echo " $count atualizações disponíveis"
fi

