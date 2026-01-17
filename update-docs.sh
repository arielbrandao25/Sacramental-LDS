#!/bin/bash
# Script para atualizar a pasta docs com o index.html principal
# Execute este script sempre que atualizar o index.html

echo "📋 Copiando index.html para docs/..."
cp index.html docs/index.html
echo "✅ Arquivo copiado com sucesso!"
echo ""
echo "💡 Próximos passos:"
echo "   1. git add docs/index.html"
echo "   2. git commit -m 'Atualização do aplicativo'"
echo "   3. git push"
