#!/usr/bin/env fish

function show_terminal
    while true
        set command (zenity --entry --title "Terminal" --text "Enter a command:")
        if test -n "$command"
            switch $command
                case "exit"
                    return 0
                case "*"
                    set output (eval $command)
                    if test $status -eq 0
                        zenity --info --title "Terminal" --text "$output"
                    else
                        zenity --error --title "Terminal" --text "Error executing command: $command"
                    end
            end
        else
            return 0
        end
    end
end

show_terminal
