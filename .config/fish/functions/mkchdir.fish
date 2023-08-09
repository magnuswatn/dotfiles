function mkchdir -a 1
    mkdir -p -- "$1" && cd -- "$1"
end
