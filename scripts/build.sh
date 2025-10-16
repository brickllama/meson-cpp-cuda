#!/bin/bash
root_dir="$(dirname "$(pwd)")"

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