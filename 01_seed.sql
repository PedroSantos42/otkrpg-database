-- =====================================================
-- SEED: Usuário de exemplo e 3 personagens
-- =====================================================

-- Inserir um usuário para os personagens
-- senha_hash será "senha123" em bcrypt (exemplo)
INSERT INTO usuarios (id, nome_usuario, email, senha_hash) VALUES
(UUID(), 'mestre_rpg', 'mestre@otakurpg.com', '$2a$10$X9kKz1lX9Z8Y7W6V5U4T3S2R1Q0P9O8I7U6Y5T4R3E2W1Q0A9S8D7F6G5H4J3');

-- Obter o ID do usuário recém-inserido (precisa ser dinâmico, mas como é único, podemos capturar em variável)
-- Vamos usar variáveis de sessão para facilitar
SET @usuario_id = (SELECT id FROM usuarios WHERE nome_usuario = 'mestre_rpg' LIMIT 1);

-- ========== Personagem 1: Naruto Uzumaki ==========
INSERT INTO personagens (id, usuario_id, nome, dados) VALUES
(UUID(), @usuario_id, 'Naruto Uzumaki', 
'{
  "vila": "Konoha",
  "fisico": 5,
  "peso": "50kg",
  "linhagem": "Uzumaki",
  "rank": "Genin",
  "social": "Popular",
  "idade": "16",
  "jogador": "Mestre RPG",
  "natureza": "Vento",
  "moralidade": "Leal e Bom",
  "altura": "166cm",
  "atributos": {
    "estrutural": { "fisico": 5, "reflexo": 4, "consistencia": 5 },
    "mental": { "logica": 3, "instinto": 6, "vontade": 7 },
    "sobrenatural": { "sinergia": 6, "destino": 7, "essencia": 5 }
  },
  "bases": 4,
  "forca": 5,
  "emocao": 6,
  "magica": 4,
  "saude": { "atual": 15, "maximo": 15 },
  "stamina": { "atual": 12, "maximo": 12 },
  "chakra": { "atual": 20, "maximo": 20 },
  "experiencia": 150,
  "dinheiro": 5000,
  "tracosSociais": {
    "extroversao": 7,
    "intuicao": 5,
    "analista": 3,
    "planejador": 2,
    "assertivo": 8
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
  "qualidadesDefeitos": "Qualidade: Determinação; Defeito: Impulsivo",
  "itens": "Kunais, Shurikens, Pergaminho de Invocação",
  "jutsus": "Kage Bunshin no Jutsu, Rasengan, Tajuu Kage Bunshin",
  "especializacoes": "Ninjutsu, Invocações",
  "lacos": "Sasuke, Sakura, Jiraiya",
  "anotacoes": "Portador da Kyuubi."
}');

-- ========== Personagem 2: Sasuke Uchiha ==========
INSERT INTO personagens (id, usuario_id, nome, dados) VALUES
(UUID(), @usuario_id, 'Sasuke Uchiha', 
'{
  "vila": "Konoha",
  "fisico": 5,
  "peso": "52kg",
  "linhagem": "Uchiha",
  "rank": "Genin",
  "social": "Reservado",
  "idade": "16",
  "jogador": "Mestre RPG",
  "natureza": "Fogo, Relâmpago",
  "moralidade": "Neutro",
  "altura": "168cm",
  "atributos": {
    "estrutural": { "fisico": 5, "reflexo": 7, "consistencia": 4 },
    "mental": { "logica": 6, "instinto": 7, "vontade": 5 },
    "sobrenatural": { "sinergia": 7, "destino": 6, "essencia": 6 }
  },
  "bases": 5,
  "forca": 5,
  "emocao": 4,
  "magica": 6,
  "saude": { "atual": 14, "maximo": 14 },
  "stamina": { "atual": 13, "maximo": 13 },
  "chakra": { "atual": 18, "maximo": 18 },
  "experiencia": 160,
  "dinheiro": 4000,
  "tracosSociais": {
    "extroversao": 2,
    "intuicao": 7,
    "analista": 6,
    "planejador": 5,
    "assertivo": 5
  },
  "ninshu": {
    "ninjutsu": 7,
    "fuuinjutsu": 1,
    "genjutsu": 4,
    "bukijutsu": 4,
    "taijutsu": 6,
    "senjutsu": 0,
    "in": 0,
    "jujutsu": 0,
    "kekkeiGenkai": 6,
    "gijutsu": 0
  },
  "qualidadesDefeitos": "Qualidade: Análise Rápida; Defeito: Vingativo",
  "itens": "Chokuto, Shurikens, Pergaminhos",
  "jutsus": "Chidori, Katon: Goukakyuu, Sharingan",
  "especializacoes": "Ninjutsu, Taijutsu, Genjutsu",
  "lacos": "Naruto, Itachi, Orochimaru",
  "anotacoes": "Último sobrevivente do clã Uchiha."
}');

-- ========== Personagem 3: Sakura Haruno ==========
INSERT INTO personagens (id, usuario_id, nome, dados) VALUES
(UUID(), @usuario_id, 'Sakura Haruno', 
'{
  "vila": "Konoha",
  "fisico": 3,
  "peso": "45kg",
  "linhagem": "Haruno",
  "rank": "Genin",
  "social": "Inteligente",
  "idade": "16",
  "jogador": "Mestre RPG",
  "natureza": "Terra",
  "moralidade": "Leal e Bom",
  "altura": "161cm",
  "atributos": {
    "estrutural": { "fisico": 3, "reflexo": 4, "consistencia": 5 },
    "mental": { "logica": 8, "instinto": 5, "vontade": 6 },
    "sobrenatural": { "sinergia": 3, "destino": 4, "essencia": 4 }
  },
  "bases": 3,
  "forca": 4,
  "emocao": 5,
  "magica": 3,
  "saude": { "atual": 12, "maximo": 12 },
  "stamina": { "atual": 10, "maximo": 10 },
  "chakra": { "atual": 12, "maximo": 12 },
  "experiencia": 140,
  "dinheiro": 3500,
  "tracosSociais": {
    "extroversao": 4,
    "intuicao": 5,
    "analista": 8,
    "planejador": 6,
    "assertivo": 3
  },
  "ninshu": {
    "ninjutsu": 3,
    "fuuinjutsu": 2,
    "genjutsu": 5,
    "bukijutsu": 2,
    "taijutsu": 4,
    "senjutsu": 0,
    "in": 0,
    "jujutsu": 0,
    "kekkeiGenkai": 0,
    "gijutsu": 0
  },
  "qualidadesDefeitos": "Qualidade: Inteligência; Defeito: Insegurança",
  "itens": "Kunais, Livros Médicos, Selos",
  "jutsus": "Kai, Chakra no Meshi, Shousen Jutsu",
  "especializacoes": "Genjutsu, Medicina",
  "lacos": "Naruto, Sasuke, Ino",
  "anotacoes": "Estudiosa do clã Haruno."
}');

-- Exibir as inserções (opcional)
SELECT 'Seed concluído com sucesso!' AS Status;
SELECT * FROM usuarios;
SELECT * FROM personagens;