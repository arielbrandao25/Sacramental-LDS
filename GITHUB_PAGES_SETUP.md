# 🚀 Guia de Migração para GitHub Pages

## ✅ O que já foi configurado

- ✅ Pasta `docs/` criada com `index.html`
- ✅ Arquivo `.nojekyll` criado (desabilita Jekyll)
- ✅ Workflow do GitHub Actions configurado (deploy automático)
- ✅ Repositório Git inicializado
- ✅ Scripts de atualização criados

## 📝 Próximos Passos

### 1. Criar repositório no GitHub

1. Acesse [github.com/new](https://github.com/new)
2. Nome do repositório: `sacramental-lds` (ou outro nome de sua escolha)
3. **Não** marque "Initialize with README" (já temos um)
4. Clique em "Create repository"

### 2. Conectar repositório local ao GitHub

No PowerShell, execute:

```powershell
# Adicionar arquivos ao Git
git add .

# Fazer commit inicial
git commit -m "Initial commit - Migração para GitHub Pages"

# Adicionar repositório remoto (SUBSTITUA SEU_USUARIO pelo seu nome de usuário do GitHub)
git remote add origin https://github.com/SEU_USUARIO/sacramental-lds.git

# Mudar para branch main
git branch -M main

# Fazer push
git push -u origin main
```

### 3. Habilitar GitHub Pages

1. No GitHub, vá para o seu repositório
2. Clique em **Settings** (Configurações)
3. No menu lateral, clique em **Pages**
4. Em **Source**, selecione:
   - **Branch:** `main` (ou `master`)
   - **Folder:** `/docs`
5. Clique em **Save**

### 4. Aguardar deploy

Após alguns minutos (geralmente 2-5 minutos), seu site estará disponível em:

```
https://SEU_USUARIO.github.io/sacramental-lds/
```

### 5. Configurar Firebase (Opcional)

Se você quiser configurar domínios autorizados no Firebase:

1. Acesse [Firebase Console](https://console.firebase.google.com)
2. Selecione seu projeto
3. Vá em **Authentication > Settings > Authorized domains**
4. Adicione: `SEU_USUARIO.github.io`

## 🔄 Atualizar o site

Sempre que você atualizar o `index.html`:

```powershell
# Executar script de atualização
.\update-docs.ps1

# Ou copiar manualmente
Copy-Item -Path "index.html" -Destination "docs\index.html" -Force

# Fazer commit e push
git add docs/index.html
git commit -m "Atualização do aplicativo"
git push
```

O GitHub Pages irá atualizar automaticamente em 1-2 minutos.

## ❓ Problemas Comuns

### Site não carrega após alguns minutos

- Verifique se a branch está correta em Settings > Pages
- Verifique se a pasta está configurada como `/docs`
- Aguarde 5-10 minutos na primeira vez (pode demorar)

### Erro 404

- Verifique se o arquivo `docs/index.html` existe
- Verifique se o arquivo `.nojekyll` está em `docs/`
- Verifique se fez push dos arquivos corretamente

### Mudanças não aparecem

- Aguarde 1-2 minutos após o push
- Limpe o cache do navegador (Ctrl+Shift+R ou Cmd+Shift+R)
- Verifique se o arquivo `docs/index.html` foi atualizado no repositório

## 🎉 Pronto!

Seu aplicativo está agora no GitHub Pages! 🚀
