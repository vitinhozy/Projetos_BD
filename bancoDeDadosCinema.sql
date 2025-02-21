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
    forma_pagamento_tipo_pag VARCHAR(45),
    FOREIGN KEY (clientes_id_clientes) REFERENCES clientes(id_clientes),
    FOREIGN KEY (forma_pagamento_id_forma_pagamento) REFERENCES forma_pagamento(id_forma_pagamento)
);

CREATE TABLE reserva (
    id_reserva INT PRIMARY KEY AUTO_INCREMENT,
    assento VARCHAR(45) NOT NULL,
    clientes_id_clientes INT NOT NULL,
    catalogo_id_catalogo INT NOT NULL,
    catalogo_filme_id_filme INT NOT NULL,
    pedidos_id_pedidos INT NOT NULL,
    pedidos_clientes_id_clientes INT NOT NULL,
    forma_pagamento_id_forma_pagamento INT NOT NULL,
    forma_pagamento_tipo_pag VARCHAR(45),
    FOREIGN KEY (clientes_id_clientes) REFERENCES clientes(id_clientes),
    FOREIGN KEY (catalogo_id_catalogo) REFERENCES catalogo(id_catalogo),
    FOREIGN KEY (catalogo_filme_id_filme) REFERENCES filme(id_filme),
    FOREIGN KEY (pedidos_id_pedidos) REFERENCES pedidos(id_pedidos),
    FOREIGN KEY (pedidos_clientes_id_clientes) REFERENCES clientes(id_clientes),
    FOREIGN KEY (forma_pagamento_id_forma_pagamento) REFERENCES forma_pagamento(id_forma_pagamento)
);