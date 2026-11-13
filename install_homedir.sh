#!/usr/bin/env bash
#
# Symlink the dotfiles (and exclude.list) from this repo into the home directory.
#
# For each item:
#   - Target missing:          create the symlink.
#   - Already the right link:  skip.
#   - Target exists:           ask "ok to override? [y/N]" (default no).
#       - regular file/dir:    moved to <name>.bkp, then linked.
#       - other symlink:       replaced by the new link.
#
# Only top-level dot entries and exclude.list are linked. .git, local tooling
# files are skipped. .gnupg is not linked as a directory (keys/sockets; see
# README); only .gnupg/gpg-agent.conf and .gnupg/gpg.conf are linked.

set -euo pipefail

usage() {
    echo "Usage: ${0##*/} [target_dir]"
    echo "  target_dir  Directory to link into (default: ${HOME})"
}

if [[ "${1:-}" == "-h" || "${1:-}" == "--help" ]]; then
    usage
    exit 0
fi

if [[ $# -gt 1 ]]; then
    usage
    exit 1
fi

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET_DIR="${1:-${HOME}}"

# Dot entries that are never linked.
SKIP=(
    .git
    .DS_Store
    .ai-dc
    .ai-docker.yaml
    .gnupg
)

is_skipped() {
    local name="${1}"
    local skip
    for skip in "${SKIP[@]}"; do
        [[ "${name}" == "${skip}" ]] && return 0
    done
    return 1
}

# Default is no: only y/yes (any case) returns success.
confirm() {
    local answer
    read -r -p "${1} [y/N] " answer || answer=""
    [[ "${answer}" =~ ^[Yy]([Ee][Ss])?$ ]]
}

link_item() {
    local name="${1}"
    local src="${REPO_DIR}/${name}"
    local dest="${TARGET_DIR}/${name}"

    if [[ -L "${dest}" && "$(readlink "${dest}")" == "${src}" ]]; then
        echo "ok:      ${dest} already linked"
        return 0
    fi

    if [[ -e "${dest}" || -L "${dest}" ]]; then
        if ! confirm "${dest} exists. Override?"; then
            echo "skipped: ${dest}"
            return 0
        fi
        if [[ -L "${dest}" ]]; then
            rm "${dest}"
        else
            mv "${dest}" "${dest}.bkp"
            echo "backup:  ${dest}.bkp"
        fi
    fi

    ln -s "${src}" "${dest}"
    echo "linked:  ${dest} -> ${src}"
}

main() {
    local path name
    local items=()

    for path in "${REPO_DIR}"/.[!.]* "${REPO_DIR}/exclude.list"; do
        [[ -e "${path}" || -L "${path}" ]] || continue
        name="${path##*/}"
        is_skipped "${name}" && continue
        items+=("${name}")
    done

    # Only these two files are linked from .gnupg; the directory itself is
    # real and holds keys/sockets. gpg requires it to be mode 700.
    mkdir -p "${TARGET_DIR}/.gnupg"
    chmod 700 "${TARGET_DIR}/.gnupg"
    items+=(.gnupg/gpg-agent.conf .gnupg/gpg.conf)

    for name in "${items[@]}"; do
        link_item "${name}"
    done
}

main
