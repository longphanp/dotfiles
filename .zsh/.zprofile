for file in $HOME/.{exports,zshrc,aliases,completers}; do
    [ -r "$file" ] && source "$file"
done

