#! /bin/zsh
# optional parameters:
# $1 - current step
# $2 - total steps
report_progress() {
    local current_step="${1:-}"
    local total="${2:-}"
    local spinstr=('⠋' '⠙' '⠹' '⠸' '⠼' '⠴' '⠦' '⠧' '⠇' '⠏')
    local spin_count=0

    if [[ -z "$current_step" && -z "$total" ]]; then
        printf "\r${spinstr[10 % spin_count++]}"
    else
        #if total and current step are equals then we are done
        if [[ "$current_step" -eq "$total" ]]; then
            printf "\r${spinstr[spin_count++ % 10]} [100%%]"
            return
        fi

        if [[ -n "$total" && "$total" -ne 0 ]]; then
            local percent=$((current_step * 100 / total))
        else
            local percent=0
        fi
        printf "\r${spinstr[spin_count++ % 10]} [%3d%%]" "$percent"
    fi
    printf "    \r\r\r\r"
}
end_progress(){
    printf "\n"
}