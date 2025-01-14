# My Setup

## TODO
- Add remove existing oh-my-zsh, nerdfont install in zsh
- Test python setup
- Create windows specific setup

## Requirement
### Install ansible

```shell
sudo apt-add-repository -y ppa:ansible/ansible
sudo apt-get update -y
sudo apt-get install -y curl git software-properties-common ansible
```
### Clone this repo
```shell
git clone https://github.com/shtayeb/.dotfiles.git
```
## Setup ubuntu

### In WSL or terminal based usage

If you are me

```shell
ansible-playbook ubuntu-ansible.yml --tags install --tags git-personal
```

if you are not me

```shell
ansible-playbook ubuntu-ansible.yml -t install
```

### In GUI

The me rule applies

```shell
ansible-playbook ubuntu-ansible.yml
```

### Requirements for nvim windows

> Make a script to install these automatically on both platforms --ansible--

- mingw-64 - gcc and g++ (windows) [Download Here](https://github.com/niXman/mingw-builds-binaries/releases)
- pwsh (windows)
  - [Directories setup](https://learn.microsoft.com/en-us/powershell/scripting/whats-new/migrating-from-windows-powershell-51-to-powershell-7?view=powershell-7.4)
- git
- GNU tar
- 7-zip or winrar (windows)
- neovim
- nerdfonts
- required for nvim plugins

  ```shell
  winget install BurntSushi.ripgrep.MSVC

  winget install sharkdp.fd
  ```

- For windows you might need to install some other things, so check for error in nvim

> In windows make sure to remove aliases for python in windows aliases in settings [here](https://stackoverflow.com/questions/57485491/python-python3-executes-in-command-prompt-but-does-not-run-correctly/65520328#65520328)
> Or remove the python.exe from `C:\Users\shahr\AppData\Local\Microsoft\WindowsApps`

> additional setup to use powershell in float terminal [Here](https://github.com/akinsho/toggleterm.nvim/wiki/Tips-and-Tricks#using-toggleterm-with-powershell)

### Some notes

- Install nvchad

  - Windows

  ```shell
   Windows: git clone https://github.com/NvChad/NvChad $HOME\AppData\Local\nvim --depth 1 | nvim
  ```

- Create symlink to custom folder of nvchad
  ```shell
  New-Item -ItemType SymbolicLink -Path "C:\Users\<USERNAME>\AppData\Local\nvim\lua\custom" -Target "<CLONED_LOCATION>\.dotfiles\nvim\lua\custom"
  ```

## Wezterm Terminal Simulator
Link dotfiles to wezterm configs
```shell
  New-Item -ItemType SymbolicLink -Path "C:\Users\<USERNAME>\.config\wezterm" -Target "<CLONED_LOCATION>\.dotfiles\wezterm"
```

```shell
New-Item -ItemType SymbolicLink -Path "<USER_LOCATION>Documents\Powershell\Microsoft.PowerShell_profile.ps1" -Target "<DOTFILE_LOCATION>\dotfiles\Microsoft.PowerShell_profile.ps1"
```

## Windows winget libs
```shell
winget install fzf tldr sharkdp.bat eza-community.eza sharkdp.fd BurntSushi.ripgrep.MSVC 
```

```shell
ln -s ~/.dotfiles/.zshrc ~/.zshrc

ln -s ~/.dotfiles/wezterm ~/.config/wezterm
```

## tmux
tpm -> plugin manager
```shell
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```
