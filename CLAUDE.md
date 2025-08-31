# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

ButterNotes is a streamlined note-taking and todo management system for the terminal. It features clean sub-prompts for notes and todos, with mobile-friendly markdown storage.

## Architecture

### Core Components
- `bin/butter` - Main CLI entry point with interactive mode
- `lib/note.bash` - Note management functions
- `lib/todo.bash` - Todo management with consistent numbering
- `config/butter.conf` - User configuration

### Key Design Principles
- **Plain text storage** - `.md` files for mobile compatibility
- **Terminal-focused** - Clean, fast terminal interface
- **Consistent numbering** - Todos keep numbers when completed
- **Sub-prompts** - Dedicated modes for notes and todos
- **Suckless philosophy** - Simple, does one thing well

## File Structure

```
~/GitHub/butternotes/
├── bin/
│   └── butter           # Main entry point
├── lib/
│   ├── note.bash        # Note functions
│   └── todo.bash        # Todo functions
├── config/
│   └── butter.conf      # Configuration
└── install.sh           # Interactive installer

~/Documents/ButterNotes/  # Default storage (configurable)
├── notes.md             # All notes with timestamps
└── todos.md             # All todos (markdown checkboxes)
```

## Usage

### Interactive Mode
```bash
$ b                    # Start butter
butter> n              # Enter notes mode
butter/notes> l        # List notes
butter/notes> ..       # Back to main
butter> q              # Quit
```

### Direct Commands
```bash
butter "Add a note"
butter todo "Add a todo"
butter list
butter todos
```

### Navigation
- In sub-prompts: `..` goes back to main menu
- In main menu: `q` quits
- Single-letter commands: `a` (add), `l` (list), `e` (edit), etc.

## Installation

```bash
./install.sh  # Interactive setup with path selection
```

## Shell Integration

Add to your `~/.bashrc`:
```bash
source ~/.config/bash/butter-aliases.bash
```

Provides aliases:
- `b` - Launch butter
- `note` - Add note
- `notes` - List notes  
- `todo` - Add todo
- `todos` - List todos