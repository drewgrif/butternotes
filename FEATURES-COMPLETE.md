# ButterNotes New Features - Complete! 🎉

## 1. Wiki-Style Linking ✓

### What's New:
- **`[[Note Title]]` syntax** - Link between notes like Obsidian/Roam
- **Backlinks** - See what notes link TO any note
- **Link validation** - Find broken links

### Commands:
```bash
# Follow links, show backlinks, validate
note-links follow <file> [line]
note-links backlinks <file>
note-links validate [file]
```

### Keybindings:
- **Ctrl-B**: Show backlinks for selected note
- **Ctrl-L**: List all links in selected note

## 2. Projects Feature ✓

### What's New:
- **Goal-oriented collections** that span folders
- **Project metadata**: status, deadlines, progress
- **Notes can belong to multiple projects**

### Commands:
```bash
# Project management
note-projects new              # Create project
note-projects list            # List all projects  
note-projects view <name>     # View details
note-projects add <project> <note>  # Add note
note-projects status <project> <status>  # Update
```

### Keybindings:
- **Ctrl-P**: Open project view
- **Alt-P**: Add current note to a project

### Project Files:
Stored in `~/notes/.projects/` as YAML:
```yaml
name: "Website Redesign"
created: "2025-01-24"
deadline: "2025-02-15"
status: "active"
notes:
  - "meetings/client-brief.md"
  - "design/mockups.md"
```

## Testing Instructions

### 1. Run Test Environment:
```bash
cd ~/GitHub/butternotes
./test-notes.sh
```

### 2. Test Wiki Links:
- Select "First-Note.md" and press **Ctrl-L** to see its links
- Select "Second-Note.md" and press **Ctrl-B** to see backlinks

### 3. Test Projects:
- Press **Ctrl-P** to enter project view
- Create a new project: `./bin/note-projects new`
- Add notes to projects with **Alt-P**

## Deploy to Production

When ready, copy the new features:

```bash
# Copy new scripts
cp ~/GitHub/butternotes/bin/note-links ~/ButterNotes/bin/
cp ~/GitHub/butternotes/bin/note-projects ~/ButterNotes/bin/
cp ~/GitHub/butternotes/bin/project-notes ~/ButterNotes/bin/

# Update main notes script
cp ~/GitHub/butternotes/bin/notes ~/ButterNotes/bin/

# Create projects directory
mkdir -p ~/notes/.projects
```

## Future Enhancements

### For Wiki Links:
- Neovim syntax highlighting for `[[links]]`
- Link autocomplete
- Graph visualization

### For Projects:
- Project templates
- Progress tracking
- Deadline notifications
- Bulk operations

Both features work seamlessly together - you can use wiki links to connect notes within projects!