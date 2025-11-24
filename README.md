
````markdown
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

Desenvolver uma aplicação **corporativa multiplataforma** para gestão e controle de **cotações e apólices de seguros**, utilizando **Node.js**, **Electron**, **JavaScript**, **HTML**, **CSS** e **Bootstrap**, com banco de dados **MySQL**.

O sistema foi projetado para rodar em **Windows** através do uso do **Electron**.

---

## 🗃️ Banco de Dados – `quoteflex`

O banco de dados foi modelado no **MySQL Workbench** e exportado via script `.sql`.  
O esquema principal é `quoteflex`, contendo as principais tabelas de cadastro, relacionamento e operações do sistema.

### 1. Criando o Banco e Tabelas
Execute o script principal no seu cliente MySQL (Workbench/DBeaver):

```sql
CREATE DATABASE quoteflex;
USE quoteflex;
SOURCE ./database/quoteflex.sql;
````

### 2\. Criando o Usuário Admin

Para acessar o sistema, é necessário criar o usuário administrador e as permissões. Execute o script abaixo após criar as tabelas:

```sql
USE quoteflex;

-- Cria níveis de acesso e função
INSERT INTO tp_acesso_usu (descr, cd, sit) SELECT 'admin', 1, 1 FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM tp_acesso_usu WHERE descr = 'admin');
INSERT INTO funcao_usu (descr, cd) SELECT 'Administrador', 'ADM' FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM funcao_usu WHERE cd = 'ADM');

-- Cria usuário Admin (Senha: 123)
INSERT INTO usuario (nome, cd_usu_bd, senha, sit, tpacessusu_id, funcaousu_id)
SELECT 'Super Administrador', 'admin', '202cb962ac59075b964b07152d234b70', 1, 
(SELECT tpacessusu_id FROM tp_acesso_usu WHERE descr = 'admin' LIMIT 1),
(SELECT funcaousu_id FROM funcao_usu WHERE cd = 'ADM' LIMIT 1)
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM usuario WHERE cd_usu_bd = 'admin');
```

🔑 **Login Padrão:**

  * **Usuário:** `admin`
  * **Senha:** `123`

-----

## ⚙️ Tecnologias Utilizadas

| Camada                     | Tecnologia             |
| -------------------------- | ---------------------- |
| **Banco de Dados** | MySQL                  |
| **Backend** | Node.js + Express      |
| **Frontend** | HTML5, CSS3, EJS       |
| **Desktop Runtime** | Electron               |
| **IDE de Desenvolvimento** | Visual Studio Code     |
| **Controle de Versão** | Git / GitHub           |

-----

## 🧩 Estrutura do Projeto

```
📦 quoteflex
├── 📁 database/           # Scripts SQL e Modelagem
├── 📁 node_modules/       # Dependências do Node.js
├── 📁 renderer/           # Frontend (Interface)
│   ├── public/            # Arquivos estáticos (CSS, Imagens, JS)
│   └── views/             # Templates EJS (HTML dinâmico)
├── 📁 server/             # Backend Node.js
│   ├── .env               # Arquivo de Configuração (CRIAR MANUALMENTE)
│   ├── db.js              # Conexão com o Banco
│   ├── app.js             # Servidor Express
│   └── routers/           # Rotas da API
├── main.js                # Processo Principal do Electron
├── package.json           # Dependências e Scripts
└── README.md
```

-----

## 🖥️ Instalação e Configuração

### 1️⃣ Pré-requisitos

  * Node.js (Versão LTS) instalado: [https://nodejs.org/](https://nodejs.org/)
  * MySQL Server rodando.

### 2️⃣ Clonar e Instalar

Abra o terminal na pasta onde deseja baixar o projeto:

```bash
git clone [https://github.com/marciofeob/4-Projeto-Integrado---Unifeob.git](https://github.com/marciofeob/4-Projeto-Integrado---Unifeob.git)
cd 4-Projeto-Integrado---Unifeob
npm install
```

### 3️⃣ Configurando as Variáveis de Ambiente (.env)

O sistema exige um arquivo de configuração para conectar ao banco.

1.  Navegue até a pasta `server/`.
2.  Crie um arquivo chamado `.env` (sem nome antes do ponto).
3.  Preencha com os dados do **seu** MySQL local:

<!-- end list -->

```env
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=sua_senha_do_mysql
DB_DATABASE=quoteflex
```

-----

## 🚀 Como Rodar o Projeto

Após configurar o banco e o arquivo `.env`, execute o comando abaixo na raiz do projeto:

```bash
npm start
```

*Isso iniciará o Electron e o servidor backend simultaneamente.*

-----

## 📦 Gerando o Executável (Windows .exe)

Para criar o instalador final do software:

1.  Abra o terminal como **Administrador** (PowerShell ou CMD).
2.  Execute o comando:

<!-- end list -->

```bash
npm run dist
```

O instalador será gerado na pasta:
📂 `dist/GestaoUsuario Setup 1.0.0.exe`

-----

## 📝 Licença

Projeto acadêmico desenvolvido para o **Projeto Integrado – UNIFEOB**.
Uso autorizado apenas para fins **educacionais**.

```
```