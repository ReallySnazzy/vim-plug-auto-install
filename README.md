# vim-plug-auto-install
Automatically calls :PlugInstall/:PlugClean as needed when you update your init.vim packages. 
This plugin saves a few keystrokes on install and helps to keep you from forgetting to cleanup unused plugins. 
Only necessary commands will be ran, a file is created that keeps track of your currently installed plugins.

## Compatibility
This is only compatible with VimPlug. All of it's testing is done on Neovim, but it likely works with Vim too.

## Usage
0. Follow setup steps below.
1. Add or remove a plugin from your init.vim / vimrc.
2. Restart Vim/Neovim and your Plugin should be automatically installed or uninstalled.
3. (optional) An additional restart might be needed depending on what action is being performed.

## Setup
0. Add `Plug "ReallySnazzy/vim-plug-auto-install"` to your init.vim/vimrc
1. Run :PlugInstall
3. Restart Vim/Neovim
4. Add `call PlugManageAsNeeded()` to the last line of your init.vim / vimrc
