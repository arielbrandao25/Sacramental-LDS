# 🔧 Configurar Google OAuth para GitHub Pages

## ❌ Erro Atual

Você está vendo o erro:
```
Erro 400: redirect_uri_mismatch
```

Isso acontece porque o domínio do GitHub Pages (`arielbrandao25.github.io`) não está autorizado no Google Cloud Console.

## ✅ Solução Passo a Passo

### Passo 1: Acessar Google Cloud Console

1. Acesse: [console.cloud.google.com](https://console.cloud.google.com)
2. Selecione o projeto: **sacramental-novo**

### Passo 2: Configurar OAuth 2.0 Client ID

1. No menu lateral, vá em: **APIs & Services** → **Credentials**
2. Encontre o **OAuth 2.0 Client ID** que você está usando
3. Clique no nome do Client ID para editar

### Passo 3: Adicionar Authorized JavaScript Origins

Na seção **"Authorized JavaScript origins"**, adicione:

```
https://arielbrandao25.github.io
http://arielbrandao25.github.io
```

⚠️ **IMPORTANTE:** 
- Adicione **ambos** `https://` e `http://`
- Não adicione barra no final (`/`)
- Adicione exatamente como mostrado acima

### Passo 4: Adicionar Authorized Redirect URIs

Na seção **"Authorized redirect URIs"**, adicione:

```
https://arielbrandao25.github.io
http://arielbrandao25.github.io
https://arielbrandao25.github.io/Sacramental-LDS
http://arielbrandao25.github.io/Sacramental-LDS
```

⚠️ **IMPORTANTE:**
- Se seu repositório tem um nome diferente de `Sacramental-LDS`, ajuste o caminho
- Adicione com e sem o caminho do repositório
- Adicione tanto `https://` quanto `http://`

### Passo 5: Salvar

1. Clique em **"Save"** (Salvar) no final da página
2. Aguarde alguns segundos para as alterações serem aplicadas

### Passo 6: Configurar Firebase Authorized Domains

1. Acesse: [console.firebase.google.com](https://console.firebase.google.com)
2. Selecione o projeto: **sacramental-novo**
3. Vá em: **Authentication** → **Settings**
4. Clique em **"Authorized domains"**
5. Clique em **"Add domain"**
6. Adicione: `arielbrandao25.github.io`
7. Clique em **"Add"**

### Passo 7: Testar

1. Volte para seu site: `https://arielbrandao25.github.io/Sacramental-LDS/`
2. Tente fazer login com Google novamente
3. O erro deve desaparecer!

## 📋 Checklist Completo

- [ ] Adicionado `https://arielbrandao25.github.io` em Authorized JavaScript origins
- [ ] Adicionado `http://arielbrandao25.github.io` em Authorized JavaScript origins
- [ ] Adicionado `https://arielbrandao25.github.io` em Authorized redirect URIs
- [ ] Adicionado `http://arielbrandao25.github.io` em Authorized redirect URIs
- [ ] Adicionado `https://arielbrandao25.github.io/Sacramental-LDS` em Authorized redirect URIs
- [ ] Adicionado `http://arielbrandao25.github.io/Sacramental-LDS` em Authorized redirect URIs
- [ ] Adicionado `arielbrandao25.github.io` em Firebase Authorized domains
- [ ] Salvo todas as alterações
- [ ] Testado o login novamente

## 🔍 Verificar se Funcionou

Após configurar, você pode verificar se está correto:

1. No Google Cloud Console, veja a lista de **Authorized JavaScript origins**
2. Deve incluir:
   - `https://arielbrandao25.github.io`
   - `http://arielbrandao25.github.io`
   - (e outros domínios que você já tinha)

3. No Firebase Console, veja a lista de **Authorized domains**
4. Deve incluir:
   - `arielbrandao25.github.io`
   - (e outros domínios que você já tinha)

## ⚠️ Problemas Comuns

### Ainda aparece o erro após configurar

- Aguarde 2-5 minutos (pode levar um tempo para propagar)
- Limpe o cache do navegador (Ctrl+Shift+R ou Cmd+Shift+R)
- Verifique se digitou exatamente como mostrado (sem barras no final)
- Verifique se salvou as alterações

### Erro persiste

- Verifique se o nome do repositório está correto no caminho
- Se seu repositório se chama diferente de `Sacramental-LDS`, ajuste os caminhos
- Verifique se está usando o Client ID correto no código

## 📝 Nota sobre HTTPS

O GitHub Pages usa HTTPS por padrão. Se você quiser forçar HTTPS:

1. No Google Cloud Console, você pode remover as entradas `http://` e manter apenas `https://`
2. Mas é mais seguro manter ambos durante a transição

---

**Após seguir estes passos, o login com Google deve funcionar perfeitamente!** ✅
