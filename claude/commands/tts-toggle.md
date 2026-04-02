---
description: Toggle TTS on/off globally
---

Toggle TTS globally. Run:

```bash
if [ -f ~/.claude/.ignore/tts-off ]; then rm ~/.claude/.ignore/tts-off && echo "TTS ON"; else mkdir -p ~/.claude/.ignore && touch ~/.claude/.ignore/tts-off && echo "TTS OFF"; fi
```

Report the result.
