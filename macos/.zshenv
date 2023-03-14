# PATH for Google Cloud SDK.
if [ -f '/Users/raphaelgc/Dev/SDK/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/raphaelgc/Dev/SDK/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/raphaelgc/Dev/SDK/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/raphaelgc/Dev/SDK/google-cloud-sdk/completion.zsh.inc'; fi

# MacPorts Installer addition on 2021-10-31_at_18:09:10: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

# Added by Toolbox App
export PATH="$PATH:/Users/raphaelgc/Library/Application Support/JetBrains/Toolbox/scripts"

# PATH for flutter
export PATH="$PATH:/Users/raphaelgc/Dev/flutter/bin"

# Use Brave instead of Chrome for web-dev in Flutter
export CHROME_EXECUTABLE="/Applications/Brave Browser.app/Contents/MacOS/Brave Browser"

export HOMEBREW_GITHUB_API_TOKEN=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

# PATH for Maven
export M3_HOME="/Users/raphaelgc/Dev/SDK/apache-maven-3.8.5"
export M3="${M3_HOME}/bin"
export PATH="${M3}:${PATH}"

# PATH for pnpm
export PNPM_HOME="/Users/raphaelgc/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"

# Ajouter les outils du kit SDK .NET Core
export PATH="$PATH:/Users/raphaelgc/.dotnet/tools"

. "$HOME/.cargo/env"

export SOPS_AGE_KEY_FILE=$HOME/.sops/key.txt

export PATH="/opt/homebrew/opt/openssl@3/bin:$PATH"

export PATH="/opt/homebrew/opt/make/libexec/gnubin:$PATH"

export PYENV_ROOT=$HOME/.pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"