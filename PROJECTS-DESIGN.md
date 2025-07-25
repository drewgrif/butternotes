# ButterNotes Projects Feature Design

## Overview
Projects provide task-oriented organization that complements the existing folder structure. Unlike folders (permanent organization), projects are temporary goal-focused collections.

## Data Structure

### 1. Project Definition Files
Location: `~/notes/.projects/[project-name].project`

Format (YAML):
```yaml
name: "Website Redesign"
created: "2025-01-24"
deadline: "2025-02-15"
status: "active"  # active, completed, archived, on-hold
tags: ["web", "design", "client-work"]
description: "Redesigning the company website with new branding"
notes:
  - "ideas/website-mockups.md"
  - "meetings/client-feedback-2025-01-20.md"
  - "projects/website/technical-spec.md"
```

### 2. Project Metadata in Notes
In note frontmatter:
```markdown
---
created: 2025-01-24
tags: [web, design]
projects: ["Website Redesign", "Q1 Goals"]
---
```

## New Scripts

### 1. `note-projects` - Project Management
```bash
note-projects new          # Create new project
note-projects list         # List all projects
note-projects view <name>  # View project details
note-projects add <project> <note>  # Add note to project
note-projects status <project> <status>  # Update status
note-projects archive <project>  # Archive completed project
```

### 2. `project-notes` - Project-focused Interface
- fzf interface filtered by project
- Shows only notes in selected project
- Quick switching between projects

## Integration Points

### Main Notes Interface
New keybindings:
- `Ctrl-P`: Switch to project view
- `Ctrl-Alt-P`: Add current note to project
- `Alt-P`: View project details

### Project View Features
- Progress indicator (X of Y notes completed)
- Deadline warnings
- Quick status updates
- Project-specific search

## Implementation Phases

### Phase 1: Core Project Management
- [ ] Create `.projects` directory structure
- [ ] Implement `note-projects` script
- [ ] Basic YAML project file handling

### Phase 2: Note Integration
- [ ] Add project frontmatter support
- [ ] Implement bidirectional linking
- [ ] Add note-to-project assignment

### Phase 3: UI Enhancement
- [ ] Create project-focused fzf interface
- [ ] Add project switcher
- [ ] Implement progress tracking

### Phase 4: Advanced Features
- [ ] Project templates
- [ ] Deadline notifications
- [ ] Project statistics/reports
- [ ] Bulk operations

## Benefits
1. **Task-focused organization** without disrupting folder structure
2. **Cross-folder collections** for complex projects
3. **Progress tracking** for goal-oriented work
4. **Temporary groupings** that can be archived when done
5. **Multiple project membership** for notes

## Example Use Cases

### Academic Research
```yaml
name: "Thesis Research"
deadline: "2025-06-01"
status: "active"
notes:
  - "research/literature-review.md"
  - "ideas/thesis-outline.md"
  - "meetings/advisor-notes.md"
```

### Software Development
```yaml
name: "Feature: User Authentication"
deadline: "2025-02-01"
status: "active"
tags: ["development", "backend"]
notes:
  - "dev/auth-spec.md"
  - "dev/security-review.md"
  - "meetings/team-planning.md"
```

### Personal Goals
```yaml
name: "Learn Spanish"
status: "active"
tags: ["learning", "languages"]
notes:
  - "learning/spanish-vocabulary.md"
  - "journal/spanish-practice-log.md"
  - "resources/spanish-resources.md"
```