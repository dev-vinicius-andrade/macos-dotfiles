#! /bin/zsh
download_and_install_fonts()
{
    mkdir -p ~/.fonts
    echo "[-] Downloading fonts: [-]"
    declare -a fonts_zips_uris=("https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/JetBrainsMono.zip"
    "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Terminus.zip"
    "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Ubuntu.zip"
    "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/UbuntuMono.zip"
    "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Agave.zip"
    "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/FiraCode.zip"
    "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/FiraMono.zip"
    "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/Hack.zip"
    "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/NerdFontsSymbolsOnly.zip"
    )
    for fonts_zip_uri in "${fonts_zips_uris[@]}"
    do
        echo "[-] Downloading font: [-]"
        echo "${fonts_zip_uri}"
        wget -q -O tmpFont.zip "${fonts_zip_uri}" && unzip tmpFont.zip -o -d ~/.fonts && rm tmpFont.zip
    done
    if [ -f ~/macos-dotfiles/tmpFont.zip ]; then
        rm ~/macos-dotfiles/tmpFont.zip
    fi
    cp -r ~/.fonts/* ~/Library/Fonts
    echo "[-] Fonts Downloaded: [-]"
}
install_nerd_fonts()
{
    if ! [ -x "$(command -v nerd_fonts)" ]; then
        if ! [ -d ~/.fonts ]; then
            download_and_install_fonts
        else
            echo "[-] Fonts already downloaded: [-]"
            echo "[-] Do you want to download them again? [y/n]: [-]"
            read -r answer
            if [ "$answer" = "y" ]; then
                download_and_install_fonts
            fi
        fi
    fi
}
install_nerd_fonts





