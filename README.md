## Some configs

### Requirements 
> Make a script to install these automatically on both platforms --ansible--
- gcc and g++ (windows)
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

### Use nvim configs
- Install nvchad
    - Windows
    ```shell
     Windows: git clone https://github.com/NvChad/NvChad $HOME\AppData\Local\nvim --depth 1 | nvim
    ```

    - macOS/Linux
     ```shell
     git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim
    ```
- Clone this repo
    ```shell
    git clone https://github.com/shtayeb/.dotfiles.git
    ```
- Create symlink to custom folder of nvchad
    ```shell
    New-Item -ItemType SymbolicLink -Path "C:\Users\<USERNAME>\AppData\Local\nvim\lua\custom" -Target "<CLONED_LOCATION>\.dotfiles\nvim\lua\custom"
    ```
