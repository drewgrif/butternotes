# 🧈 ButterNotes

![Made for Debian](https://img.shields.io/badge/Made_for-Debian-A81D33?style=for-the-badge)
![Made for Linux](https://img.shields.io/badge/Made_for-Linux-FCC624?style=for-the-badge)
![Terminal Based](https://img.shields.io/badge/Terminal-Based-4EAA25?style=for-the-badge)

A streamlined note-taking and todo management system for the terminal.  
Following the "inbox first, organize later" philosophy with smart fzf-enhanced project management.

> Part of the **JustAGuy Linux** productivity toolkit.

## 📜 Philosophy

ButterNotes embraces the **inbox workflow**:
- **Quick Capture First** - Never lose a thought while deciding where it goes
- **Organize Later** - Clean separation between rapid note-taking and structured documentation  
- **Plain Text Power** - Markdown files that sync with any mobile app
- **Terminal Focused** - Fast, keyboard-driven, distraction-free

**Two complementary workflows:**
1. **Inbox** (`notes.md` + `todos.md`) - Stream of consciousness, rapid capture
2. **Projects** (`projects/*.md`) - Organized documentation with fzf management

---

## ✨ Features

- **🚀 Fast Capture**: Instant note and todo entry from anywhere
- **📝 Inbox System**: Stream-of-consciousness notes with timestamps  
- **✅ Smart Todos**: Persistent numbering, markdown checkboxes, easy toggling
- **📁 Project Manager**: fzf-powered file management with preview
- **🔍 Interactive Search**: fzf integration for browsing and searching
- **📱 Mobile Sync**: Standard markdown files work with any mobile app
- **🎯 Terminal Native**: Clean sub-prompts, keyboard shortcuts, no GUI bloat
- **⚡ Shell Integration**: Seamless aliases and PATH integration

---

## 🚀 Installation

### Quick Install
```bash
git clone https://github.com/drewgrif/butternotes.git
cd butternotes
chmod +x install.sh
./install.sh
```

The installer will:
- Configure your notes storage location (mobile-sync friendly)
- Set up shell integration (aliases + PATH)  
- Check for optional dependencies (fzf recommended)

### Dependencies

**Required:**
- `bash` - Core functionality
- `xclip` or `wl-clipboard` - Clipboard integration

**Recommended:**
- `fzf` - Enhanced project management and search

---

## 🎯 Quick Start

### Inbox Capture
```bash
# Add notes instantly
butter "Random brilliant idea"
butter clip                    # Save clipboard as note

# Manage todos  
butter todo "Fix the thing"
butter todos                   # List all todos
```

### Project Management
```bash
# Launch fzf project manager
butter project
# ┌─ Project Manager ─────────────────────┐
# │ 📝 New project                        │
# │ 🗑️  Delete project                    │  
# │ 🚪 Exit                               │
# │ ───────────────────────────────────── │
# │ homelab                   [preview]   │
# │ python                                │
# │ nextcloud                             │
# └───────────────────────────────────────┘
```

### Interactive Mode
```bash
$ b                           # Launch butter
🧈 Butter - Interactive Mode

Commands:
  n    - Notes mode            (quick capture)
  t    - Todo mode             (task management)  
  p    - Projects mode         (fzf manager)
  l    - List notes
  c    - Clear screen
  q    - Quit

butter> p                     # Opens fzf project manager
butter> n                     # Enter notes sub-prompt
butter/notes> a Hello world   # Add note
butter/notes> ..              # Back to main
```

---

## 📚 Core Workflows

### 1. Inbox Philosophy

**The Problem**: Deciding where a note belongs interrupts your thinking.

**The Solution**: Capture everything in the inbox first, organize later.

```bash
# Rapid capture - no decisions needed
butter "Meeting notes from standup"
butter "Bug in the authentication flow"  
butter clip                              # Save interesting article
butter todo "Review pull request #123"
```

**Result**: `~/Documents/ButterNotes/notes.md`
```markdown
[2025-01-15 09:30:15] Meeting notes from standup
[2025-01-15 09:31:22] Bug in the authentication flow
[2025-01-15 09:32:18] Interesting article about...
```

### 2. Project Organization

When you're ready to organize, use the **fzf project manager**:

```bash
butter project               # Launch manager
# Select "📝 New project" → Create "authentication"
# Move relevant notes to projects/authentication.md
```

**Advanced fzf controls:**
- `Enter` - Edit selected project
- `Ctrl-N` - Create new project  
- `Ctrl-D` - Delete project
- `Tab` - Toggle preview
- `Escape` - Exit manager

### 3. Todo Management

```bash
butter todo "Fix authentication bug"     # Add todo
butter todos                             # List all

# Interactive todo management  
butter> t
✅ Todo Mode
butter/todos> a "New task"               # Add
butter/todos> d 3                        # Toggle done #3  
butter/todos> rm 5                       # Remove #5
```

---

## 🗂️ File Structure

```
~/Documents/ButterNotes/          # Default (configurable)
├── notes.md                      # 📥 Inbox - all notes  
├── todos.md                      # ✅ Task list
└── projects/                     # 📁 Organized docs
    ├── homelab.md
    ├── python.md
    └── authentication.md
```

**Mobile Sync**: Place `ButterNotes/` in your cloud folder (Nextcloud, Dropbox, etc.) for automatic mobile sync with markdown apps.

---

## ⌨️ Shell Integration

After installation, these aliases are available:

```bash
b         # Launch interactive mode
bc        # Save clipboard as note  
bt "task" # Add todo
```

**Advanced usage:**
```bash
butter "Quick note"                    # Direct note
butter todo "Important task"          # Direct todo  
butter project python                 # View python project
butter project python edit           # Edit python project
butter search                        # Interactive search
```

---

## 🎨 Customization

### Storage Location
```bash
./install.sh
# Choose from:
# 1) ~/Documents/ButterNotes/     (mobile sync)
# 2) ~/notes/                     (simple)  
# 3) ~/Nextcloud/Notes/           (Nextcloud)
# 4) Custom location
```

### Configuration
Edit `config/butter.conf`:
```bash
# Notes storage location
BUTTER_NOTES_DIR="$HOME/Documents/ButterNotes"

# Editor preference  
BUTTER_EDITOR="${EDITOR:-nvim}"
```

---

## 🤝 Similar Projects

ButterNotes draws inspiration from:
- **Getting Things Done** - Inbox methodology
- **Zettelkasten** - Linked note-taking
- **Plain text workflows** - Future-proof, tool-agnostic  

**Why ButterNotes?**
- Simpler than Obsidian for basic workflows
- More organized than basic note scripts
- Faster than GUI apps for terminal users
- Better mobile sync than terminal-only solutions

---

## 🛠️ Development

### Philosophy
- **Keep notes/todos simple** - They work perfectly for fast capture
- **Enhance projects** - Files benefit from management features  
- **Terminal first** - No GUI bloat
- **Plain text** - Tool-independent, future-proof

### Contributing
1. Fork the repository
2. Create your feature branch
3. Test with `./bin/butter --help`
4. Submit a pull request

---

## 📄 License

MIT License - Use it, modify it, share it.

---

## ☕ Support

If ButterNotes has been helpful, consider buying me a coffee:

<a href="https://www.buymeacoffee.com/justaguylinux" target="_blank"><img src="https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png" alt="Buy me a coffee" /></a>

## 📺 Watch on YouTube

Want to see productivity workflows in action?  
🎥 Check out [JustAGuy Linux on YouTube](https://www.youtube.com/@JustAGuyLinux)

---

## 🙋 Community

- **Issues**: [GitHub Issues](https://github.com/drewgrif/butternotes/issues)
- **Discussions**: Share workflows and tips
- **Pull Requests**: Contributions welcome

---

Made with 🧈 by [JustAGuyLinux](https://www.youtube.com/@justaguylinux)

> **Note**: This project may transition to Codeberg in the future. Watch for updates!
