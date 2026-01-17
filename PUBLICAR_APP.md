# 🚀 Como Publicar seu App no GitHub Pages

## Passo 1: Criar Repositório no GitHub

1. **Acesse o GitHub:**
   - Vá para [github.com](https://github.com)
   - Faça login ou crie uma conta (é grátis!)

2. **Criar novo repositório:**
   - Clique no botão **"+"** no canto superior direito
   - Selecione **"New repository"**

3. **Configurar o repositório:**
   - **Repository name:** `sacramental-lds` (ou outro nome de sua escolha)
   - **Description:** (opcional) "Sistema Sacramental LDS"
   - **Visibility:** Escolha **Public** ou **Private**
   - ⚠️ **NÃO marque** "Add a README file" (já temos um)
   - ⚠️ **NÃO marque** "Add .gitignore" (já temos um)
   - ⚠️ **NÃO marque** "Choose a license"
   - Clique em **"Create repository"**

## Passo 2: Conectar Repositório Local ao GitHub

### No PowerShell (Windows), execute:

```powershell
# 1. Verificar se você está na pasta do projeto
cd C:\Users\ariel\Sacramental

# 2. Adicionar todos os arquivos ao Git
git add .

# 3. Fazer o primeiro commit
git commit -m "Initial commit - Aplicativo Sacramental LDS"

# 4. Adicionar o repositório remoto do GitHub
# SUBSTITUA SEU_USUARIO pelo seu nome de usuário do GitHub
git remote add origin https://github.com/SEU_USUARIO/sacramental-lds.git

# 5. Renomear branch para main (se necessário)
git branch -M main

# 6. Enviar código para o GitHub
git push -u origin main
```

### ⚠️ Na primeira vez, o GitHub pode pedir autenticação:

- Se pedir **usuário e senha**, use um **Personal Access Token** (não sua senha)
- Para criar um token: [github.com/settings/tokens](https://github.com/settings/tokens)
- Clique em **"Generate new token"** → **"Generate new token (classic)"**
- Dê um nome: "Sacramental Deploy"
- Selecione o escopo: **`repo`** (marcar todas as opções)
- Clique em **"Generate token"**
- **COPIE O TOKEN** (você não poderá vê-lo novamente!)
- Use o token como senha quando o Git pedir

## Passo 3: Habilitar GitHub Pages

1. **Acesse seu repositório no GitHub:**
   - Vá para `https://github.com/SEU_USUARIO/sacramental-lds`

2. **Abrir Configurações:**
   - Clique na aba **"Settings"** (no topo do repositório)
   - Role para baixo até encontrar **"Pages"** no menu lateral esquerdo

3. **Configurar GitHub Pages:**
   - Em **"Source"**, selecione:
     - **Branch:** `main` (ou `master` se aparecer)
     - **Folder:** `/docs` (é muito importante selecionar `/docs`!)
   - Clique em **"Save"**

4. **Aguardar deploy:**
   - Você verá uma mensagem: *"Your site is live at..."*
   - Aguarde 2-5 minutos para o primeiro deploy

## Passo 4: Obter o Domínio (URL do Site)

Após alguns minutos, seu site estará disponível em:

```
https://SEU_USUARIO.github.io/sacramental-lds/
```

**Exemplo:**
- Se seu usuário é `joaosilva`
- Seu repositório é `sacramental-lds`
- Seu site será: `https://joaosilva.github.io/sacramental-lds/`

### 📍 Onde encontrar a URL:

1. Vá para **Settings → Pages** do seu repositório
2. Você verá: **"Your site is live at: https://..."**
3. Clique na URL para abrir o site

## Passo 5: Configurar Firebase (Opcional)

Se você usar Firebase Authentication, precisa adicionar o domínio autorizado:

1. **Acesse Firebase Console:**
   - Vá para [console.firebase.google.com](https://console.firebase.google.com)
   - Selecione seu projeto

2. **Adicionar domínio autorizado:**
   - Vá em **Authentication → Settings**
   - Clique em **"Authorized domains"**
   - Clique em **"Add domain"**
   - Adicione: `SEU_USUARIO.github.io`
   - Clique em **"Add"**

## 🔄 Atualizar o Site

Sempre que você fizer alterações no `index.html`:

```powershell
# 1. Copiar index.html para docs/
.\update-docs.ps1

# 2. Adicionar alterações ao Git
git add docs/index.html

# 3. Fazer commit
git commit -m "Atualização do aplicativo"

# 4. Enviar para o GitHub
git push
```

O GitHub Pages irá atualizar automaticamente em 1-2 minutos!

## ❓ Problemas Comuns

### ❌ "Repository not found"
- Verifique se o nome do usuário e repositório estão corretos
- Verifique se você tem permissão de acesso

### ❌ "Branch main not found"
- Use `git branch -M main` para renomear a branch
- Ou selecione a branch correta em Settings → Pages

### ❌ Site mostra 404
- Verifique se a pasta está configurada como `/docs` em Settings → Pages
- Verifique se o arquivo `docs/index.html` existe no repositório
- Aguarde mais alguns minutos (pode demorar até 10 minutos na primeira vez)

### ❌ Erro de autenticação ao fazer push
- Crie um Personal Access Token no GitHub
- Use o token como senha (não sua senha do GitHub)

## 📱 Compartilhar seu App

Agora você pode compartilhar a URL com outras pessoas:

```
https://SEU_USUARIO.github.io/sacramental-lds/
```

**É grátis e ilimitado!** 🎉

## 🌐 Domínio Personalizado (Opcional)

Se você quiser usar seu próprio domínio (ex: `sacramental.com`):

1. Em **Settings → Pages**, role até **"Custom domain"**
2. Digite seu domínio: `sacramental.com`
3. Configure os registros DNS no seu provedor de domínio:
   - Tipo: `CNAME`
   - Nome: `@` ou `www`
   - Valor: `SEU_USUARIO.github.io`
4. Aguarde a propagação DNS (pode levar até 24 horas)

---

**Pronto! Seu aplicativo está no ar! 🚀**
