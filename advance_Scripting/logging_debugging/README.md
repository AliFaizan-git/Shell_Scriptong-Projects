# Module 2 Lab: Logging, Tracing, and Static Analysis

A production-ready reference pattern demonstrating structured logging, target tracing (`set -x`), and static analysis enforcement in Bash.

---

## Lab Architecture

[Execution Start] ──> Log ISO Timestamped Info
│
Validate Environment Input
│
┌────────────────┴────────────────┐
[Input Invalid]                   [Input Valid]
│                                 │
Log ERROR to stderr               Targeted Tracing (set -x)
& Exit Code 1                              │
Provision Workspace
│
Disable Tracing (set +x)
│
Log Final Status


---

## Features

* **ISO 8601 Logging:** Unified formatting using ISO-compliant timestamps (`YYYY-MM-DDTHH:MM:SSz`).
* **Stderr Isolation:** Error logs route directly to `stderr` (`>&2`) to prevent data corruption in command pipelines.
* **Targeted Tracing:** Confines execution debugging (`set -x` / `set +x`) exclusively to high-risk code blocks.
* **ShellCheck Compliant:** Adheres strictly to POSIX/Bash static analysis standards.

---