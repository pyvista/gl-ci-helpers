#!/bin/bash
set -eo pipefail

if [[ "$RUNNER_OS" == "Linux "]]; then
    source ./setup_xvfb.sh
elif [[ "$RUNNER_OS" == "macOS" ]]; then
    exit 0
elif [[ "$RUNNER_OS" == "Windows" ]]; then
    powershell ./appveyor/install_opengl.ps1
else
    echo "Unknown RUNNER_OS: \"${RUNNER_OS}\""
    exit 1
fi
