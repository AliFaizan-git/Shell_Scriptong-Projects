# Defensive Scripting Demo

A minimal proof-of-concept script demonstrating Bash strict mode runtime controls (`set -euo pipefail`) and signal trapping (`trap`) for automated resource lifecycle management.

---

## Features

* **Strict Mode (`set -euo pipefail`):** Halts script execution immediately on unhandled command failures, unset variable evaluations, or pipe errors.
* **Dynamic Workspace (`mktemp`):** Provisions an isolated, uniquely named workspace in `/tmp` to avoid race conditions.
* **Automated Teardown (`trap`):** Intercepts process termination signals to guarantee temporary file cleanup regardless of exit status.

---