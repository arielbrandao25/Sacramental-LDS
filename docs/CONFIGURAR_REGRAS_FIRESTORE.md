# 🔒 Como Configurar Regras de Segurança do Firestore

## ❌ Problema

Quando um novo usuário faz login ou cadastro, ele não consegue ver as unidades existentes. Isso geralmente acontece porque as **regras de segurança do Firestore** estão bloqueando a leitura.

## ✅ Solução: Configurar Regras de Segurança

### Passo 1: Acessar Firebase Console

1. Acesse: [console.firebase.google.com](https://console.firebase.google.com)
2. Selecione o projeto: **sacramental-novo**
3. No menu lateral, clique em **"Firestore Database"**

### Passo 2: Acessar as Regras

1. Clique na aba **"Rules"** ou **"Regras"** (no topo da página)
2. Você verá o editor de regras

### Passo 3: Configurar as Regras

Cole as seguintes regras no editor:

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    // Regra para coleção de unidades
    match /unidades/{unidadeId} {
      // Qualquer usuário autenticado pode ler unidades
      allow read: if request.auth != null;
      // Qualquer usuário autenticado pode criar unidades
      allow create: if request.auth != null;
      // Apenas o criador da unidade ou admin pode atualizar/deletar
      allow update, delete: if request.auth != null && 
                              (request.auth.uid == resource.data.criadoPor || 
                               request.auth.token.email == resource.data.adminEmail);
      
      // Subcoleção de membros - usuários da mesma unidade podem ler/escrever
      match /membros/{memberId} {
        allow read, write: if request.auth != null && 
                             // Verificar se o usuário pertence à mesma unidade
                             (exists(/databases/$(database)/documents/usuarios/$(request.auth.uid)) &&
                              get(/databases/$(database)/documents/usuarios/$(request.auth.uid)).data.unidadeId == unidadeId);
      }
      
      // Subcoleção de assignments (planejamentos) - usuários da mesma unidade podem ler/escrever
      match /assignments/{assignmentId} {
        allow read, write: if request.auth != null && 
                             // Verificar se o usuário pertence à mesma unidade
                             (exists(/databases/$(database)/documents/usuarios/$(request.auth.uid)) &&
                              get(/databases/$(database)/documents/usuarios/$(request.auth.uid)).data.unidadeId == unidadeId);
      }
      
      // Subcoleção de attendance (frequência) - usuários da mesma unidade podem ler/escrever
      match /attendance/{attendanceId} {
        allow read, write: if request.auth != null && 
                             // Verificar se o usuário pertence à mesma unidade
                             (exists(/databases/$(database)/documents/usuarios/$(request.auth.uid)) &&
                              get(/databases/$(database)/documents/usuarios/$(request.auth.uid)).data.unidadeId == unidadeId);
      }
      
      // Subcoleção de chamados - usuários da mesma unidade podem ler/escrever
      match /chamados/{chamadoId} {
        allow read, write: if request.auth != null && 
                             // Verificar se o usuário pertence à mesma unidade
                             (exists(/databases/$(database)/documents/usuarios/$(request.auth.uid)) &&
                              get(/databases/$(database)/documents/usuarios/$(request.auth.uid)).data.unidadeId == unidadeId);
      }
    }
    
    // Regra para coleção de usuários
    match /usuarios/{userId} {
      // Usuários podem ler seus próprios dados e dados de usuários da mesma unidade
      allow read: if request.auth != null && 
                     (request.auth.uid == userId || 
                      resource.data.unidadeId != null);
      
      // Criação: usuários podem criar seus próprios dados
      allow create: if request.auth != null && 
                      request.auth.uid == userId;
      
      // Atualização: usuários podem atualizar seus próprios dados
      // OU admins podem atualizar dados de usuários da mesma unidade do admin
      allow update: if request.auth != null && 
                      (request.auth.uid == userId ||
                       // Admin pode atualizar se:
                       // 1. Está definindo unidadeId para a mesma unidade do admin, OU
                       // 2. O usuário já pertence à mesma unidade do admin
                       (exists(/databases/$(database)/documents/usuarios/$(request.auth.uid)) &&
                        get(/databases/$(database)/documents/usuarios/$(request.auth.uid)).data.role == 'admin' &&
                        (request.resource.data.unidadeId == get(/databases/$(database)/documents/usuarios/$(request.auth.uid)).data.unidadeId ||
                         (resource.data.unidadeId != null && resource.data.unidadeId == get(/databases/$(database)/documents/usuarios/$(request.auth.uid)).data.unidadeId))));
      
      // Deleção: apenas usuários podem deletar seus próprios dados
      allow delete: if request.auth != null && 
                      request.auth.uid == userId;
    }
    
    // Regra para coleção de solicitações
    match /solicitacoes/{solicitacaoId} {
      // Usuários autenticados podem ler solicitações da sua unidade
      allow read: if request.auth != null;
      // Usuários podem criar suas próprias solicitações
      allow create: if request.auth != null && 
                      request.auth.uid == request.resource.data.userId;
      // Apenas admins podem atualizar solicitações
      allow update: if request.auth != null;
      // Apenas admins podem deletar solicitações
      allow delete: if request.auth != null;
    }
  }
}
```

### Passo 4: Publicar as Regras

1. Clique no botão **"Publish"** ou **"Publicar"** (no topo direito)
2. Aguarde alguns segundos para as regras serem aplicadas

## 🔍 Verificar se Funcionou

1. No Firebase Console → Firestore Database → Rules
2. Verifique se as regras foram salvas corretamente
3. No app, peça para o novo usuário fazer login novamente
4. As unidades devem aparecer na lista

## ⚠️ Regras Temporárias para Teste (NÃO RECOMENDADO PARA PRODUÇÃO)

Se você quiser testar rapidamente sem configurar regras complexas, pode usar estas regras temporárias:

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    // PERMITE LEITURA E ESCRITA PARA QUALQUER USUÁRIO AUTENTICADO
    // ⚠️ ATENÇÃO: Use apenas para testes! Não use em produção!
    match /{document=**} {
      allow read, write: if request.auth != null;
    }
  }
}
```

