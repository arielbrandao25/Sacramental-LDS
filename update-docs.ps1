# Script para atualizar a pasta docs com o index.html principal
# Execute este script sempre que atualizar o index.html

Write-Host "📋 Copiando index.html para docs/..." -ForegroundColor Cyan
Copy-Item -Path "index.html" -Destination "docs\index.html" -Force
Write-Host "✅ Arquivo copiado com sucesso!" -ForegroundColor Green
Write-Host ""
Write-Host "💡 Próximos passos:" -ForegroundColor Yellow
Write-Host "   1. git add docs/index.html" -ForegroundColor Gray
Write-Host "   2. git commit -m 'Atualização do aplicativo'" -ForegroundColor Gray
Write-Host "   3. git push" -ForegroundColor Gray
