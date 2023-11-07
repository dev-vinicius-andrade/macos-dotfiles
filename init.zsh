#! /bin/zsh


add_scritps_permissions()
{
    source .scripts/spinning_progress_bar.zsh
    local total_files=$(ls -l ./.scripts/init/**/*(.) | wc -l)
    local current_file=0
    printf "\nAdding permissions to scripts...\n"
    for file in ./.scripts/init/**/*(.); do
        report_progress current_file total_files 
        if [[ -f "$file" ]]; then
            chmod u+r+x "$file"
        fi
        current_file=$((current_file + 1))
    done
    report_progress current_file total_files 
    end_progress
}
setup(){
  echo 'Starting setup ...'
  add_scritps_permissions
  ./.scripts/init/defaults.zsh
  ./.scripts/init/nerdfonts.zsh
#   ./.scripts/init/nerdfonts.zsh
#   ./.scripts/init/starship.zsh
#   ./installation-scripts/docker.bash
#   ./installation-scripts/portainer.bash
#   ./installation-scripts/docker_compose.bash
#   ./installation-scripts/neofetch.bash
#   ./installation-scripts/dev_tools.bash
#   ./installation-scripts/zshrc.bash
  echo 'Finished setup ...'
}

setup
