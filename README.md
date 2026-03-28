# otkrpg-database

Banco de dados para o sistema **Otaku's RPG**, contendo as tabelas e estrutura necessárias para gerenciar usuários, personagens e histórico de alterações.

## Tecnologias

- **MySQL 8.0** – SGBD relacional
- **Docker** – Ambiente de execução containerizado

## Estrutura do Banco

### Tabela `usuarios`

| Campo          | Tipo         | Descrição                       |
|----------------|--------------|---------------------------------|
| id             | VARCHAR(50)  | UUID (chave primária)           |
| nome_usuario   | VARCHAR(50)  | Nome de usuário (único)         |
| email          | VARCHAR(100) | E-mail (único)                  |
| senha_hash     | VARCHAR(255) | Hash da senha (bcrypt)          |
| criado_em      | TIMESTAMP    | Data de criação                 |
| atualizado_em  | TIMESTAMP    | Data da última atualização      |

### Tabela `personagens`

| Campo         | Tipo         | Descrição                                      |
|---------------|--------------|------------------------------------------------|
| id            | VARCHAR(50)  | UUID (chave primária)                          |
| usuario_id    | VARCHAR(50)  | FK para `usuarios`                             |
| nome          | VARCHAR(100) | Nome do personagem                             |
| revisao       | INT          | Controle de concorrência otimista (incrementa a cada atualização) |
| dados         | JSON         | Dados completos da ficha (atributos, jutsus, etc.) |
| criado_em     | TIMESTAMP    | Data de criação                                |
| atualizado_em | TIMESTAMP    | Data da última atualização                     |

### Tabela `historico_personagens`

| Campo           | Tipo         | Descrição                                   |
|-----------------|--------------|---------------------------------------------|
| id              | VARCHAR(50)  | UUID (chave primária)                       |
| personagem_id   | VARCHAR(50)  | FK para `personagens`                       |
| versao          | INT          | Número sequencial da versão (1,2,3...)      |
| dados           | JSON         | Snapshot completo da ficha naquela versão   |
| alterado_por    | VARCHAR(50)  | FK para `usuarios` (quem fez a alteração)   |
| motivo_alteracao| VARCHAR(255) | Motivo opcional da alteração                |
| criado_em       | TIMESTAMP    | Data de criação da versão                   |

## Estrutura do JSON (`dados`)

O campo `dados` armazena toda a ficha do personagem com a seguinte estrutura (exemplo resumido):

```json
{
  "vila": "Konoha",
  "fisico": 5,
  "peso": "50kg",
  "linhagem": "Uzumaki",
  "rank": "Genin",
  "atributos": {
    "estrutural": { "fisico": 5, "reflexo": 4, "consistencia": 5 },
    "mental": { "logica": 3, "instinto": 6, "vontade": 7 },
    "sobrenatural": { "sinergia": 6, "destino": 7, "essencia": 5 }
  },
  "ninshu": {
    "ninjutsu": 6,
    "fuuinjutsu": 2,
    "genjutsu": 1,
    "bukijutsu": 3,
    "taijutsu": 5,
    "senjutsu": 0,
    "in": 0,
    "jujutsu": 0,
    "kekkeiGenkai": 4,
    "gijutsu": 0
  },
  "jutsus": "Kage Bunshin no Jutsu, Rasengan",
  "qualidadesDefeitos": "...",
  "itens": "...",
  "especializacoes": "...",
  "lacos": "...",
  "anotacoes": "..."
}