set default-list

INCLUDES_FILE := "/tmp/restic_includes_koreader_generated"

[doc("Search for mounted */applications/koreader and backup it.")]
backup: includes
    #!/usr/bin/env bash
    set -euo pipefail

    find_koreader_dir() {
        for root_path in "/media" "/mnt" "/run"; do
            found=$(find ${root_path} -type d -path "*/applications/koreader" 2>/dev/null)
            if test -z ${found}; then break; fi
            if test $(echo ${found} | wc -l) -gt 1; then
                echo "Found more than one koreader paths:" >&2
                echo "${found}" >&2
                return 1
            fi
            echo ${found}
            return 0
        done
        echo "Could not find koreader path." >&2
        return 1
    }

    if [[ -z "${RESTIC_REPOSITORY:-}" ]]; then
        echo "Error: RESTIC_REPOSITORY is not set." >&2
        echo "This is the target repository where snapshots are stored." >&2
        exit 1
    fi

    koreader_dir=$(find_koreader_dir)
    if test $? -ne 0; then echo ${koreader_dir}; fi

    echo "Backing up koreader from ${koreader_dir} to ${RESTIC_REPOSITORY}"
    cd ${koreader_dir}
    restic backup \
        --insecure-no-password \
        --exclude-caches \
        --files-from {{ quote(INCLUDES_FILE) }}

forget:
    restic forget \
        --insecure-no-password \
        --keep-last 10 \
        --prune

includes:
    #!/usr/bin/env bash
    set -euo pipefail

    if [[ -f {{ quote(INCLUDES_FILE) }} ]]; then
        echo "Ignoring creating INCLUDES_FILE FILE, because one already exists: {{ INCLUDES_FILE }}"
        exit 0
    fi

    # https://koreader.rocks/user_guide/#backup
    cat << EOF > {{ INCLUDES_FILE }}
    settings
    styletweaks
    data/cr3.ini
    defaults.persistent.lua
    history.lua
    settings.reader.lua
    settings/profiles.lua
    data/dict
    data/tessdata
    EOF
