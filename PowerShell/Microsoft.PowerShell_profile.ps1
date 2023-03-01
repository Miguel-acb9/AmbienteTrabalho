# Declaração de Alias
New-Alias v nvim
New-Alias e explorer

Invoke-Expression (&starship init powershell)
$ENV:STARSHIP_CONFIG = "C:\Users\miguel\.config\starship.toml"

function dev {
    param([string]$local)
    Switch ($local) {
        "macb"   { Set-Location -Path "$HOME/Projetos/MacB/" }
        "miguel" { Set-Location -Path "$HOME/Projetos/Miguel" }
        "mirage" { Set-Location -Path "$HOME/Projetos/Mirage" }
        default  { Set-Location -Path "$HOME/Projetos/" }
    }
    Get-ChildItem
}

function novo {
    param([string]$nome, [string]$conteudo)

    try {
        New-Item -ItemType File $nome
        Set-Content -Path $nome -Value $conteudo
    }
    catch {
        Write-Host "NOVO ARQUIVO"
        Write-Host ""
        Write-Host "Uso: novo <nome_arquivo> <conteudo>"
        Write-Host "     novo -nome '<nome_arquivo>' -conteudo '<conteudo>'"
        Write-Host ""
        Write-Host "-nome           O nome do arquivo junto com sua extenção."
        Write-Host "-conteudo       O conteúdo do arquivo."
        Write-Host ""
        Write-Host "Exemplo: novo -nome 'nome do arquivo.txt' -conteudo 'Olá Mundo'"
    }
}
