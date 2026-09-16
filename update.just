set default-list
set script-interpreter := ["bash", "-euo", "pipefail"]

software: \
    apt \
    flatpak \
    rust \
    cargo-tools \
    uv-tools \
    go-tools

firmware:
    sudo fwupdmgr get-updates
    sudo fwupdmgr update

apt:
    sudo apt-get update
    sudo apt-get -y upgrade 

uv-tools:
    uv tool upgrade --all

flatpak:
    flatpak update --noninteractive

rust:
    rustup update

cargo-tools:
    cargo install $(cargo install --list | egrep '^[a-z0-9_-]+ v[0-9.]+:$' | cut -f1 -d' ')

go-tools:
    #!/usr/bin/env bash
    set -euo pipefail

    gobin="$(go env GOBIN)"

    if [[ -z "$gobin" ]]; then
        gobin="$(go env GOPATH)/bin"
    fi

    find "$gobin" -maxdepth 1 -type f -perm -111 -print0 |
    while IFS= read -r -d '' binary; do
        module="$(
            go version -m "$binary" 2>/dev/null |
            awk '$1 == "path" { print $2; exit }'
        )"

        if [[ -z "$module" ]]; then
            printf 'Skipping %s: no Go build information\n' "$binary" >&2
            continue
        fi

        printf 'Updating %s (%s)\n' "$binary" "$module"
        go install "$module@latest"
    done

joplin:
    # GitHub API is rate limited. With VPN it will likely fail on listing releases.
    wget -O - https://raw.githubusercontent.com/laurent22/joplin/dev/Joplin_install_and_update.sh | bash
