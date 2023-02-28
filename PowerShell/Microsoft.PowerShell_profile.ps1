# Declaração de Alias
New-Alias v nvim
New-Alias e explorer

Invoke-Expression (&starship init powershell)
$ENV:STARSHIP_CONFIG = "C:\Users\miguel\.config\starship.toml"

function dev {
    param ($location)
    Switch ($location) {
        "macb"   { Set-Location -Path "$HOME/Projetos/MacB/" }
        "miguel" { Set-Location -Path "$HOME/Projetos/Miguel" }
        "mirage" { Set-Location -Path "$HOME/Projetos/Mirage" }
        default  { Set-Location -Path "$HOME/Projetos/" }
    }
}
