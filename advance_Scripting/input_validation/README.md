# Docker Image Tag Validator

A defensive Bash script template that validates input parameters against semantic versioning and environment tagging specifications using regular expressions.

---

## Validation Requirements

### General Rules
* **Mandatory Prefix:** The tag must start with a semantic versioning prefix: `v` followed by major, minor, and patch numbers separated by dots (e.g., `v1.0.0`, `v2.12.4`).
* **Optional Suffix:** Optionally, the tag may end with an environment suffix: a hyphen followed by `alpha`, `beta`, or `rc` and a number (e.g., `-alpha1`, `-beta2`, `-rc3`).

### Test Cases

| Input Tag | Status | Reason |
| :--- | :--- | :--- |
| `v1.0.0` | **Valid** | Standard semantic versioning |
| `v2.15.3-alpha1` | **Valid** | Valid pre-release suffix (`-alpha1`) |
| `v0.4.12-rc2` | **Valid** | Valid release candidate suffix (`-rc2`) |
| `1.0.0` | **Invalid** | Missing leading `v` |
| `v1.0` | **Invalid** | Missing patch version |
| `v1.0.0-prod` | **Invalid** | Unsupported environment suffix (`-prod`) |
| `v1.0.0; rm -rf /` | **Invalid** | Injection attempt (illegal characters) |

---