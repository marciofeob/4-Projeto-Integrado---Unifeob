# 🧩 Projeto Integrado – UNIFEOB  
### Desenvolvimento de Software Corporativo  
### Sistema: **QuoteFlex**

---

## 👨‍💻 Equipe de Desenvolvimento

| Nome | RA |
|------|----|
| Calebe Matheus Moreira Moraes | 24000974 |
| Gustavo de Moraes Donadello | 24000419 |
| Márcio Augusto Garcia Soares | 24000138 |
| Lucas Vigo Calió | 24000092 |
| Mateus Oliveira Milane | 24000308 |
| Leandro José de Carvalho Coelho | 24001964 |

---

## 🎓 Professores Orientadores

| Disciplina | Professor |
|-------------|------------|
| **Sistemas Operacionais** | Ruy Roque Luz Filho |
| **Estrutura de Dados** | Marcelo Ciacco de Almeida |
| **Desenvolvimento de Software Corporativo** | Nivaldo de Andrade |
| **Segurança e Auditoria de Sistemas** | Max Streicher Vallim |
| **Coordenadora do Projeto Integrado** | Mariangela Martimbianco Santos |

---

## 🧠 Objetivo do Projeto

Desenvolver uma aplicação **corporativa multiplataforma** para gestão e controle de **cotações e apólices de seguros**, utilizando **Node.js**, **Electron**, **TypeScript**, **HTML**, **CSS** e **Bootstrap**, com banco de dados **MySQL**.

O sistema foi projetado para rodar em **qualquer sistema operacional (Windows, Linux e macOS)** através do uso do **Electron**.

---

## 🗃️ Banco de Dados – `quoteflex`

O banco de dados foi modelado no **MySQL Workbench** e exportado via script `.sql`.  
O esquema principal é `quoteflex`, contendo as principais tabelas de cadastro, relacionamento e operações do sistema (empresa, cliente, usuário, veículo, apólice, orçamentos etc).

📄 O script completo de criação do banco está em:

```

/database/quoteflex.sql

````

### Criando o banco localmente:

```sql
CREATE DATABASE quoteflex;
USE quoteflex;
SOURCE ./database/quoteflex.sql;
````

---

## ⚙️ Tecnologias Utilizadas

| Camada                     | Tecnologia             |
| -------------------------- | ---------------------- |
| **Banco de Dados**         | MySQL                  |
| **Backend**                | Node.js + TypeScript   |
| **Frontend**               | HTML5, CSS3, Bootstrap |
| **Desktop Runtime**        | Electron               |
| **IDE de Desenvolvimento** | Visual Studio Code     |
| **Controle de Versão**     | Git / GitHub           |

---

## 🧩 Estrutura do Projeto

```
📦 quoteflex
├── 📁 src
│   ├── main.ts           # Inicialização do Electron + Backend
│   ├── database.ts       # Conexão com MySQL
│   ├── routes/           # Rotas da API
│   ├── models/           # Modelos de dados (TypeScript)
│   ├── controllers/      # Lógica de negócio
│   └── views/            # HTML + CSS + Bootstrap
│
├── 📁 database
│   └── quoteflex.sql     # Script de criação do banco
│
├── 📄 package.json
├── 📄 tsconfig.json
└── 📄 README.md
```

---

## 🖥️ Configuração do Ambiente

### 1️⃣ Instalar o Node.js

Baixe e instale o Node.js (versão **LTS**) a partir de:
👉 [https://nodejs.org/](https://nodejs.org/)

Verifique a instalação:

```bash
node -v
npm -v
```

---

### 2️⃣ Clonar o Repositório

```bash
git clone https://github.com/seu-usuario/quoteflex.git
cd quoteflex
```

---

### 3️⃣ Instalar Dependências

```bash
npm install
```

---

### 4️⃣ Instalar o Electron

Instalar globalmente:

```bash
npm install -g electron
```

Ou como dependência local:

```bash
npm install electron --save-dev
```

---

### 5️⃣ Rodar o Projeto

Compilar o TypeScript e iniciar o Electron:

```bash
npm run build
npm start
```

Ou, se configurado no `package.json`:

```bash
npm run electron
```

---

## 🔑 Configuração do Banco de Dados

Edite o arquivo `src/database.ts` com as credenciais do seu MySQL local:

```typescript
import mysql from 'mysql2';

export const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'Admin123*',
  database: 'quoteflex'
});
```

---

## 🧪 Testes Locais

✅ Certifique-se de que o **MySQL** está em execução.
✅ O banco **quoteflex** deve estar criado conforme o script.
✅ Rode o **Electron** (`npm start`) e acesse a interface do sistema.

---

## 📊 Integração e Segurança

* 🔐 **Segurança:** Controle de acesso com níveis de permissão (`tp_acesso_usu`).
* 🧾 **Auditoria:** Log de operações implementado no backend Node.js.
* 🌐 **Integração futura:** APIs REST e conexão com dashboards no Power BI.

---

## 📦 Build Final (Multiplataforma)

Gerar executável do sistema:

```bash
npm run build
npx electron-builder
```

Isso gera binários para **Windows**, **Linux** ou **macOS**, conforme o sistema operacional utilizado no build.

---

## 🧾 Licença

Projeto acadêmico desenvolvido para o **Projeto Integrado – UNIFEOB**.
Uso autorizado apenas para fins **educacionais**.

---
