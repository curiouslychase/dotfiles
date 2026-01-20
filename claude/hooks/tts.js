#!/usr/bin/env node
const { exec } = require('child_process');
const fs = require('fs');
const os = require('os');
const path = require('path');

// Read hook input from stdin
let input = '';
process.stdin.on('data', chunk => input += chunk);
process.stdin.on('end', async () => {
  try {
    const data = JSON.parse(input);
    const sessionId = data.session_id;
    const transcriptPath = data.transcript_path;

    // Check if TTS is muted for this session
    if (sessionId) {
      const muteFile = path.join(os.homedir(), '.claude', '.ignore', 'tts', sessionId);
      if (fs.existsSync(muteFile)) {
        process.exit(0);
      }
    }

    if (!transcriptPath || !fs.existsSync(transcriptPath)) {
      process.exit(0);
    }

    // Read JSONL transcript file and find last assistant message
    const lines = fs.readFileSync(transcriptPath, 'utf8').trim().split('\n');
    let text = '';

    for (let i = lines.length - 1; i >= 0; i--) {
      try {
        const entry = JSON.parse(lines[i]);
        if (entry.type === 'assistant' && entry.message?.content) {
          const content = entry.message.content;
          if (typeof content === 'string') {
            text = content;
          } else if (Array.isArray(content)) {
            text = content
              .filter(c => c.type === 'text')
              .map(c => c.text)
              .join(' ');
          }
          if (text.trim()) break;
        }
      } catch (e) {
        continue;
      }
    }

    if (!text.trim()) {
      process.exit(0);
    }

    // Truncate long responses
    const maxChars = 500;
    if (text.length > maxChars) {
      text = text.slice(0, maxChars) + '... truncated.';
    }

    // Escape for shell
    const escaped = text.replace(/'/g, "'\\''");

    // Platform-specific TTS (all offline)
    const platform = os.platform();
    let cmd;

    if (platform === 'darwin') {
      // macOS: built-in say
      cmd = `say '${escaped}'`;
    } else if (platform === 'linux') {
      // Linux: espeak-ng (install: sudo apt install espeak-ng)
      cmd = `espeak-ng '${escaped}'`;
    } else if (platform === 'win32') {
      // Windows: PowerShell SAPI
      cmd = `powershell -Command "Add-Type -AssemblyName System.Speech; (New-Object System.Speech.Synthesis.SpeechSynthesizer).Speak('${escaped.replace(/'/g, "''")}')"`;
    } else {
      process.exit(0);
    }

    exec(cmd, (err) => {
      if (err) console.error('TTS error:', err.message);
    });
  } catch (e) {
    console.error('Hook error:', e.message);
    process.exit(1);
  }
});
