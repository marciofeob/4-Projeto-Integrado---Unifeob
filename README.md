
# 🧩 Projeto Integrado – UNIFEOB  
### Desenvolvimento de Software Corporativo  
### Sistema: **QuoteFlex**

---
![Uploading image.png…]()
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
├── 📁 database/ # Banco de dados
├── 📁 node_modules/ # Dependências do Node.js
├── 📁 renderer/ # Frontend
│ ├── public/ # Arquivos estáticos
│ │ ├── css/ # CSS customizado
│ │ ├── img/ # Imagens
│ │ └── js/ # Scripts JS do frontend
│ └── views/ # Templates EJS
│ └── partials/ # Partials (header, footer, etc)
├── 📁 server/ # Backend Node.js
│ ├── middleware/ # Middlewares
│ ├── routers/ # Rotas da API
│ ├── app.js # Inicialização do servidor
│ └── db.js # Conexão com o MySQL
├── main.js # Arquivo principal
├── .gitignore
├── package-lock.json
├── package.json
└── README.md
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
git clone https://github.com/marciofeob/4-Projeto-Integrado---Unifeob.git
cd 4-Projeto-Integrado---Unifeob
```

---

### 3️⃣ Instalar Dependências

```bash
npm install
```

---

### 4️⃣ Configuração do Bootstrap Offline

1. Baixe o Bootstrap na versão desejada: [https://getbootstrap.com](https://getbootstrap.com)
2. Coloque os arquivos em:

```
renderer/public/bootstrap/
```

3. Referencie nos arquivos HTML:

```html
<link rel="stylesheet" href="public/bootstrap/css/bootstrap.min.css">
<script src="public/bootstrap/js/bootstrap.bundle.min.js"></script>
```

---

### 5️⃣ Configuração do Banco de Dados (`server/db.js`)

```javascript
const mysql = require('mysql2');

const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'Admin123*',
  database: 'quoteflex'
});

module.exports = connection;
```

---

## 🧪 Testes Locais

✅ Certifique-se que o MySQL está rodando.
✅ O banco `quoteflex` deve estar criado.
✅ Rode o comando `npm run dev` para iniciar **Electron + backend + watch TypeScript**.

---

## 📊 Integração e Segurança

* 🔐 Controle de acesso por níveis (`tp_acesso_usu`).
* 🧾 Log de auditoria no backend.
* 🌐 Preparado para integração com **APIs REST** e dashboards Power BI.

---

## 📦 Build Final (Multiplataforma)

Gerar executáveis:

```bash
npm run build
npm run package
```

Arquivos finais estarão na pasta `dist/`.

---

## 📝 Boas práticas adotadas

* Estrutura modular: **server**, **renderer**, **main.ts**, **preload.js**
* **Partials** para evitar repetição de HTML
* Bootstrap offline para independência de CDN
* Scripts automatizados (`dev`, `start`, `build`, `package`)
* TypeScript + Node.js + Electron integrados
* `.gitignore` configurado para arquivos de sistema e `node_modules`

---

## 🧾 Licença

Projeto acadêmico desenvolvido para o **Projeto Integrado – UNIFEOB**.
Uso autorizado apenas para fins **educacionais**.

---
