function mkcd --description 'Create a directory and change into it'
    if test (count $argv) -ne 1
        echo "mkcd: expected exactly one argument" >&2
        return 1
    end
    
    mkdir -p $argv[1]; and cd $argv[1]
end
