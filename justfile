set default-list
set script-interpreter := ["bash", "-euo", "pipefail"]

update-software: \
    update-apt \
    update-flatpak \
    update-rust \
    update-cargo-tools \
    update-uv-tools \
    update-go-tools

update-firmware:
    sudo fwupdmgr get-updates
    sudo fwupdmgr update

update-apt:
    sudo apt-get update
    sudo apt-get -y upgrade 

update-uv-tools:
    uv tool upgrade --all

update-flatpak:
    flatpak update --noninteractive

update-rust:
    rustup update

update-cargo-tools:
    cargo install $(cargo install --list | egrep '^[a-z0-9_-]+ v[0-9.]+:$' | cut -f1 -d' ')

update-go-tools:
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
