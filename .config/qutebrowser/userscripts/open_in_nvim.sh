#!/bin/bash
export QUTE_FIFO
echo 'hint inputs --first' >> "$QUTE_FIFO"
sleep 0.1
echo 'edit-text' >> "$QUTE_FIFO"
