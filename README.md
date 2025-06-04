# Configuración de neovim

## 🛠️ Installación

Si se desea realizar una copia de seguridad se puede hacer de la siguiente forma
```powershell
Move-Item $env:LOCALAPPDATA\nvim $env:LOCALAPPDATA\nvim.bak
Move-Item $env:LOCALAPPDATA\nvim-data $env:LOCALAPPDATA\nvim-data.bak
```

Si solo se desea borrar los archivos se pueden usar los siguientes comandos
```powershell
Remove-Item $env:LOCALAPPDATA\nvim -Recurse
Remove-Item $env:LOCALAPPDATA\nvim-data -Recurse
```

```powershell
git clone https://github.com/n4chh/nvim.conf  $env:LOCALAPPDATA\nvim
nvim 
```
