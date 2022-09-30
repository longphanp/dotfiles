for file in $HOME/.{exports,aliases,zshrc}; do
    [ -r "$file" ] && source "$file"
done

