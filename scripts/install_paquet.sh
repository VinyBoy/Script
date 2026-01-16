#!/usr/bin/bash

set -euo pipefail

need_cmd() { command -v "$1" > dev/null 2>&1;  }

install_pkg()
{
    local pkg="$1"
    if dpkg -s "$pkg" >/dev/null 2>&1; then
        echo "✅ $pkg is install."
    else
       echo "⬇️  Install $pkg..."
        sudo apt-get update -y
        sudo apt-get install -y "$pkg"
    fi
}
