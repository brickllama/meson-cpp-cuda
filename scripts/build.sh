#!/bin/bash
script_dir="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
root_dir="$(dirname "${script_dir}")"

# Go to the projects root directory
cd "${root_dir}" || exit

# If builddir doesn't exist, setup
if [ ! -d "builddir" ]; then
    meson setup builddir
# Otherwise, reconfigure to play it safe
else
    meson setup --reconfigure builddir
fi

# Now compile
meson compile -C builddir