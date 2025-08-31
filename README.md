# ButterNotes

A streamlined note-taking and todo management system for the terminal. Simple, fast, and focused.

## Features

- **Single file storage** - Everything in `notes.md` and `todos.md`
- **Interactive sub-prompts** - Dedicated modes for notes and todos
- **Mobile-friendly** - Markdown files sync with any mobile app
- **No dependencies** - Pure bash, works anywhere
- **Terminal-only** - Fast and lightweight

## Quick Start

```bash
git clone https://github.com/yourusername/butternotes.git
cd butternotes
./install.sh
```

Then just run `b` to start:

```bash
$ b
🧈 Butter - Interactive Mode
butter> n              # Enter notes mode
butter/notes> Hello world
✅ Note added
butter/notes> ..       # Back to main
butter> q              # Quit
```

## Usage

### Interactive Mode
- `b` - Launch butter
- `n` - Notes mode (`a` add, `l` list, `e` edit, `..` back)
- `t` - Todos mode (`a` add, `l` list, `d` done, `..` back)
- `q` - Quit

### Direct Commands
```bash
butter "Quick note"
butter todo "Task to do"
butter list
butter todos
```

## Philosophy

ButterNotes follows the Unix philosophy: do one thing and do it well. It's designed around two simple files:
- `notes.md` - All your notes, timestamped and appended
- `todos.md` - Your task list with persistent numbering

No categories, no folders, no complexity. Just capture thoughts and track tasks.

## Installation

Run `./install.sh` for interactive setup, or manually:

1. Add `bin/` to your PATH
2. Source the provided aliases
3. Start with `b`

## License

MIT