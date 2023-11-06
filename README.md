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

Do this once to initialize your dotfiles using chezmoi

```shell
dotfiles $GITHUB_USERNAME
```

## If you want to use this template

I recommend to fork it and apply your own changes.

For automated updates inside a coder take a look at .github/workflows/deploy.yml