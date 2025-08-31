#!/bin/bash
# Terminal detection helper for butter

# Function to find and launch a terminal
launch_terminal() {
    local cmd="$1"
    
    # First, respect user's TERMINAL variable
    if [ -n "$TERMINAL" ]; then
        $TERMINAL -e $cmd &
        return 0
    fi
    
    # Try to detect common terminals in order of likelihood/preference
    # Each terminal has different syntax for executing commands
    
    # Suckless/minimal terminals
    if command -v st >/dev/null 2>&1; then
        st -e $cmd &
        return 0
    elif command -v urxvt >/dev/null 2>&1; then
        urxvt -e $cmd &
        return 0
    elif command -v rxvt >/dev/null 2>&1; then
        rxvt -e $cmd &
        return 0
    # Modern terminals
    elif command -v wezterm >/dev/null 2>&1; then
        wezterm start -- $cmd &
        return 0
    elif command -v alacritty >/dev/null 2>&1; then
        alacritty -e $cmd &
        return 0
    elif command -v kitty >/dev/null 2>&1; then
        kitty $cmd &
        return 0
    elif command -v foot >/dev/null 2>&1; then
        foot $cmd &
        return 0
    # Traditional terminals
    elif command -v termite >/dev/null 2>&1; then
        termite -e "$cmd" &
        return 0
    elif command -v terminator >/dev/null 2>&1; then
        terminator -e "$cmd" &
        return 0
    elif command -v konsole >/dev/null 2>&1; then
        konsole -e $cmd &
        return 0
    elif command -v gnome-terminal >/dev/null 2>&1; then
        gnome-terminal -- $cmd &
        return 0
    elif command -v xfce4-terminal >/dev/null 2>&1; then
        xfce4-terminal -e "$cmd" &
        return 0
    elif command -v mate-terminal >/dev/null 2>&1; then
        mate-terminal -e "$cmd" &
        return 0
    elif command -v lxterminal >/dev/null 2>&1; then
        lxterminal -e $cmd &
        return 0
    # Fallback
    elif command -v xterm >/dev/null 2>&1; then
        xterm -e $cmd &
        return 0
    else
        return 1
    fi
}

# Function to detect file manager
launch_file_manager() {
    local path="$1"
    
    # First, respect user's FILE_MANAGER variable
    if [ -n "$FILE_MANAGER" ]; then
        if [[ "$FILE_MANAGER" == "ranger" ]] || [[ "$FILE_MANAGER" == "nnn" ]] || [[ "$FILE_MANAGER" == "lf" ]]; then
            # Terminal file managers need a terminal
            launch_terminal "$FILE_MANAGER '$path'"
        else
            $FILE_MANAGER "$path" &
        fi
        return 0
    fi
    
    # Try xdg-open first (respects user's default)
    if command -v xdg-open >/dev/null 2>&1; then
        xdg-open "$path" &
        return 0
    fi
    
    # Try GUI file managers
    if command -v pcmanfm >/dev/null 2>&1; then
        pcmanfm "$path" &
        return 0
    elif command -v thunar >/dev/null 2>&1; then
        thunar "$path" &
        return 0
    elif command -v nemo >/dev/null 2>&1; then
        nemo "$path" &
        return 0
    elif command -v nautilus >/dev/null 2>&1; then
        nautilus "$path" &
        return 0
    elif command -v dolphin >/dev/null 2>&1; then
        dolphin "$path" &
        return 0
    # Terminal file managers as fallback
    elif command -v ranger >/dev/null 2>&1; then
        launch_terminal "ranger '$path'"
        return 0
    elif command -v nnn >/dev/null 2>&1; then
        launch_terminal "nnn '$path'"
        return 0
    elif command -v lf >/dev/null 2>&1; then
        launch_terminal "lf '$path'"
        return 0
    elif command -v mc >/dev/null 2>&1; then
        launch_terminal "mc '$path'"
        return 0
    else
        return 1
    fi
}