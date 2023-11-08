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

Use this command once to initialize your dotfiles using chezmoi
(if you have added your coder ssh key to your github account)

```shell
dotfiles git@github.com:$GITHUB_USERNAME/dotfiles.git
```

## If you want to use this template

I recommend to fork this repository and apply your own changes.

For automated deployments to your coder instance take a look at .github/workflows/deploy.yml