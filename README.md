# 📝 Terminal Notes System

A lightweight, fast note-taking system built around fzf and your favorite editor. Integrates seamlessly with Neovim's markdown rendering capabilities.

## ✨ Features

- **🚀 Lightning fast** - fzf-powered fuzzy finding
- **📝 Template support** - Daily notes, meetings, custom templates
- **🔍 Full-text search** - Search through all note content with ripgrep
- **⌨️ Keyboard-driven** - No mouse required
- **🎨 Beautiful previews** - Uses bat for syntax highlighting
- **🔧 Configurable** - Customize paths, editor, templates

## 🛠️ Installation

1. **Prerequisites:**
   ```bash
   # Install required tools
   sudo apt install fzf ripgrep bat  # Ubuntu/Debian
   # or
   brew install fzf ripgrep bat      # macOS
   ```

2. **Add to PATH:**
   ```bash
   # Add to ~/.bashrc or ~/.zshrc
   export PATH="$HOME/ButterNotes/bin:$PATH"
   ```

3. **Reload shell:**
   ```bash
   source ~/.bashrc  # or ~/.zshrc
   ```

## 🚀 Usage

### Main Commands

| Command | Description |
|---------|-------------|
| `notes` | Browse all notes with fzf interface |
| `quick-note` | Create a new note with template selection |
| `note-search` | Search through note content |
| `note-sync` | Sync notes with Git or Nextcloud |

### Keyboard Shortcuts (in notes interface)

| Key | Action |
|-----|--------|
| `Enter` | Open selected note |
| `Ctrl-N` | Create new note |
| `Ctrl-D` | Delete selected note |
| `Ctrl-X` | Move/organize note |
| `Ctrl-S` | Search note content |
| `Ctrl-Y` | Sync notes |

## 📋 Templates

Built-in templates:
- **default.md** - Basic note template
- **daily.md** - Daily planning template with goals and tasks
- **meeting.md** - Meeting notes with agenda and action items

### Creating Custom Templates

1. Add `.md` files to `~/ButterNotes/templates/`
2. Use variables: `{{TITLE}}`, `{{DATE}}`
3. Access via `quick-note` template selection

## ⚙️ Configuration

Edit `~/ButterNotes/config/notes.conf`:

```bash
# Notes directory
NOTES_DIR="$HOME/notes"

# Editor (uses your nvim setup)
NOTES_EDITOR="nvim"

# File extension
NOTES_EXT="md"

# Enable preview
ENABLE_PREVIEW=true
```

## 🎯 Workflows

### Daily Notes
```bash
quick-note  # Choose daily template
# Creates: Daily-2024-01-15.md
```

### Quick Capture
```bash
quick-note "Meeting with John"  # Instant note creation
```

### Research & Search
```bash
note-search "project ideas"     # Find all notes mentioning this
notes                          # Browse and filter
```

### Integration with Neovim

The system automatically opens notes in nvim, giving you:
- ✅ Beautiful markdown rendering
- ✅ Live preview capabilities  
- ✅ Your existing keybindings
- ✅ All your configured plugins

## 🔧 Advanced Usage

### Aliases for Speed
```bash
# Add to ~/.bashrc
alias n='notes'
alias qn='quick-note'
alias ns='note-search'
alias dn='quick-note "Daily-$(date +%Y-%m-%d)" daily'
```

### Integration with Other Tools
```bash
# Rofi launcher
rofi -modi "notes:notes" -show notes

# Dmenu integration  
notes | dmenu | xargs nvim

# Quick daily note hotkey (i3wm/sway)
bindsym $mod+n exec quick-note "Daily-$(date +%Y-%m-%d)" daily
```

## 📁 File Structure

```
~/ButterNotes/
├── bin/
│   ├── notes           # Main fzf interface
│   ├── quick-note      # Note creation
│   └── note-search     # Content search
├── templates/
│   ├── default.md      # Basic template
│   ├── daily.md        # Daily planning
│   └── meeting.md      # Meeting notes
├── config/
│   └── notes.conf      # Configuration
└── README.md           # This file

~/notes/                # Your actual notes
├── Daily-2024-01-15.md
├── Project-Ideas.md
└── Meeting-with-John.md
```

## 🤝 Tips

- **Use consistent naming** - Makes fuzzy finding easier
- **Add tags** - Use `#tags` in notes for better organization  
- **Daily routine** - Start each day with a daily note
- **Search everything** - Don't remember where you wrote something? Use `note-search`
- **Templates** - Create templates for recurring note types

## 🔄 Sync Setup

### Git Sync
```bash
# Initial setup
note-sync setup git
# Enter your git repository URL when prompted

# Manual sync
note-sync sync
# Or use Ctrl-Y in notes interface
```

### Nextcloud Sync
```bash
# Install rclone first
sudo apt install rclone

# Setup
note-sync setup nextcloud
# Enter your Nextcloud URL, username, and password

# Manual sync
note-sync sync
```

### Auto Sync
```bash
# Run as daemon
note-sync auto

# Or add to crontab for periodic sync
*/5 * * * * /home/drew/ButterNotes/bin/note-sync sync
```

## 🛠️ Troubleshooting

**No preview showing?**
- Install `bat`: `sudo apt install bat`
- Check `ENABLE_PREVIEW=true` in config

**Search not working?**
- Install `ripgrep`: `sudo apt install ripgrep`

**Notes not opening in nvim?**
- Check `NOTES_EDITOR` in config
- Ensure nvim is in PATH

**Sync issues?**
- Git: Check remote access with `git remote -v`
- Nextcloud: Verify rclone config with `rclone listremotes`
- Check `~/ButterNotes/config/sync.conf` settings