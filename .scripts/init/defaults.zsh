#! /bin/zsh
check_if_symbolik_link_or_file_exists_ask_if_override() {
    if [ -L "~/$1" ]; then
        printf "\nSymbolic link already exists: $1\n"
        printf "Do you want to override it? [y/n]: "
        read -r answer
        if [ "$answer" = "y" ]; then
            ln -sfnv  "$1" "~/$1"
            
        else
            printf "\nSkipping $1...\n"
            return 1
        fi
    elif [ -f "~/$1" ]; then
        printf "\nFile already exists: $1\n"
        printf "Do you want to override it? [y/n]: "
        read -r answer
        if [ "$answer" = "y" ]; then
            printf "teste $pwd"
            cp -fv "$1" "~/$1"
        else
            printf "\nSkipping $1...\n"
            return 1
        fi
    else
       ln -sfnv  "$1" "~/$1"
    fi

    return 0
}
zsh_create_symbolic_links() {
    printf "\Creating zsh symbolic links...\n"
    check_if_symbolik_link_or_file_exists_ask_if_override .zshenv
    check_if_symbolik_link_or_file_exists_ask_if_override .zshrc
    printf "\nFinished creating zsh symbolic links...\n"
}
run()
{
    zsh_create_symbolic_links
}
run