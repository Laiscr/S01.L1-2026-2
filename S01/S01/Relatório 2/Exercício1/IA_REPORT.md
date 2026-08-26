# IA_REPORT.md

## 1. Identificação

- **Nome completo:** Laís Carlos Rodrigues
- **Matrícula:** 681

---

## 2. Histórico de Prompts

### Modelo utilizado: Google Modo IA (Pesquisa no Google)

---

### Prompt 1

**Pergunta enviada à IA:**

> potencia em lua biblioteca

**Resposta obtida:**

Em Lua, para calcular a potência de um número, você não precisa chamar uma função de biblioteca específica. A linguagem usa o operador nativo de acento circunflexo (`^`) diretamente, que é ativado pela biblioteca matemática padrão.

Como usar a potência:

- Use o símbolo `^` entre a base e o expoente.
- Exemplo básico: `2 ^ 3` resulta em `8`.
- Exemplo com código: `local res = 5 ^ 2` armazena `25` na variável.

A biblioteca padrão de Lua gerencia operações avançadas, mas o cálculo de potências gerais foi projetado para pertencer à sintaxe básica do operador `^`. Se precisar de exponenciação de base euleriana, você pode recorrer à função específica `math.exp(x)` da biblioteca `math`.

---

## 3. Relatório de Aprendizado

### Como a resposta me ajudou (ou falhou em me ajudar) na solução do problema:

A resposta foi direta e muito útil, pois evitou que eu perdesse tempo procurando ou importando funções desnecessárias na biblioteca `math`.

### De que forma ela solucionou a minha dúvida:

Mostrou que a potenciação em Lua é um operador nativo (`^`), dispensando o uso de métodos como `math.pow()` presentes em outras linguagens.

### O que aprendi com aquele retorno para aplicar em problemas futuros:

Aprendi a sintaxe do operador `^` para cálculos de potência em Lua e que a biblioteca `math` é reservada para casos específicos, como `math.exp()`.
