# The architecture of the running shell
# Also used to determine the build target architecture
_arch="$(/usr/bin/uname -m)"

# General paths
if command -v greadlink >/dev/null 2>&1; then
  _root_dir=$(dirname "$(greadlink -f "$0")")
elif command -v realpath >/dev/null 2>&1; then
  _root_dir=$(dirname "$(realpath "$0")")
else
  _root_dir=$(python3 -c 'import os,sys; print(os.path.dirname(os.path.realpath(sys.argv[1])))' "$0")
fi
_download_cache="$_root_dir/build/download_cache"
_src_dir="$_root_dir/build/src"
_out_dir="$_src_dir/out/Default"
_main_repo="$_root_dir/helium-chromium"
_subs_cache="$_root_dir/build/subs.tar.gz"
_namesubs_cache="$_root_dir/build/namesubs.tar"

# SISO paths
_depot_tools_dir="$_src_dir/third_party/depot_tools"
_siso_dir="$_src_dir/third_party/siso/cipd"
_siso_path="$_siso_dir/siso"
