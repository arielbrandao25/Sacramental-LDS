# Sacramental LDS

Sistema moderno de planejamento e gerenciamento sacramental para alas da Igreja de Jesus Cristo dos Santos dos Últimos Dias.

## 🚀 Deploy no GitHub Pages

Este aplicativo está configurado para fazer deploy no GitHub Pages automaticamente.

### Passo 1: Criar repositório no GitHub

1. Acesse [github.com](https://github.com) e crie um novo repositório
2. Nomeie o repositório (ex: `sacramental-lds`)
3. Não inicialize com README (já temos um)

### Passo 2: Configurar o repositório local

```bash
# Inicializar Git (se ainda não foi feito)
git init

# Adicionar todos os arquivos
git add .

# Fazer commit inicial
git commit -m "Initial commit"

# Adicionar repositório remoto (substitua SEU_USUARIO pelo seu nome de usuário do GitHub)
git remote add origin https://github.com/SEU_USUARIO/sacramental-lds.git

# Mudar para branch main (se necessário)
git branch -M main

# Fazer push
git push -u origin main
```

### Passo 3: Habilitar GitHub Pages

1. No GitHub, vá em **Settings** (Configurações) do repositório
2. Role até **Pages** (Páginas) no menu lateral
3. Em **Source** (Origem), selecione:
   - **Branch:** `main` (ou `master`)
   - **Folder:** `/docs`
4. Clique em **Save** (Salvar)

### Passo 4: Acessar seu site

Após alguns minutos, seu site estará disponível em:
- `https://SEU_USUARIO.github.io/sacramental-lds/`

### Deploy Automático

O repositório já está configurado com GitHub Actions para fazer deploy automático toda vez que você fizer push para a branch `main`.

### Atualizar o site

Sempre que você atualizar o `index.html`, copie para a pasta `docs`:

**Opção 1: Usar o script automático**

```bash
# Windows (PowerShell)
.\update-docs.ps1

# Linux/Mac
chmod +x update-docs.sh
./update-docs.sh
```

**Opção 2: Copiar manualmente**

```bash
# Windows (PowerShell)
Copy-Item -Path "index.html" -Destination "docs\index.html" -Force

# Linux/Mac
cp index.html docs/index.html
```

Depois faça commit e push:

```bash
git add .
git commit -m "Atualização do aplicativo"
git push
```

O GitHub Pages irá atualizar automaticamente em alguns minutos (geralmente 1-2 minutos após o push).

---

## 🌐 Deploy no Netlify (Alternativa)

Se preferir usar Netlify:

### Deploy via Netlify Drag & Drop

1. Acesse [app.netlify.com](https://app.netlify.com)
2. Faça login ou crie uma conta
3. Na página inicial, arraste e solte a pasta `docs` (não a raiz)
4. O Netlify irá fazer o deploy automaticamente
5. Você receberá uma URL do tipo: `seu-app.netlify.app`

## 📋 Requisitos

Nenhum! O aplicativo é totalmente estático e não requer:
- Node.js
- Build tools
- Servidor
- Configurações especiais

Todas as dependências (React, Firebase, Tailwind CSS, jsPDF) são carregadas via CDN.

## ✨ Funcionalidades

- 📅 **Agenda Sacramental**: Planeje domingo a domingo
- 👥 **Gerenciamento de Membros**: Cadastre membros e visitantes
- 📊 **Relatórios**: Visualize e baixe relatórios em PDF
- 💾 **Armazenamento em Nuvem**: Firebase Firestore para sincronização
- 📱 **PWA Ready**: Funciona offline e pode ser instalado como app

## 🔧 Configuração

O aplicativo já está configurado com Firebase. As credenciais estão no código.

Para alterar o Firebase:
1. Edite o objeto `firebaseConfig` no arquivo `index.html`
2. Atualize as credenciais do seu projeto Firebase

## 📱 Uso

Após o deploy:
1. Acesse a URL fornecida pelo Netlify
2. O aplicativo carregará automaticamente
3. Os dados são salvos no Firebase em tempo real

## 🎨 Características

- Design moderno com gradientes
- Interface responsiva (mobile e desktop)
- Animações suaves
- Download de relatórios em PDF
- Sincronização em tempo real

## 📄 Licença

Este projeto é de código aberto e está disponível para uso pela comunidade.

---

**Feito com ❤️ para facilitar o planejamento sacramental**
