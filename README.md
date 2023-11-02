# hetzner coder template

This is based on https://github.com/ntimo/coder-hetzner-cloud-template

## The template currently does

(if not already done)

- install ohmyzsh with powerlevel10k theme and the following plugins
    - zsh-autosuggestions
    - zsh-syntax-highlighting
- install docker
- install docker-compose
- install rustup
- install nvm and node lts
- install yarn

When I create a new workspace I usually do the following:

- upload my .zshrc and .p10k.zsh files
- upload my gitconfig

This could also be automated but since it happens rarely I didn't bother.

## If you want to use this template

I recommend to fork it and apply your own changes.

For automated updates inside a coder take a look at .github/workflows/deploy.yml