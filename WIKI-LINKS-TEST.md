# Wiki-Style Links Test Guide

## Setup Complete ✓

Created a wiki-style linking system for ButterNotes with the following features:

### 1. Link Format
- Use `[[Note Title]]` to link to notes
- Use `[[folder/Note Title]]` for notes in subfolders
- Spaces in titles are automatically handled

### 2. New Commands (`note-links` script)
- `note-links follow <file> [line]` - Follow a wiki link
- `note-links backlinks <file>` - Show all notes linking TO this note
- `note-links list <file>` - List all links IN a note
- `note-links validate [file]` - Check for broken links

### 3. New Keybindings in Main Interface
- **Ctrl-B**: Show backlinks for selected note
- **Ctrl-L**: List all links in selected note

### 4. Test Environment
- Test notes in: `~/GitHub/butternotes/test-notes/`
- Test script: `./test-notes.sh` (uses test config)
- Sample notes with links already created

## How to Test

1. **Run the test interface:**
   ```bash
   cd ~/GitHub/butternotes
   ./test-notes.sh
   ```

2. **Try the keybindings:**
   - Select a note and press Ctrl-B to see what links to it
   - Press Ctrl-L to see links within the note

3. **Test link validation:**
   ```bash
   cd ~/GitHub/butternotes
   TEST_NOTES_DIR="$PWD/test-notes" ./bin/note-links validate
   ```

4. **Test following links:**
   ```bash
   cd ~/GitHub/butternotes
   TEST_NOTES_DIR="$PWD/test-notes" ./bin/note-links follow test-notes/First-Note.md 3
   ```

## Next Steps for Production

When you're happy with the testing:

1. Copy the `note-links` script to your production ButterNotes:
   ```bash
   cp ~/GitHub/butternotes/bin/note-links ~/ButterNotes/bin/
   ```

2. Update your production `notes` script with the new keybindings

3. Start using `[[Note Title]]` syntax in your notes!

## Future Enhancements to Consider

1. **Neovim Integration:**
   - Syntax highlighting for `[[links]]`
   - Keybinding to follow link under cursor
   - Autocomplete for note titles

2. **Graph Visualization:**
   - Generate a visual map of note connections

3. **Link Refactoring:**
   - Automatically update links when renaming notes