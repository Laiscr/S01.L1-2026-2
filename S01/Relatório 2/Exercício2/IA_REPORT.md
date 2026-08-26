# IA_REPORT.md

## 1. Identificação

- **Nome completo:** Laís Carlos Rodrigues
- **Matrícula:** 681

---

## 2. Histórico de Prompts

### Modelo utilizado: Gemini Flash 3.7

---

### Prompt 1

**Pergunta enviada à IA:**

> Meu código não funciona, mas desconfio que seja por conta da tabela. Não sei como criar uma tabela que inicia vazia em Lua. Os exemplos passados não há um assim. Como faço?

```lua
function contarOcorrencias(tabela, alvo)
    local contador = 0
    for i = 1, #tabela do
        if tabela[i] == alvo then
            contador = contador + 1
        end
    end
    return contador
end

print("Digite a quantidade de elementos (N):")
local n = tonumber(io.read())

for i = 1, n do
    print("Digite o " .. i .. "o numero:")
    local valor = tonumber(io.read())
    table.insert(numeros, valor)
end

print("Digite o numero a ser buscado (X):")
local x = tonumber(io.read())

local ocorrencias = contarOcorrencias(numeros, x)
print("O numero " .. x .. " aparece " .. ocorrencias .. " vez(es) na tabela.")
```

**Resposta obtida:**

Para criar uma tabela vazia em Lua, você só precisa declarar a variável atribuindo chaves vazias `{}`:

```lua
local numeros = {}
```

No seu código, a variável `numeros` não havia sido declarada antes do laço, então ela era `nil`, gerando um erro ao tentar executar `table.insert(numeros, valor)`.

Aqui está o seu código corrigido:

```lua
function contarOcorrencias(tabela, alvo)
    local contador = 0
    for i = 1, #tabela do
        if tabela[i] == alvo then
            contador = contador + 1
        end
    end
    return contador
end

print("Digite a quantidade de elementos (N):")
local n = tonumber(io.read())

-- Inicialização da tabela vazia
local numeros = {}

for i = 1, n do
    print("Digite o " .. i .. "o numero:")
    local valor = tonumber(io.read())
    table.insert(numeros, valor)
end

print("Digite o numero a ser buscado (X):")
local x = tonumber(io.read())

local ocorrencias = contarOcorrencias(numeros, x)
print("O numero " .. x .. " aparece " .. ocorrencias .. " vez(es) na tabela.")
```

**Formas equivalentes de adicionar elementos em tabelas em Lua:**

- `table.insert(numeros, valor)` — insere no final da lista.
- `numeros[#numeros + 1] = valor` — forma direta e comum em Lua para empurrar um novo elemento ao final sem chamar a biblioteca `table`.

---

## 3. Relatório de Aprendizado

### Como a resposta me ajudou (ou falhou em me ajudar) na solução do problema:

A resposta foi útil, pois meu código rodou como esperado. Meu problema era algo que já desconfiava, porém, como não vi nos exemplos dados, e nem em aulas de algoritmos, não sabia que poderia criar um vetor vazio. Novidade boa.

### De que forma ela solucionou a minha dúvida:

Explicou que a variável `numeros` não existia no escopo e mostrou a sintaxe correta para inicializá-la vazia usando `{}`.

### O que aprendi com aquele retorno para aplicar em problemas futuros:

Aprendi a declarar tabelas vazias em Lua e vi duas formas de inserir dados dinamicamente: via `table.insert()` e por indexação direta com `tabela[#tabela + 1]`.
