---
description: Toggle TTS on/off for this Claude session
---

Toggle TTS for this session. Run:

```bash
SESSION_ID=$(basename "$(ls -t ~/.claude/projects/-$(pwd | sed 's/[\/.]/-/g' | cut -c2-)/*.jsonl 2>/dev/null | grep -v '/agent-' | head -1)" .jsonl) && mkdir -p ~/.claude/.ignore/tts && if [ -f ~/.claude/.ignore/tts/$SESSION_ID ]; then rm ~/.claude/.ignore/tts/$SESSION_ID && echo "TTS ON"; else touch ~/.claude/.ignore/tts/$SESSION_ID && echo "TTS OFF"; fi
```

Report the result.
