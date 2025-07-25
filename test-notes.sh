#!/bin/bash

# Test wrapper for ButterNotes
# Uses test-notes directory and test config

export BUTTER_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Override config file
cp "$BUTTER_ROOT/config/test-notes.conf" "$BUTTER_ROOT/config/notes.conf.bak" 2>/dev/null
cp "$BUTTER_ROOT/config/test-notes.conf" "$BUTTER_ROOT/config/notes.conf"

# Run notes
"$BUTTER_ROOT/bin/notes"

# Restore original config
mv "$BUTTER_ROOT/config/notes.conf.bak" "$BUTTER_ROOT/config/notes.conf" 2>/dev/null