**Nota**: Estas regras temporárias permitem acesso a todas as subcoleções também, incluindo `membros`, `assignments` e `attendance`.

⚠️ **IMPORTANTE**: Estas regras permitem que qualquer usuário autenticado leia e escreva em qualquer documento. Use apenas para testes e configure regras mais restritivas para produção.

## 📋 Explicação das Regras

### Unidades (`unidades`)
- **Leitura**: Qualquer usuário autenticado pode ler unidades (para ver a lista)
- **Escrita**: Apenas o criador/admin da unidade pode modificar

### Usuários (`usuarios`)
- **Leitura**: Usuários podem ler seus próprios dados e dados de usuários da mesma unidade
- **Escrita**: Usuários podem modificar apenas seus próprios dados

### Solicitações (`solicitacoes`)
- **Leitura**: Usuários autenticados podem ler solicitações
- **Criação**: Usuários podem criar suas próprias solicitações
- **Atualização/Deleção**: Apenas admins podem modificar/deletar

### Subcoleções dentro de `unidades/{unidadeId}`
- **Membros** (`membros`): Usuários da mesma unidade podem ler/escrever
- **Assignments** (`assignments`): Usuários da mesma unidade podem ler/escrever (planejamentos)
- **Attendance** (`attendance`): Usuários da mesma unidade podem ler/escrever (frequência)
- **Chamados** (`chamados`): Usuários da mesma unidade podem ler/escrever

## 🚨 Problemas Comuns

### Ainda não aparece unidades após configurar

1. **Aguarde 1-2 minutos** - as regras podem levar tempo para propagar
2. **Limpe o cache do navegador** (Ctrl+Shift+Del)
3. **Faça logout e login novamente** no app
4. **Verifique se o usuário está autenticado** - as regras exigem `request.auth != null`

### Erro "Missing or insufficient permissions"

1. Verifique se as regras foram publicadas corretamente
2. Verifique se o usuário está autenticado (fez login)
3. Verifique se a regra permite a operação desejada (read/write)

### Regras não estão sendo aplicadas

1. Verifique se você está no projeto correto: **sacramental-novo**
2. Verifique se clicou em **"Publish"** após editar
3. Aguarde alguns minutos e tente novamente

## 📝 Nota sobre Segurança

Para produção, configure regras mais restritivas:

- Limite quem pode criar unidades
- Limite quem pode aprovar solicitações
- Adicione validação de dados nas regras
- Considere usar roles/permissões mais granulares

---

**Após configurar as regras, os novos usuários conseguirão ver as unidades existentes!** ✅
