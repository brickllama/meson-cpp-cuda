#!/bin/bash
script_dir="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
root_dir="$(dirname "${script_dir}")"
build_dir="${root_dir}/builddir"

# Set this
exe_name="cpp-cuda"

# Check if build dir
if [[ ! -d "${build_dir}" || ! -f "${build_dir}/${exe_name}" ]]; then
    "${script_dir}/build.sh"
fi

"${build_dir}/${exe_name}"