#! /bin/zsh
check_if_symbolic_link_or_file_exists_ask_if_override() {
    local target_file="$HOME/$1"
    if [ -L "$target_file" ]; then
        printf "\nSymbolic link already exists: $1\n"
        printf "Do you want to override it? [y/n]: "
        read -r answer
        if [ "$answer" = "y" ]; then
            ln -sfnv "$PWD/$1" "$target_file"
        else
            printf "\nSkipping $1...\n"
            return 1
        fi
    elif [ -f "$target_file" ]; then
        printf "\nFile already exists: $1\n"
        printf "Do you want to override it? [y/n]: "
        read -r answer
        if [ "$answer" = "y" ]; then
            cp -fv "$1" "$target_file"
        else
            printf "\nSkipping $1...\n"
            return 1
        fi
    else
        ln -sfnv "$PWD/$1" "$target_file"
    fi

    return 0
}

zsh_create_symbolic_links() {
    printf "\nCreating zsh symbolic links...\n"
    check_if_symbolic_link_or_file_exists_ask_if_override .zshenv
    check_if_symbolic_link_or_file_exists_ask_if_override .zshrc
    printf "\nFinished creating zsh symbolic links...\n"
}

run() {
    zsh_create_symbolic_links
}

run
