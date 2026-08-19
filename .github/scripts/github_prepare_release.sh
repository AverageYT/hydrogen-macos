#!/bin/bash -eux

if command -v greadlink >/dev/null 2>&1; then
  _root_dir="$(dirname "$(greadlink -f "$0")")"
elif command -v realpath >/dev/null 2>&1; then
  _root_dir="$(dirname "$(realpath "$0")")"
else
  _root_dir="$(python3 -c 'import os,sys; print(os.path.dirname(os.path.realpath(sys.argv[1])))' "$0")"
fi
_main_repo="$_root_dir/helium-chromium"

_helium_version=$(python3 "$_main_repo/utils/hydrogen_version.py" --tree "$_main_repo" --platform-tree "$_root_dir" --print)

_file_name_base="helium_${_helium_version}"
_x64_file_name="${_file_name_base}_x86_64-macos.dmg"
_arm64_file_name="${_file_name_base}_arm64-macos.dmg"

echo "x64_file_name=$_x64_file_name" >> $GITHUB_OUTPUT
echo "arm64_file_name=$_arm64_file_name" >> $GITHUB_OUTPUT
echo "release_tag_version=$_helium_version" >> $GITHUB_OUTPUT
echo "release_name=$_helium_version" >> $GITHUB_OUTPUT
