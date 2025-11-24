
---

# Projeto Integrado – UNIFEOB

### Desenvolvimento de Software Corporativo

### Sistema: **QuoteFlex**

---

## Equipe de Desenvolvimento

| Nome                            | RA       |
| ------------------------------- | -------- |
| Calebe Matheus Moreira Moraes   | 24000974 |
| Gustavo de Moraes Donadello     | 24000419 |
| Márcio Augusto Garcia Soares    | 24000138 |
| Lucas Vigo Calió                | 24000092 |
| Mateus Oliveira Milane          | 24000308 |
| Leandro José de Carvalho Coelho | 24001964 |

---

## Professores Orientadores

| Disciplina                                  | Professor                      |
| ------------------------------------------- | ------------------------------ |
| **Sistemas Operacionais**                   | Ruy Roque Luz Filho            |
| **Estrutura de Dados**                      | Marcelo Ciacco de Almeida      |
| **Desenvolvimento de Software Corporativo** | Nivaldo de Andrade             |
| **Segurança e Auditoria de Sistemas**       | Max Streicher Vallim           |
| **Coordenadora do Projeto Integrado**       | Mariangela Martimbianco Santos |

---

## 🧠 Objetivo do Projeto

Desenvolver uma aplicação **corporativa multiplataforma** para gestão e controle de **cotações e apólices de seguros**, utilizando:

* **Node.js**
* **Express**
* **Electron**
* **JavaScript**
* **HTML / CSS**
* **Bootstrap**
* **MySQL**

O sistema foi projetado para rodar em **Windows**, utilizando o **Electron** para empacotamento e execução desktop.

---

## Banco de Dados – `quoteflex`

O banco foi modelado no **MySQL Workbench** e exportado como script `.sql`.
O esquema principal se chama **quoteflex**, contendo tabelas de cadastros, relacionamentos e operações gerais.

---

### 1. Criando o Banco e as Tabelas

Execute o script principal no MySQL (Workbench, DBeaver ou CLI):

```sql
CREATE DATABASE quoteflex;
USE quoteflex;
SOURCE ./database/quoteflex.sql;
```

---

### 2. Criando o Usuário Admin

Após criar as tabelas, execute o script a seguir para gerar o usuário administrador:

```sql
USE quoteflex;

-- Cria níveis de acesso e função
INSERT INTO tp_acesso_usu (descr, cd, sit)
SELECT 'admin', 1, 1
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM tp_acesso_usu WHERE descr = 'admin');

INSERT INTO funcao_usu (descr, cd)
SELECT 'Administrador', 'ADM'
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM funcao_usu WHERE cd = 'ADM');

-- Cria usuário Admin (Senha: 123 | MD5)
INSERT INTO usuario (nome, cd_usu_bd, senha, sit, tpacessusu_id, funcaousu_id)
SELECT 'Super Administrador', 'admin', '202cb962ac59075b964b07152d234b70', 1,
       (SELECT tpacessusu_id FROM tp_acesso_usu WHERE descr = 'admin' LIMIT 1),
       (SELECT funcaousu_id FROM funcao_usu WHERE cd = 'ADM' LIMIT 1)
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM usuario WHERE cd_usu_bd = 'admin');
```

### Login Padrão

| Campo        | Valor   |
| ------------ | ------- |
| **Usuário:** | `admin` |
| **Senha:**   | `123`   |

---

## Tecnologias Utilizadas

| Camada                 | Tecnologia         |
| ---------------------- | ------------------ |
| **Banco de Dados**     | MySQL              |
| **Backend**            | Node.js + Express  |
| **Frontend**           | HTML5, CSS3, EJS   |
| **Desktop Runtime**    | Electron           |
| **IDE**                | Visual Studio Code |
| **Controle de Versão** | Git / GitHub       |

---

## Estrutura do Projeto

```
 quoteflex
├── 📁 database/           # Scripts SQL e Modelagem
├── 📁 node_modules/       # Dependências do Node.js
├── 📁 renderer/           # Frontend (Interface)
│   ├── public/            # Arquivos estáticos (CSS, Imagens, JS)
│   └── views/             # Templates EJS
├── 📁 server/             # Backend Node.js
│   ├── .env               # Arquivo de Configuração (CRIAR MANUALMENTE)
│   ├── db.js              # Conexão com o Banco
│   ├── app.js             # Servidor Express
│   └── routers/           # Rotas da API
├── main.js                # Processo Principal do Electron
├── package.json           # Dependências e Scripts
└── README.md
```

---

## Instalação e Configuração

### Pré-requisitos

* Node.js (versão LTS) → [https://nodejs.org/](https://nodejs.org/)
* MySQL Server instalado e ativo

---

### Clonar o Repositório e Instalar Dependências

```bash
git clone https://github.com/marciofeob/4-Projeto-Integrado---Unifeob.git
cd 4-Projeto-Integrado---Unifeob
npm install
```

---

### Configurando o Arquivo `.env`

O sistema exige um arquivo de ambiente dentro da pasta `server/`.

1. Acesse a pasta:

   ```
   cd server
   ```
2. Crie um arquivo chamado `.env`.
3. Preencha com as credenciais do seu MySQL:

```env
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=sua_senha_do_mysql
DB_DATABASE=quoteflex
```

---

## Como Rodar o Projeto

Na raiz do projeto, execute:

```bash
npm start
```

Isso iniciará **simultaneamente** o servidor Node.js e o Electron.

---

## Gerando o Executável (Windows .exe)

Para gerar o instalador final:

1. Abra o terminal como **Administrador**.
2. Execute:

```bash
npm run dist
```

O instalador será criado em:

`dist/GestaoUsuario Setup 1.0.0.exe`

---

## Licença

Projeto acadêmico desenvolvido para o **Projeto Integrado – UNIFEOB**.
Uso autorizado exclusivamente para fins **educacionais**.

---
