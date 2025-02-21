# 🎬 Banco de Dados - Cinema

Este projeto foi desenvolvido como parte de uma atividade em sala de aula, em parceria com um colega, com o objetivo de modelar e implementar um banco de dados para a gestão de um sistema de cinema.

O banco de dados permite o gerenciamento de **clientes, filmes, catálogo de exibição, reservas, pedidos e formas de pagamento**, sendo estruturado para garantir a organização e a integridade dos dados.

---

## 🛠 **Tecnologias Utilizadas**
- **MySQL** (Gerenciamento do Banco de Dados)
- **XAMPP** (Ambiente de Desenvolvimento)

---

## 🎯 **Objetivo do Projeto**
O objetivo deste projeto foi **desenvolver um banco de dados funcional** para um sistema de cinema, permitindo:
- O **cadastro de clientes** e seus pedidos.
- O **gerenciamento de filmes** disponíveis no cinema.
- O controle de **reservas e assentos**.
- A administração das **formas de pagamento** aceitas.
- A organização dos filmes através de um **catálogo**.

---

## 🏗 **Estrutura do Banco de Dados**
O banco de dados é composto pelas seguintes tabelas:

### 1️⃣ **clientes**
Armazena as informações dos clientes.

| Campo         | Tipo         | Descrição |
|--------------|-------------|-----------|
| `id_clientes` | INT (PK, AI) | Identificador único do cliente |
| `nome`        | VARCHAR(45) | Nome do cliente |

---

### 2️⃣ **filme**
Armazena os filmes disponíveis no cinema.

| Campo              | Tipo         | Descrição |
|-------------------|-------------|-----------|
| `id_filme`        | INT (PK, AI) | Identificador único do filme |
| `titulo`          | VARCHAR(45)  | Nome do filme |
| `genero`          | VARCHAR(45)  | Gênero do filme |
| `class_indicativa` | VARCHAR(45)  | Classificação indicativa |

---

### 3️⃣ **catalogo**
Lista os filmes disponíveis no catálogo do cinema.

| Campo           | Tipo         | Descrição |
|---------------|-------------|-----------|
| `id_catalogo`  | INT (PK, AI) | Identificador único do catálogo |
| `filme_id_filme` | INT (FK)   | Chave estrangeira para um filme disponível |

---

### 4️⃣ **forma_pagamento**
Registra os diferentes métodos de pagamento aceitos no cinema.

| Campo                   | Tipo         | Descrição |
|------------------------|-------------|-----------|
| `id_forma_pagamento`   | INT (PK, AI) | Identificador único do método de pagamento |
| `tipo_pag`             | VARCHAR(45)  | Tipo de pagamento (Crédito, Débito, PIX, etc.) |

---

### 5️⃣ **pedidos**
Armazena os pedidos realizados pelos clientes.

| Campo                           | Tipo         | Descrição |
|--------------------------------|-------------|-----------|
| `id_pedidos`                    | INT (PK, AI) | Identificador único do pedido |
| `tipo_pedido`                    | VARCHAR(45)  | Tipo de pedido (Ingresso, Combo, etc.) |
| `clientes_id_clientes`            | INT (FK)    | Chave estrangeira para identificar o cliente |
| `forma_pagamento_id_forma_pagamento` | INT (FK) | Chave estrangeira para a forma de pagamento |

---

### 6️⃣ **reserva**
Registra as reservas feitas pelos clientes para um determinado filme e assento.

| Campo                              | Tipo         | Descrição |
|-----------------------------------|-------------|-----------|
| `id_reserva`                     | INT (PK, AI) | Identificador único da reserva |
| `assento`                         | VARCHAR(45)  | Número do assento reservado |
| `clientes_id_clientes`            | INT (FK)    | Cliente que realizou a reserva |
| `catalogo_id_catalogo`            | INT (FK)    | Filme reservado (via catálogo) |
| `pedidos_id_pedidos`              | INT (FK)    | Pedido associado à reserva |
| `forma_pagamento_id_forma_pagamento` | INT (FK) | Forma de pagamento utilizada |

---

## 🏗 **Criação do Banco de Dados**
Para criar o banco de dados, siga as instruções abaixo e execute o seguinte script no MySQL:

```sql
CREATE DATABASE cinema;
USE cinema;

CREATE TABLE clientes (
    id_clientes INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL
);

CREATE TABLE filme (
    id_filme INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(45) NOT NULL,
    genero VARCHAR(45) NOT NULL,
    class_indicativa VARCHAR(45) NOT NULL
);

CREATE TABLE catalogo (
    id_catalogo INT PRIMARY KEY AUTO_INCREMENT,
    filme_id_filme INT NOT NULL,
    FOREIGN KEY (filme_id_filme) REFERENCES filme(id_filme)
);

CREATE TABLE forma_pagamento (
    id_forma_pagamento INT PRIMARY KEY AUTO_INCREMENT,
    tipo_pag VARCHAR(45) NOT NULL
);

CREATE TABLE pedidos (
    id_pedidos INT PRIMARY KEY AUTO_INCREMENT,
    tipo_pedido VARCHAR(45) NOT NULL,
    clientes_id_clientes INT NOT NULL,
    forma_pagamento_id_forma_pagamento INT NOT NULL,
    FOREIGN KEY (clientes_id_clientes) REFERENCES clientes(id_clientes),
    FOREIGN KEY (forma_pagamento_id_forma_pagamento) REFERENCES forma_pagamento(id_forma_pagamento)
);

CREATE TABLE reserva (
    id_reserva INT PRIMARY KEY AUTO_INCREMENT,
    assento VARCHAR(45) NOT NULL,
    clientes_id_clientes INT NOT NULL,
    catalogo_id_catalogo INT NOT NULL,
    pedidos_id_pedidos INT NOT NULL,
    forma_pagamento_id_forma_pagamento INT NOT NULL,
    FOREIGN KEY (clientes_id_clientes) REFERENCES clientes(id_clientes),
    FOREIGN KEY (catalogo_id_catalogo) REFERENCES catalogo(id_catalogo),
    FOREIGN KEY (pedidos_id_pedidos) REFERENCES pedidos(id_pedidos),
    FOREIGN KEY (forma_pagamento_id_forma_pagamento) REFERENCES forma_pagamento(id_forma_pagamento)
);
```

---

## 🚀 **Como Executar o Banco de Dados**
1. Instale o **XAMPP** e inicie o serviço do **MySQL**.
2. Abra o **MySQL** (como MySQL Workbench).
3. Copie e cole o script SQL acima para criar o banco de dados e suas tabelas.
4. Execute consultas `INSERT` para adicionar dados e testar o sistema.

---

## 🤝 **Colaboradores**
Este projeto foi desenvolvido por:

- [@gabrielresplandes](https://github.com/gabrielresplandes) 
- [@vitinhozy](https://github.com/vitinhozy)

Agradecemos a participação do professor e colegas na troca de ideias durante o desenvolvimento. 🎓📚

---

## 📄 **Licença**
Este projeto foi desenvolvido para fins educacionais e está sob a licença **MIT**.
