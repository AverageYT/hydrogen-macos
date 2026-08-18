#!/bin/bash -eux

if command -v greadlink >/dev/null 2>&1; then
  PLATFORM_ROOT=$(dirname $(dirname $(greadlink -f ${BASH_SOURCE[0]})))
elif command -v realpath >/dev/null 2>&1; then
  PLATFORM_ROOT=$(dirname $(dirname $(realpath "${BASH_SOURCE[0]}")))
else
  PLATFORM_ROOT=$(python3 -c 'import os,sys; print(os.path.dirname(os.path.dirname(os.path.realpath(sys.argv[1]))))' "${BASH_SOURCE[0]}")
fi
UNGOOGLED_REPO=$PLATFORM_ROOT/helium-chromium

_command=$1

$UNGOOGLED_REPO/devutils/update_platform_patches.py $_command $PLATFORM_ROOT/patches
