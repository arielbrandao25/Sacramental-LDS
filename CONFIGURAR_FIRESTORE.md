# 🔥 Como Configurar o Firestore no Firebase

## ❌ Erro Atual

Você está vendo o erro:
```
The database (default) does not exist for project sacramental-novo
```

Isso significa que o banco de dados Firestore ainda não foi criado no seu projeto Firebase.

## ✅ Solução Passo a Passo

### Passo 1: Acessar Firebase Console

1. Acesse: [console.firebase.google.com](https://console.firebase.google.com)
2. Faça login com sua conta Google
3. Selecione o projeto: **sacramental-novo**

### Passo 2: Criar o Banco de Dados Firestore

1. No menu lateral esquerdo, clique em **"Firestore Database"** (ou **"Firestore"**)
2. Se você ver uma mensagem dizendo "Get started" ou "Criar banco de dados", clique nela
3. Se não aparecer, clique no botão **"Create database"** ou **"Criar banco de dados"**

### Passo 3: Escolher o Modo de Segurança

Você verá duas opções:

#### Opção 1: Modo de Teste (Recomendado para começar)
- Selecione **"Start in test mode"** ou **"Iniciar no modo de teste"**
- ⚠️ **IMPORTANTE**: Este modo permite leitura/escrita por 30 dias. Depois disso, você precisará configurar regras de segurança.
- Clique em **"Next"** ou **"Próximo"**

#### Opção 2: Modo de Produção (Mais seguro)
- Selecione **"Start in production mode"** ou **"Iniciar no modo de produção"**
- Você precisará configurar regras de segurança imediatamente
- Clique em **"Next"** ou **"Próximo"**

### Passo 4: Escolher a Localização

1. Selecione uma localização para o banco de dados
   - **Recomendado**: Escolha a localização mais próxima dos seus usuários
   - Para Brasil: `southamerica-east1` (São Paulo) ou `us-central1` (EUA)
2. Clique em **"Enable"** ou **"Ativar"**
3. Aguarde alguns minutos enquanto o Firestore é criado

### Passo 5: Verificar se Foi Criado

1. Após alguns minutos, você deve ver a interface do Firestore
2. Você verá uma mensagem dizendo "Cloud Firestore is ready" ou "Firestore está pronto"
3. A interface mostrará uma lista vazia de coleções (isso é normal)

### Passo 6: Configurar Regras de Segurança (Opcional, mas Recomendado)

Se você escolheu o modo de teste, configure as regras após 30 dias:

1. No Firestore, clique na aba **"Rules"** ou **"Regras"**
2. Cole as seguintes regras básicas:

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    // Permitir leitura/escrita apenas para usuários autenticados
    match /{document=**} {
      allow read, write: if request.auth != null;
    }
  }
}
```

3. Clique em **"Publish"** ou **"Publicar"**

### Passo 7: Criar as Coleções Necessárias

O app criará automaticamente as coleções quando necessário, mas você pode criar manualmente se preferir:

1. Clique em **"Start collection"** ou **"Iniciar coleção"**
2. Crie as seguintes coleções (opcional - o app criará automaticamente):
   - `unidades` - Para armazenar informações das unidades
   - `usuarios` - Para armazenar informações dos usuários
   - `solicitacoes` - Para armazenar solicitações pendentes

### Passo 8: Testar o App

1. Volte para o app: `https://arielbrandao25.github.io/Sacramental-LDS/`
2. Limpe o cache do navegador (Ctrl+Shift+R ou Cmd+Shift+R)
3. Faça login novamente
4. O erro deve desaparecer!

## 📋 Checklist Completo

- [ ] Acessei o Firebase Console
- [ ] Selecionei o projeto `sacramental-novo`
- [ ] Criei o banco de dados Firestore
- [ ] Escolhi o modo de segurança (teste ou produção)
- [ ] Selecionei a localização do banco de dados
- [ ] Aguardei a criação do banco de dados
- [ ] Verifiquei que o Firestore está ativo
- [ ] (Opcional) Configurei as regras de segurança
- [ ] Testei o app novamente

## ⚠️ Problemas Comuns

### Ainda aparece o erro após criar o Firestore

1. **Aguarde 2-5 minutos** - pode levar tempo para propagar
2. **Limpe o cache do navegador** completamente (Ctrl+Shift+Del)
3. **Verifique se o Firestore está realmente criado**:
   - No Firebase Console, vá em Firestore Database
   - Você deve ver a interface do Firestore (não a tela de criação)
4. **Verifique se está no projeto correto**: `sacramental-novo`

### Não consigo criar o banco de dados

1. Verifique se você tem permissões de administrador no projeto
2. Verifique se o projeto não está em modo de cobrança (alguns recursos podem estar bloqueados)
3. Tente criar em outro navegador ou modo anônimo

### Erro de permissão ao acessar dados

1. Configure as regras de segurança (Passo 6)
2. Verifique se o usuário está autenticado
3. Verifique se as regras permitem leitura/escrita para usuários autenticados

## 🔍 Verificar se Funcionou

Após configurar, você pode verificar:

1. No Firebase Console → Firestore Database
2. Você deve ver a interface do Firestore (não a tela de criação)
3. No app, o erro deve desaparecer
4. O app deve funcionar normalmente, salvando dados no Firestore

## 📝 Nota Importante

⚠️ **O Firestore é um banco de dados NoSQL em tempo real**. Ele é diferente do Realtime Database do Firebase.

- **Firestore**: Banco de dados de documentos (coleções e documentos)
- **Realtime Database**: Banco de dados JSON em tempo real

O app usa **Firestore**, não Realtime Database.

---

**Após seguir estes passos, o Firestore estará configurado e o erro deve desaparecer!** ✅
