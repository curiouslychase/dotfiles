#!/usr/bin/env bun
import prompts from 'prompts';
import { spawn } from 'child_process';

const SESSION_NAME = 'worktrees';

interface TmuxWindow {
  id: string;
  name: string;
  active: boolean;
}

// Get all windows in the worktrees tmux session
function listSessions(): TmuxWindow[] {
  const result = Bun.spawnSync(['tmux', 'list-windows', '-t', SESSION_NAME, '-F', '#{window_id}|#{window_name}|#{window_active}']);

  if (result.exitCode !== 0) {
    return [];
  }

  const output = result.stdout.toString().trim();
  if (!output) return [];

  return output.split('\n').map((line) => {
    const [id, name, active] = line.split('|');
    return { id, name, active: active === '1' };
  });
}

// Create tmux session if it doesn't exist
function ensureSession(): void {
  const result = Bun.spawnSync(['tmux', 'has-session', '-t', SESSION_NAME]);
  if (result.exitCode !== 0) {
    Bun.spawnSync(['tmux', 'new-session', '-d', '-s', SESSION_NAME, '-n', 'main']);
  }
}

// Attach to a specific window
function attachToWindow(windowName: string): void {
  ensureSession();

  // Select the window
  Bun.spawnSync(['tmux', 'select-window', '-t', `${SESSION_NAME}:${windowName}`]);

  // Attach to the session
  const child = spawn('tmux', ['attach-session', '-t', SESSION_NAME], {
    stdio: 'inherit',
  });

  child.on('exit', (code) => {
    process.exit(code || 0);
  });
}

// Create a new worktree session
async function createNewSession(): Promise<void> {
  const response = await prompts([
    {
      type: 'select',
      name: 'tool',
      message: 'Which AI tool?',
      choices: [
        { title: 'Claude Code', value: 'claude' },
        { title: 'Codex', value: 'codex' },
        { title: 'Amp', value: 'amp' },
      ],
    },
    {
      type: 'text',
      name: 'suffix',
      message: 'Branch name suffix:',
      initial: 'feature',
    },
  ]);

  if (!response.tool || !response.suffix) {
    return;
  }

  // Get the dotfiles repo root (go up from ai-sessions)
  const scriptDir = import.meta.dir;
  const dotfilesRoot = `${scriptDir}/../../..`;

  // Call the create-ai-worktree script
  const createScript = `${dotfilesRoot}/main/scripts/create-ai-worktree`;
  const result = Bun.spawnSync([createScript, response.tool, response.suffix]);

  if (result.exitCode !== 0) {
    console.error('Failed to create worktree');
    console.error(result.stderr?.toString());
    return;
  }

  const worktreePath = result.stdout.toString().trim();
  const branchName = worktreePath.split('/').pop() || '';

  // Create tmux window
  ensureSession();

  const windowExists = Bun.spawnSync([
    'tmux',
    'list-windows',
    '-t',
    SESSION_NAME,
    '-F',
    '#{window_name}',
  ]).stdout.toString().includes(branchName);

  if (!windowExists) {
    Bun.spawnSync([
      'tmux',
      'new-window',
      '-t',
      SESSION_NAME,
      '-n',
      branchName,
      '-c',
      worktreePath,
    ]);

    // Launch AI tool in the window
    Bun.spawnSync([
      'tmux',
      'send-keys',
      '-t',
      `${SESSION_NAME}:${branchName}`,
      response.tool,
      'C-m',
    ]);
  }

  // Attach to the session
  attachToWindow(branchName);
}

// Kill a specific window
async function killSession(sessions: TmuxWindow[]): Promise<void> {
  const response = await prompts({
    type: 'select',
    name: 'window',
    message: 'Which session to kill?',
    choices: sessions.map((s) => ({
      title: s.name + (s.active ? ' (active)' : ''),
      value: s.name,
    })),
  });

  if (!response.window) return;

  Bun.spawnSync(['tmux', 'kill-window', '-t', `${SESSION_NAME}:${response.window}`]);
  console.log(`Killed session: ${response.window}`);
}

// Main menu
async function main(): Promise<void> {
  ensureSession();
  const sessions = listSessions();

  if (sessions.length === 0) {
    console.log('No active AI sessions found.');
    const response = await prompts({
      type: 'confirm',
      name: 'create',
      message: 'Create a new session?',
      initial: true,
    });

    if (response.create) {
      await createNewSession();
    }
    return;
  }

  const choices = [
    ...sessions.map((s) => ({
      title: `${s.active ? '● ' : '  '}${s.name}`,
      description: s.active ? 'Currently active' : 'Attach to this session',
      value: { action: 'attach', name: s.name },
    })),
    { title: '─'.repeat(40), disabled: true },
    {
      title: '+ Create new session',
      value: { action: 'create' },
    },
    {
      title: '✕ Kill a session',
      value: { action: 'kill' },
    },
  ];

  const response = await prompts({
    type: 'select',
    name: 'choice',
    message: 'AI Sessions Manager',
    choices,
  });

  if (!response.choice) return;

  switch (response.choice.action) {
    case 'attach':
      attachToWindow(response.choice.name);
      break;
    case 'create':
      await createNewSession();
      break;
    case 'kill':
      await killSession(sessions);
      break;
  }
}

main();
