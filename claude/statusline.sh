#!/bin/bash
input=$(cat)

# Extract values
MODEL=$(echo "$input" | jq -r '.model.display_name // "Unknown"')
COST=$(echo "$input" | jq -r '.cost.total_cost_usd // 0')
INPUT_TOKENS=$(echo "$input" | jq -r '.context_window.total_input_tokens // 0')
OUTPUT_TOKENS=$(echo "$input" | jq -r '.context_window.total_output_tokens // 0')
CONTEXT_SIZE=$(echo "$input" | jq -r '.context_window.context_window_size // 200000')

# Calculate context usage
TOTAL_TOKENS=$((INPUT_TOKENS + OUTPUT_TOKENS))
if [ "$CONTEXT_SIZE" -gt 0 ]; then
    PERCENT_USED=$((TOTAL_TOKENS * 100 / CONTEXT_SIZE))
else
    PERCENT_USED=0
fi

# Format cost
COST_FMT=$(printf '%.4f' "$COST")

# Format token counts (K for thousands)
if [ "$INPUT_TOKENS" -ge 1000 ]; then
    IN_FMT=$(echo "scale=1; $INPUT_TOKENS / 1000" | bc)K
else
    IN_FMT=$INPUT_TOKENS
fi

if [ "$OUTPUT_TOKENS" -ge 1000 ]; then
    OUT_FMT=$(echo "scale=1; $OUTPUT_TOKENS / 1000" | bc)K
else
    OUT_FMT=$OUTPUT_TOKENS
fi

echo "[$MODEL] \$$COST_FMT | ${PERCENT_USED}% ctx | in:$IN_FMT out:$OUT_FMT"
