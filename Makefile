all: basics link starship

basics:
    sudo apt update && sudo apt upgrade -y
    bash install/apt_install.sh install/aptlist
    
starship:
    sh -c "$(curl -fsSL https://starship.rs/install.sh)"

link:
    mkdir -pv ~/.config
    ln -sfn ~/work-dotfiles/config/starship.toml ~/.config/starship.toml
    ln -sfn ~/work-dotfiles/config/git/.gitignore ~/.gitignore
    ln -sfn ~/work-dotfiles/config/git/.gitconfig ~/.gitconfig
