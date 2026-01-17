# Script para fazer o primeiro push do aplicativo para o GitHub
# Execute este script depois de criar o repositório no GitHub

Write-Host ""
Write-Host "🚀 PUBLICANDO APLICATIVO NO GITHUB PAGES" -ForegroundColor Cyan
Write-Host ""
Write-Host "⚠️  IMPORTANTE: Você precisa ter criado o repositório no GitHub primeiro!" -ForegroundColor Yellow
Write-Host ""

# Solicitar informações do usuário
$usuarioGitHub = Read-Host "Digite seu nome de usuário do GitHub"
$nomeRepositorio = Read-Host "Digite o nome do repositório (ex: sacramental-lds)"

if ([string]::IsNullOrWhiteSpace($usuarioGitHub) -or [string]::IsNullOrWhiteSpace($nomeRepositorio)) {
    Write-Host "❌ Erro: Usuário e nome do repositório são obrigatórios!" -ForegroundColor Red
    exit 1
}

$urlRepositorio = "https://github.com/$usuarioGitHub/$nomeRepositorio.git"

Write-Host ""
Write-Host "📋 Configuração:" -ForegroundColor Cyan
Write-Host "   Usuário: $usuarioGitHub" -ForegroundColor Gray
Write-Host "   Repositório: $nomeRepositorio" -ForegroundColor Gray
Write-Host "   URL: $urlRepositorio" -ForegroundColor Gray
Write-Host ""

$confirmar = Read-Host "Continuar? (S/N)"

if ($confirmar -ne "S" -and $confirmar -ne "s") {
    Write-Host "❌ Cancelado pelo usuário." -ForegroundColor Yellow
    exit 0
}

Write-Host ""
Write-Host "⏳ Configurando Git..." -ForegroundColor Cyan

try {
    # Verificar se já está inicializado
    if (-not (Test-Path ".git")) {
        Write-Host "   Inicializando repositório Git..." -ForegroundColor Gray
        git init
    }

    # Verificar se remote já existe
    $remoteExists = git remote get-url origin 2>$null
    if ($remoteExists) {
        Write-Host "   Removendo remote anterior..." -ForegroundColor Gray
        git remote remove origin
    }

    # Adicionar remote
    Write-Host "   Configurando repositório remoto..." -ForegroundColor Gray
    git remote add origin $urlRepositorio

    # Adicionar arquivos
    Write-Host "   Adicionando arquivos..." -ForegroundColor Gray
    git add .

    # Fazer commit
    Write-Host "   Fazendo commit..." -ForegroundColor Gray
    git commit -m "Initial commit - Aplicativo Sacramental LDS" 2>&1 | Out-Null

    # Renomear branch para main
    Write-Host "   Configurando branch main..." -ForegroundColor Gray
    git branch -M main 2>&1 | Out-Null

    Write-Host ""
    Write-Host "📤 Enviando código para o GitHub..." -ForegroundColor Cyan
    Write-Host "   (Se pedir autenticação, use um Personal Access Token como senha)" -ForegroundColor Yellow
    Write-Host ""

    # Fazer push
    git push -u origin main

    if ($LASTEXITCODE -eq 0) {
        Write-Host ""
        Write-Host "✅ Código enviado com sucesso!" -ForegroundColor Green
        Write-Host ""
        Write-Host "📋 PRÓXIMOS PASSOS:" -ForegroundColor Cyan
        Write-Host ""
        Write-Host "1. Acesse: https://github.com/$usuarioGitHub/$nomeRepositorio" -ForegroundColor White
        Write-Host "2. Vá em Settings → Pages" -ForegroundColor White
        Write-Host "3. Configure:" -ForegroundColor White
        Write-Host "   - Branch: main" -ForegroundColor Gray
        Write-Host "   - Folder: /docs" -ForegroundColor Gray
        Write-Host "4. Clique em Save" -ForegroundColor White
        Write-Host ""
        Write-Host "🌐 Seu site estará disponível em:" -ForegroundColor Cyan
        Write-Host "   https://$usuarioGitHub.github.io/$nomeRepositorio/" -ForegroundColor Green
        Write-Host ""
    } else {
        Write-Host ""
        Write-Host "❌ Erro ao fazer push. Verifique:" -ForegroundColor Red
        Write-Host "   - Se o repositório existe no GitHub" -ForegroundColor Yellow
        Write-Host "   - Se você tem permissão de acesso" -ForegroundColor Yellow
        Write-Host "   - Se você está usando um Personal Access Token como senha" -ForegroundColor Yellow
        Write-Host ""
    }

} catch {
    Write-Host ""
    Write-Host "❌ Erro: $_" -ForegroundColor Red
    Write-Host ""
}
