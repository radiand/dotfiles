set default-list

EXCLUDES_FILE := "/tmp/restic_excludes_generated"

[working-directory(home_dir())]
home: excludes
    #!/usr/bin/env bash
    set -euxo pipefail

    if [[ -z "${RESTIC_REPOSITORY:-}" ]]; then
        echo "Error: RESTIC_REPOSITORY is not set." >&2
        echo "Initialize a repo on the external drive, then export RESTIC_REPOSITORY." >&2
        exit 1
    fi

    if [[ -z "${RESTIC_PASSWORD:-}" && -z "${RESTIC_PASSWORD_FILE:-}" ]]; then
        echo "Error: set RESTIC_PASSWORD or RESTIC_PASSWORD_FILE." >&2
        exit 1
    fi

    echo "Backing up {{ home_dir() }} to ${RESTIC_REPOSITORY}"

    restic backup \
        --one-file-system \
        --exclude-if-present '.restic-exclude' \
        --exclude-if-present '.resticexclude' \
        --exclude-caches \
        --exclude-file {{ EXCLUDES_FILE }} \
        {{ home_dir() }}

forget:
    restic forget \
        --keep-last "${KEEP_LAST}" \
        --prune

excludes:
    #!/usr/bin/env bash
    set -euo pipefail

    if [[ -f {{ quote(EXCLUDES_FILE) }} ]]; then
        echo "Ignoring creating EXCLUDES FILE, because one already exists: {{ EXCLUDES_FILE }}"
        exit 0
    fi

    cat << EOF > {{ EXCLUDES_FILE }}
    # Restic exclude patterns for full $HOME backup.
    # Syntax: filepath.Match glob; ** matches any directory depth.
    # A leading "/" anchors at the FILESYSTEM root, so home-specific paths must
    # use $HOME/ (restic expands env vars via os.ExpandEnv). Patterns meant to
    # match at any depth (project caches, etc.) use a leading /**/ instead.
    # Lines starting with # are ignored.
    #
    # Hidden dotfiles and dot-directories (.config, .ssh, etc.) are NOT excluded
    # here unless they are caches or reproducible artifacts.

    # ---------------------------------------------------------------------------
    # XDG and desktop caches / trash
    # ---------------------------------------------------------------------------
    $HOME/.cache
    $HOME/.local/share/Trash
    $HOME/.thumbnails
    $HOME/.var/app/*/cache
    $HOME/.var/app/*/Cache

    # ---------------------------------------------------------------------------
    # Language / toolchain caches (under $HOME, not project-local)
    # ---------------------------------------------------------------------------
    $HOME/.npm
    $HOME/.npm/_cacache
    $HOME/.yarn/cache
    $HOME/.yarn/unplugged
    $HOME/.yarn/build-state.yml
    $HOME/.pnpm-store
    $HOME/.cargo/registry
    $HOME/.cargo/git
    $HOME/.rustup/toolchains
    $HOME/.rustup/tmp
    $HOME/.rustup/downloads
    $HOME/.gradle/caches
    $HOME/.gradle/wrapper/dists
    $HOME/.gradle/daemon
    $HOME/.m2/repository
    $HOME/.ivy2/cache
    $HOME/.ivy2/jars
    $HOME/.sbt
    $HOME/.stack
    $HOME/.cabal
    $HOME/.cpanm
    $HOME/.gem
    $HOME/.luarocks
    $HOME/.composer/cache
    $HOME/.vagrant.d/boxes
    $HOME/.vagrant.d/tmp
    $HOME/.android/avd/*.avd/snapshots
    $HOME/.android/avd/*.avd/cache
    $HOME/.android/cache
    $HOME/.arduino15/staging
    $HOME/.arduino15/packages
    $HOME/.platformio/.cache
    $HOME/.platformio/packages
    $HOME/.platformio/penv
    $HOME/.sdkman/candidates
    $HOME/.sdkman/tmp
    $HOME/.sdkman/archives
    $HOME/.rbenv/versions
    $HOME/.pyenv/versions
    $HOME/.nvm/.cache
    $HOME/.nvm/versions
    $HOME/.go/pkg/mod
    $HOME/.go/pkg/sumdb
    $HOME/.cache/go-build
    $HOME/.cache/pip
    $HOME/.cache/pypoetry
    $HOME/.cache/uv
    $HOME/.cache/huggingface
    $HOME/.cache/torch
    $HOME/.cache/ms-playwright
    $HOME/.cache/mozilla
    $HOME/.cache/chromium
    $HOME/.cache/google-chrome
    $HOME/.cache/mesa_shader_cache
    $HOME/.cache/fontconfig
    $HOME/.cache/thumbnails
    $HOME/.cache/gstreamer-1.0
    $HOME/.cache/tracker3
    $HOME/.cache/messages
    $HOME/.cache/obexd
    $HOME/.local/share/Steam/steamapps/shadercache
    $HOME/.local/share/Steam/steamapps/temp
    $HOME/.local/share/Steam/steamappcompat
    $HOME/.local/share/Steam/config/htmlcache
    $HOME/.local/share/Steam/logs
    $HOME/.local/share/flatpak/repo/tmp
    $HOME/.local/share/JetBrains/*/caches
    $HOME/.local/share/JetBrains/*/log
    $HOME/.local/share/JetBrains/*/tmp
    $HOME/.config/Cursor/Cache
    $HOME/.config/Cursor/CachedData
    $HOME/.config/Cursor/Code Cache
    $HOME/.config/Code/Cache
    $HOME/.config/Code/CachedData
    $HOME/.config/Code/Code Cache
    $HOME/.config/google-chrome/Default/Cache
    $HOME/.config/google-chrome/Default/Code Cache
    $HOME/.config/chromium/Default/Cache
    $HOME/.config/chromium/Default/Code Cache
    $HOME/.config/firefox/*/cache2
    $HOME/.mozilla/firefox/*/cache2
    $HOME/.mozilla/firefox/*/startupCache
    $HOME/.mozilla/firefox/*/OfflineCache

    # ---------------------------------------------------------------------------
    # Docker / Podman artifacts (images, layers, volumes, build cache).
    # Credentials/config are kept: ~/.docker/config.json, ~/.docker/contexts,
    # ~/.config/containers (registries.conf, auth.json) are NOT excluded.
    # ---------------------------------------------------------------------------
    $HOME/.docker/buildx
    $HOME/.docker/.token_seed
    $HOME/.podman
    $HOME/.local/share/containers
    $HOME/.local/share/docker

    # ---------------------------------------------------------------------------
    # Temporary files and directories
    # ---------------------------------------------------------------------------
    /**/*.tmp
    /**/*.temp
    /**/*.swp
    /**/*.swo
    /**/*~
    /**/.#*
    /**/*.part
    /**/*.crdownload
    /**/*.download
    /**/core
    /**/core.*
    /**/vgcore.*
    /**/hs_err_pid*
    /**/replay_pid*

    # ---------------------------------------------------------------------------
    # Python
    # ---------------------------------------------------------------------------
    /**/__pycache__
    /**/*.py[cod]
    /**/*.pyo
    /**/.pytest_cache
    /**/.mypy_cache
    /**/.ruff_cache
    /**/.tox
    /**/.nox
    /**/.hypothesis
    /**/.pytype
    /**/.coverage
    /**/htmlcov
    /**/.eggs
    /**/*.egg-info
    /**/.venv
    /**/venv
    /**/.virtualenv
    /**/__pypackages__
    /**/.ipynb_checkpoints
    /**/site-packages
    /**/dist
    /**/build
    /**/*.egg

    # ---------------------------------------------------------------------------
    # Node.js / JavaScript / TypeScript
    # ---------------------------------------------------------------------------
    /**/node_modules
    /**/.next
    /**/.nuxt
    /**/.output
    /**/.svelte-kit
    /**/.turbo
    /**/.parcel-cache
    /**/.cache
    /**/coverage
    /**/.nyc_output
    /**/bower_components
    /**/.pnpm-debug.log
    /**/npm-debug.log*
    /**/yarn-error.log

    # ---------------------------------------------------------------------------
    # Rust
    # ---------------------------------------------------------------------------
    /**/target

    # ---------------------------------------------------------------------------
    # Go
    # ---------------------------------------------------------------------------
    /**/vendor

    # ---------------------------------------------------------------------------
    # Java / Kotlin / Scala / JVM
    # ---------------------------------------------------------------------------
    /**/.gradle
    /**/build
    /**/out
    /**/.metals
    /**/.bloop
    /**/.bsp
    /**/.kotlin

    # ---------------------------------------------------------------------------
    # C / C++ / CMake
    # ---------------------------------------------------------------------------
    /**/cmake-build-*
    /**/CMakeFiles
    /**/CMakeCache.txt
    /**/*.o
    /**/*.obj
    /**/*.a
    /**/*.so
    /**/*.dylib
    /**/*.dll
    /**/*.exe
    /**/*.class

    # ---------------------------------------------------------------------------
    # Ruby
    # ---------------------------------------------------------------------------
    /**/.bundle
    /**/vendor/bundle
    /**/tmp/cache

    # ---------------------------------------------------------------------------
    # PHP
    # ---------------------------------------------------------------------------
    /**/vendor

    # ---------------------------------------------------------------------------
    # Elixir / Erlang
    # ---------------------------------------------------------------------------
    /**/_build
    /**/deps
    /**/.elixir_ls

    # ---------------------------------------------------------------------------
    # Haskell
    # ---------------------------------------------------------------------------
    /**/.stack-work
    /**/dist-newstyle
    /**/.cabal-sandbox

    # ---------------------------------------------------------------------------
    # Terraform / infrastructure
    # ---------------------------------------------------------------------------
    /**/.terraform
    /**/.terragrunt-cache
    /**/.vagrant

    # ---------------------------------------------------------------------------
    # Misc project build / artifact dirs
    # ---------------------------------------------------------------------------
    /**/obj
    /**/Debug
    /**/Release
    /**/x64
    /**/x86
    /**/.sass-cache
    /**/.angular
    /**/storybook-static
    /**/.docusaurus
    /**/.serverless
    /**/.webpack
    /**/.rollup.cache
    /**/.vite
    /**/.vitepress/cache
    /**/.nx/cache
    /**/.turbo
    /**/.direnv
    /**/.DS_Store
    /**/Thumbs.db

    # ---------------------------------------------------------------------------
    # Local restic repositories (avoid nesting backup repos into backup)
    # Adjust paths if your local repos live elsewhere.
    # ---------------------------------------------------------------------------
    $HOME/backup/restic
    EOF
