# Server
This directory contains automation tools for setting up a red teaming server

## Terraform
For instantiating a server
### Prerequisites
- terraform
- make
- pass
- An ecdsa ssh keypair in `$HOME/.ssh/id_ecdsa{,.pub}`
  - Hack the Makefile if you want to change this
### Instructions
- Use `pass` to store your digitalocean token
  - `pass insert redteam_do_token`
  - Alternatively hack the Makefile to change the password command
- `make plan` eyeball the output and then `make apply`
- State is gitignored, so you'll need to ensure you manage your own state
  sensibly

## Ansible
For setting up your server
### Prerequisites
- ansible
- jq
- have already run the above terraform
### Instructions
- `cp private-example.yml private.yml`
  - edit in your crap you don't want all over github
  - this will be `.gitignored` so if you want a backup you should do that
    yourself!
- `make setup`
  - You'll be prompted to enter a password for the new user
- `make <FEATURENAME>` to install a feature
  - `make list-features` to get a list
- `make features` to install em all!
