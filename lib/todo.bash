#!/usr/bin/env bash
# Task/Todo management function

todo() {
    # Get butter directory
    BUTTER_DIR="${BUTTER_DIR:-$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)}"
    
    # Source config if available
    [ -f "$BUTTER_DIR/config/butter.conf" ] && source "$BUTTER_DIR/config/butter.conf"
    
    local todo_file="${TODOS_FILE:-$HOME/Documents/ButterNotes/todos.md}"
    
    # Migrate from old location if it exists
    if [ -f "$HOME/.tasks" ] && [ ! -f "$todo_file" ]; then
        mkdir -p "$(dirname "$todo_file")"
        echo "# Todos" > "$todo_file"
        echo "" >> "$todo_file"
        cat "$HOME/.tasks" >> "$todo_file"
        echo "📦 Migrated todos from ~/.tasks to $todo_file"
    fi
    
    # Create directory and file if they don't exist
    mkdir -p "$(dirname "$todo_file")"
    [ ! -f "$todo_file" ] && echo "# Todos" > "$todo_file"
    
    case "$1" in
        ""|list)
            # List all tasks with consistent numbering
            if [ -s "$todo_file" ]; then
                echo "📋 Tasks:"
                local count=1
                while IFS= read -r line; do
                    if [[ "$line" == "[ ]"* ]]; then
                        echo -e "  \033[1;33m[$count]\033[0m ☐ ${line:4}"
                        ((count++))
                    elif [[ "$line" == "[x]"* ]]; then
                        # Keep numbering for completed tasks
                        echo -e "  \033[90m[$count]\033[0m \033[90m☑ ~~${line:4}~~\033[0m"
                        ((count++))
                    fi
                done < "$todo_file"
                
                # Count summary
                local active=$(grep -c "^\[ \]" "$todo_file" 2>/dev/null || echo 0)
                local done=$(grep -c "^\[x\]" "$todo_file" 2>/dev/null || echo 0)
                echo -e "\n  \033[90m$active active, $done completed\033[0m"
            else
                echo "No tasks yet. Use 'todo <task>' to add your first task."
            fi
            ;;
        
        done|complete|finish)
            # Mark task as complete (now counts all tasks, not just active)
            if [ -z "$2" ]; then
                echo "Usage: todo done <number>"
                return 1
            fi
            
            local task_num="$2"
            # Validate that task_num is a number
            if ! [[ "$task_num" =~ ^[0-9]+$ ]]; then
                echo "⚠️  Task number must be a number, not '$task_num'"
                echo "Usage: todo done <number>"
                echo "Did you mean: todo \"$1 $task_num\"?"
                return 1
            fi
            
            local count=1
            local temp_file="$todo_file.tmp"
            local found=false
            
            while IFS= read -r line; do
                if [[ "$line" == "[ ]"* ]] || [[ "$line" == "[x]"* ]]; then
                    if [ "$count" -eq "$task_num" ]; then
                        if [[ "$line" == "[ ]"* ]]; then
                            # Mark as complete
                            echo "[x] ${line:4} ($(date '+%Y-%m-%d'))" >> "$temp_file"
                            echo "✓ Completed: ${line:4}"
                            found=true
                        elif [[ "$line" == "[x]"* ]]; then
                            # Already completed - toggle back to incomplete
                            local task_text="${line:4}"
                            # Remove the date suffix if present
                            task_text="${task_text% (*}"
                            echo "[ ] $task_text" >> "$temp_file"
                            echo "↩️ Uncompleted: $task_text"
                            found=true
                        fi
                    else
                        echo "$line" >> "$temp_file"
                    fi
                    ((count++))
                else
                    echo "$line" >> "$temp_file"
                fi
            done < "$todo_file"
            
            if [ "$found" = true ]; then
                mv "$temp_file" "$todo_file"
            else
                rm -f "$temp_file"
                echo "Task #$task_num not found"
                return 1
            fi
            ;;
        
        clear|clean)
            # Remove completed (struck-through) tasks
            local temp_file="$todo_file.tmp"
            grep "^\[ \]" "$todo_file" > "$temp_file" 2>/dev/null || true
            local removed_count=$(grep -c "^\[x\]" "$todo_file" 2>/dev/null || echo 0)
            mv "$temp_file" "$todo_file"
            echo "🗑️ Cleared $removed_count completed tasks"
            ;;
        
        rm)
            # Remove a specific task
            if [ -z "$2" ]; then
                echo "Usage: todo rm <number>"
                return 1
            fi
            
            local task_num="$2"
            # Validate that task_num is a number
            if ! [[ "$task_num" =~ ^[0-9]+$ ]]; then
                echo "⚠️  Task number must be a number, not '$task_num'"
                echo "Usage: todo rm <number>"
                return 1
            fi
            
            local count=1
            local temp_file="$todo_file.tmp"
            local found=false
            
            while IFS= read -r line; do
                if [[ "$line" == "[ ]"* ]] || [[ "$line" == "[x]"* ]]; then
                    if [ "$count" -eq "$task_num" ]; then
                        if [[ "$line" == "[ ]"* ]]; then
                            echo "✗ Removed: ${line:4}"
                        else
                            echo "✗ Removed completed: ${line:4}"
                        fi
                        found=true
                    else
                        echo "$line" >> "$temp_file"
                    fi
                    ((count++))
                else
                    echo "$line" >> "$temp_file"
                fi
            done < "$todo_file"
            
            if [ "$found" = true ]; then
                mv "$temp_file" "$todo_file"
            else
                rm -f "$temp_file"
                echo "Task #$task_num not found"
                return 1
            fi
            ;;
        
        help)
            echo "Usage:"
            echo "  todo              - List active tasks (completed shown struck-through)"
            echo "  todo <task>       - Add a new task"
            echo "  todo done <n>     - Mark task #n as complete (strikethrough)"
            echo "  todo rm <n>       - Delete task #n completely"
            echo "  todo clear        - Remove struck-through completed tasks"
            echo "  todo help         - Show this help"
            ;;
        
        *)
            # Add new task
            echo "[ ] $*" >> "$todo_file"
            echo "✓ Added: $*"
            ;;
    esac
}