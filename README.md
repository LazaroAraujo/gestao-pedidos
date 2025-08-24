# 🛒 Sistema de gestão de pedidos

Um sistema simples de gestão de pedidos em Java com foco no aprendizado e consolidação de conceitos aplicados no desenvolvimento de sistemas back-end.

## 🛠 Tecnologias Utilizadas

- **Java JDK** (versão recomendada: 21)
- **Gradle**
- **Spring Boot**
- **Spring Cloud Gateway**
- **Spring Cloud Netflix Eureka**
- **Lombok**
- **Banco de dados H2**

## 📂 Estrutura do Projeto

O projeto contém os seguintes módulos:

* **ms-discovery**
* **ms-gateway**: Tem por função direcionar requisições para os microserviços. Necessita autenticação.
* **ms-pedidos**: Acessível pela porta 8200. 
* **ms-produtos**: Acessível pela porta 8100. Tem por função o gerenciamento de produtos.



## ▶️ Como executar

1. **Clone o repositório**
   ```bash
   git clone https://github.com/LazaroAraujo/gestao-pedidos.git
   ```
2. **Acesse o diretório**
   ```bash
   cd gestao-pedidos
   ```
3. **Execute o Script**
   ```bash
   start-services.bat
   ```

 
---

## 🔒 Autenticação

Basta incluir o token no cabeçalho da requisição.

### 1️⃣ Criar Produto

- **Método:** `POST`
- **URL:** `http://localhost:8080/ms-produtos/produtos`

### 2️⃣ Buscar todos por pedido

- **Método:** `GET`
- **URL:** `http://localhost:8080/ms-pedidos/produtos`

### 3️⃣ Buscar por id

Digite o id do pedido no final da url.

- **Método:** `GET`
- **URL:** `http://localhost:8080/ms-produtos/produtos/`

### 4️⃣ Buscar todos por produto

- **Método:** `GET`
- **URL:** `http://localhost:8080/ms-produtos/produtos/buscar-todos`

---

## 📜 Licença

Este projeto é de uso livre, podendo ser estudado e modificado para fins acadêmicos ou pessoais.

## 💡 Autores

O projeto foi desenvolvido no contexto do desafio NTT DATA no bootcamp NTT DATA - Java e IA para Iniciantes.
