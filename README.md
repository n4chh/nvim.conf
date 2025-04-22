# Configuración de neovim

## 🛠️ Installación

Si se desea realizar una copia de seguridad se puede hacer de la siguiente forma
```bash
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
```

Si solo se desea borrar los archivos se pueden usar los siguientes comandos
```bash
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim
```
## Instalación de packer
Antes de clonar este repo, es necesario instalar packer. Para ello se pueden utilizar los siguientes comandos:
```bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```
Aun así es recomendable revisar la instalación que se recomienda en la propia documentación
```bash
git clone https://github.com/n4chh/nvim.conf ~/.config/nvim
nvim --cmd PackerSync
```
