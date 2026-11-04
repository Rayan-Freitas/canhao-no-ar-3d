# Publica o jogo no GitHub e liga o GitHub Pages (rodar uma vez só).
# Depois disso, cada "git push" na branch main atualiza o site sozinho.
$ErrorActionPreference = 'Stop'
$gh = 'C:\Program Files\GitHub CLI\gh.exe'
Set-Location $PSScriptRoot

# 1. Cria o repositório público e envia o código
& $gh repo create canhao-no-ar-3d --public --source . --remote origin --push `
  --description 'Jogo 3D no navegador: sem chão, se mantenha no ar com bolas de canhão'

# 2. Liga o GitHub Pages servindo a branch main, pasta raiz
& $gh api 'repos/{owner}/{repo}/pages' -X POST -f 'source[branch]=main' -f 'source[path]=/' | Out-Null

$user = & $gh api user --jq .login
Write-Host ''
Write-Host "Pronto. O site fica no ar em 1 a 2 minutos:"
Write-Host "https://$user.github.io/canhao-no-ar-3d/"
