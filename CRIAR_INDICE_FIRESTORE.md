# 📊 Como Criar Índice no Firestore

## ❌ Erro Atual

Você está vendo o erro:
```
The query requires an index. You can create it here: https://console.firebase.google.com/...
```

Isso significa que o Firestore precisa de um índice composto para fazer uma query que combina filtros (`where`) com ordenação (`orderBy`).

## ✅ Solução Rápida (Método 1 - Link Direto)

1. **Clique no link** que aparece no erro do console do navegador
2. O link abrirá automaticamente a página de criação de índice no Firebase Console
3. Clique em **"Create Index"** ou **"Criar Índice"**
4. Aguarde alguns minutos enquanto o índice é criado
5. O índice ficará pronto quando o status mudar de "Building" para "Enabled"

## ✅ Solução Manual (Método 2)

Se o link não funcionar, siga estes passos:

### Passo 1: Acessar Firebase Console

1. Acesse: [console.firebase.google.com](https://console.firebase.google.com)
2. Selecione o projeto: **sacramental-novo**
3. No menu lateral, clique em **"Firestore Database"**

### Passo 2: Criar o Índice

1. Clique na aba **"Indexes"** ou **"Índices"** (no topo da página)
2. Clique no botão **"Create Index"** ou **"Criar Índice"**

### Passo 3: Configurar o Índice

Preencha os campos:

- **Collection ID**: `usuarios`
- **Fields to index** (Campos para indexar):
  1. Campo: `unidadeId`
     - Tipo: **Ascending** (Crescente)
  2. Campo: `criadoEm`
     - Tipo: **Descending** (Decrescente)

- **Query scope**: Deixe como **Collection** (padrão)

### Passo 4: Criar o Índice

1. Clique em **"Create"** ou **"Criar"**
2. Aguarde alguns minutos enquanto o índice é criado
3. O status mudará de **"Building"** para **"Enabled"** quando estiver pronto

## 📋 Índices Necessários

O app precisa dos seguintes índices:

### 1. Índice para Usuários da Unidade
- **Coleção**: `usuarios`
- **Campos**:
  - `unidadeId` (Ascending)
  - `criadoEm` (Descending)

### 2. Índice para Solicitações Pendentes (se necessário)
- **Coleção**: `solicitacoes`
- **Campos**:
  - `unidadeId` (Ascending)
  - `status` (Ascending)
  - `criadoEm` (Descending)

## ⚠️ Importante

- **Aguarde 2-5 minutos** após criar o índice para ele ficar pronto
- O app continuará funcionando usando localStorage enquanto o índice é criado
- Após o índice ser criado, o app começará a usar o Firestore automaticamente

## 🔍 Verificar se Funcionou

1. No Firebase Console → Firestore Database → Indexes
2. Verifique se o índice aparece com status **"Enabled"** (Ativado)
3. No app, o erro deve desaparecer
4. O app deve carregar os usuários da unidade corretamente

## 🚀 Dica

Se você clicar no link do erro no console do navegador, o Firebase Console abrirá automaticamente com os campos já preenchidos corretamente. É o método mais rápido!

---

**Após criar o índice, o erro desaparecerá e o app funcionará perfeitamente!** ✅
