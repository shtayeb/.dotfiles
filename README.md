## Some configs

### Use nvim configs in windows
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
