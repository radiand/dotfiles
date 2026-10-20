set default-list

software: \
    apt \
    flatpak \
    rust \
    cargo \
    uv \
    go

firmware:
    sudo fwupdmgr get-updates
    sudo fwupdmgr update

apt:
    sudo apt-get update
    sudo apt-get -y upgrade 

uv:
    uv self update
    uv tool upgrade --all

flatpak:
    flatpak update --noninteractive

rust:
    rustup update

cargo:
    cargo install $(cargo install --list | egrep '^[a-z0-9_-]+ v[0-9.]+:$' | cut -f1 -d' ')

go:
    gup update

joplin:
    # GitHub API is rate limited. With VPN it will likely fail on listing releases.
    wget -O - https://raw.githubusercontent.com/laurent22/joplin/dev/Joplin_install_and_update.sh | bash
