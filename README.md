# pre-commit-hooks

A collection of git [pre-commit](https://pre-commit.com/) hooks I use in my own repositories.

## Using pre-commit-hooks with pre-commit

```yaml
- repo: https://github.com/rasmusjp/pre-commit-hooks
  rev: v0.1.0
  hooks:
  # - id: ...
```
## Hooks available

### encrypt-sops-files

Encrypts unencrypted files with the `.encrypted` file extension.

Requires the [sops](https://github.com/getsops/sops) executable to be available in `PATH`.
