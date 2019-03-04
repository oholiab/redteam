# Hooks
This directory contains copies of the hooks scripts (installed in `.git/hooks`)
for visibility.

## Dorks
The pre-commit hook currently just contains support for dorks as configured in
`../.dorks` in yaml format.

Currently there's a check for anything that looks like a DigitalOcean token in
any of the file contents. If something that looks like that is checked in, it
won't be committed :D

## Circumventing
Use the `--no-verify` flag when running a git commit
