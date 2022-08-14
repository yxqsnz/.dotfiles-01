function fish_command_not_found \
    --description 'Called by Fish when a command is not found'
    echo (set_color red)" [=]   Unknown:" $argv[1]
end
