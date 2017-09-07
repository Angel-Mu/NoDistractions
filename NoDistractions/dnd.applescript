#ignoring application responses
#    tell application "System Events" to keystroke "D" using {command down, shift down, option down, control down}
#end ignoring

tell application "System Events"
    tell process "SystemUIServer"
        try
            key down option
            click menu bar item 1 of menu bar 1
            key up option
        on error
            try
                key down option
                click menu bar item 1 of menu bar 2
                key up option
            on error
                key up option
            end try
        end try
    end tell
end tell
