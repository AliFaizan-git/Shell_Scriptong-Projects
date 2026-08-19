#!/bin/bash
set -euo pipefail

# Setup Logging Functions
log_info()  { echo "[$(date +'\%Y-\%m-\%dT\%H:\%M:\%S\%z')] [INFO] $*"; }
log_warn()  { echo "[$(date +'\%Y-\%m-\%dT\%H:\%M:\%S\%z')] [WARN] $*"; }
log_error() { echo "[$(date +'\%Y-\%m-\%dT\%H:\%M:\%S\%z')] [ERROR] $*" >&2; }

# Set Default Parameters
TARGET_ENV="${1:-dev}"
ALLOWED_ENVS="^(dev|staging|prod)$"

# Input Validation
if [[ ! "$TARGET_ENV" =~ $ALLOWED_ENVS ]]; then
    log_error "Invalid target environment '$TARGET_ENV'. Must be dev, staging, or prod."
    exit 1
fi

log_info "Initiating deployment for environment: $TARGET_ENV"

# Targeted Tracing for Critical Logic
set -x
DEPLOY_DIR="/tmp/deploy_${TARGET_ENV}"
mkdir -p "$DEPLOY_DIR"
set +x

log_info "Deployment workspace successfully created at $DEPLOY_DIR"