#!/bin/bash
set -euo pipefail

INPUT_TAG="${1:-}"

TAG_REGEX='^v[0-9]+\.[0-9]+\.[0-9]+(-(alpha|beta|rc)[0-9]+)?$'

if [[ -z "$INPUT_TAG" ]]; then
    echo "Error: No image tag provided." >&2
    echo "Usage: $0 <image_tag>" >&2
    exit 1
fi

if [[ ! "$INPUT_TAG" =~ $TAG_REGEX ]]; then
    echo "Error: Invalid image tag format '$INPUT_TAG'." >&2
    echo "Tag must follow format 'vX.Y.Z' or 'vX.Y.Z-(alpha|beta|rc)N'." >&2
    exit 1
fi

echo "Valid image tag: $INPUT_TAG"