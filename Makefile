all: basics link

basics:
    sudo apt update
    sudo apt upgrade
    
starship:
    sh -c "$(curl -fsSL https://starship.rs/install.sh)"
