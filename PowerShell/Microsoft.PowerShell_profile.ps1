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

function gg() {
    param([string]$mensagem)
    try {
        Write-Host ""
        Write-Host "COMMIT RÁPIDO" -ForegroundColor Green
        Write-Host "------ ------" -ForegroundColor Green
        imprimir_msg "Status atual do repositório: " -nova_linha 1
        git status -s
        Write-Host ""
        imprimir_msg "Adicionando todos os arquivos alterados para o commit... " -nova_linha 0
        git add .
        imprimir_ok
        imprimir_msg "Realizando o commit... "  -nova_linha 1
        git commit -m $mensagem
        Write-Host "    ✅ Commit realizado!" -ForegroundColor Green
        Write-Host ""
        imprimir_msg "Último histórico de commit realizado: "  -nova_linha 1
        git log -1
        Write-Host ""
        imprimir_msg "Enviando conteúdo local para o repositório remoto... " -nova_linha 1
        git push
        Write-Host "    ✅ Arquivos enviados!" -ForegroundColor Green
    }
    catch {
        Write-Host "COMMIT RÁPIDO" -ForegroundColor Gray
        Write-Host ""
        Write-Host "Uso: gg <mensagem>"
        Write-Host "     novo -mensagem '<mensagem>'"
        Write-Host ""
        Write-Host "-mensagem       A comentário do commit."
        Write-Host ""
        Write-Host "Exemplo: novo -nome 'nome do arquivo.txt' -conteudo 'Olá Mundo'"
    }
}


function imprimir_msg {
    param([string]$mensagem, [bool]$nova_linha)
    Write-Host "[" -ForegroundColor Gray -NoNewline;
    Write-Host "*" -ForegroundColor Green -NoNewline;
    Write-Host "] $mensagem" -ForegroundColor Gray -NoNewline;
    if ($nova_linha) { Write-Host "" }
}

function imprimir_ok {
    Write-Host "OK" -ForegroundColor Green;
    Write-Host ""
}
