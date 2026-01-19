# 🔑 Como Corrigir a Chave de API do Firebase

## ❌ Erro Atual

Você está vendo o erro:
```
Firebase: Error (auth/api-key-not-valid.-please-pass-a-valid-api-key.)
```

Isso significa que a chave de API no código não é válida ou está desatualizada.

## ✅ Solução Passo a Passo

### Passo 1: Acessar Firebase Console

1. Acesse: [console.firebase.google.com](https://console.firebase.google.com)
2. Faça login com sua conta Google
3. Selecione o projeto: **sacramental-novo**

### Passo 2: Obter a Configuração do Firebase

1. No Firebase Console, clique no ícone de **⚙️ (Settings)** no canto superior esquerdo
2. Clique em **"Project settings"** (Configurações do projeto)
3. Role a página até encontrar a seção **"Your apps"** (Seus aplicativos)
4. Se você já tem um app web registrado, clique nele
5. Se não tem, clique em **"Add app"** → **"Web"** (ícone `</>`)
   - Dê um nome ao app (ex: "Sacramental Web")
   - Clique em **"Register app"**

### Passo 3: Copiar a Configuração

Na seção **"SDK setup and configuration"**, você verá algo assim:

```javascript
const firebaseConfig = {
  apiKey: "AIzaSyXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
  authDomain: "sacramental-novo.firebaseapp.com",
  projectId: "sacramental-novo",
  storageBucket: "sacramental-novo.firebasestorage.app",
  messagingSenderId: "911518938542",
  appId: "1:911518938542:web:7684cc7a26f28ab146843f"
};
```

### Passo 4: Atualizar o Código

1. Abra o arquivo `index.html` no seu editor
2. Encontre a linha que contém `const firebaseConfig = {` (por volta da linha 146)
3. Substitua **APENAS** a chave `apiKey` pela chave correta que você copiou do Firebase Console
4. **NÃO altere** as outras propriedades (authDomain, projectId, etc.)

### Passo 5: Verificar Restrições da API Key

1. No Firebase Console, vá em **⚙️ Settings** → **Project settings**
2. Role até **"Your apps"** e clique no app web
3. Clique em **"View API key restrictions"** ou acesse diretamente:
   - [Google Cloud Console - API Keys](https://console.cloud.google.com/apis/credentials?project=sacramental-novo)
4. Encontre a chave de API que começa com `AIzaSy...`
5. Clique nela para editar
6. Verifique se as **"Application restrictions"** estão configuradas:
   - Se estiver como **"None"**, está OK
   - Se estiver restrita, certifique-se de que `arielbrandao25.github.io` está na lista de domínios permitidos
7. Verifique se as **"API restrictions"** incluem:
   - ✅ **Identity Toolkit API** (obrigatório para autenticação)
   - ✅ **Firebase Installations API** (obrigatório)
   - Ou selecione **"Don't restrict key"** para testes

### Passo 6: Salvar e Testar

1. Salve o arquivo `index.html`
2. Faça commit e push das alterações:
   ```powershell
   git add index.html
   git commit -m "Corrigir chave de API do Firebase"
   git push
   ```
3. Aguarde alguns minutos para o GitHub Pages atualizar
4. Acesse: `https://arielbrandao25.github.io/Sacramental-LDS/`
5. Limpe o cache do navegador (Ctrl+Shift+R)
6. Tente fazer login novamente

## 🔍 Verificar se a Chave Está Correta

A chave de API do Firebase deve:
- Começar com `AIzaSy`
- Ter aproximadamente 39 caracteres
- Estar ativa no Firebase Console
- Não ter restrições que bloqueiem o domínio do GitHub Pages

## ⚠️ Problemas Comuns

### Ainda aparece o erro após atualizar

1. **Aguarde 2-5 minutos** - pode levar tempo para propagar
2. **Limpe o cache do navegador** completamente (Ctrl+Shift+Del)
3. **Verifique se fez push** das alterações para o GitHub
4. **Verifique se o GitHub Pages atualizou** - pode levar alguns minutos

### Erro "API key not valid" persiste

1. Verifique se copiou a chave **completa** (sem espaços ou quebras de linha)
2. Verifique se não há caracteres extras ou faltando
3. No Google Cloud Console, verifique se a chave não foi **desabilitada**
4. Crie uma nova chave de API se necessário:
   - Google Cloud Console → APIs & Services → Credentials
   - Clique em "Create Credentials" → "API Key"
   - Copie a nova chave e atualize no código

### Não consigo encontrar a chave no Firebase Console

1. Certifique-se de estar no projeto correto: **sacramental-novo**
2. Se não houver app web registrado, crie um novo (Passo 2)
3. A configuração aparece logo após criar o app web

## 📝 Nota Importante

⚠️ **NUNCA compartilhe sua chave de API publicamente em repositórios privados ou públicos sem restrições adequadas!**

Para produção, configure restrições de domínio no Google Cloud Console para proteger sua chave.

---

**Após seguir estes passos, o erro deve desaparecer e o login deve funcionar!** ✅
