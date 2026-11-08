# IA_REPORT.md

## 1. Identificação

- **Nome completo:** Laís Carlos Rodrigues
- **Matrícula:** 681

---

## 2. Histórico de Prompts

### Modelo utilizado: Gemini Flash

---

### Prompt 1

**Pergunta enviada à IA:**

> Este tem algo a ver com o lambda, mas não compreendi bem esse conceito. Me ajude a entender essa parte e a corrigir meu erro.

```haskell
pesoMaximo :: Double
pesoMaximo = 5.0

data Encomenda = Encomenda
  { destinatario :: String
  , peso         :: Double
  , frete        :: Double
  }

descrever :: Encomenda -> String
descrever e =
  destinatario e ++ " - " ++ show (peso e) ++ " kg - frete R$ " ++ show (frete e)

cabemNaVassoura :: [Encomenda] -> [Encomenda]
cabemNaVassoura encomendas = map (\e -> peso e <= pesoMaximo) encomendas

totalDeFretes :: [Encomenda] -> Double
totalDeFretes encomendas = sum (map frete encomendas)

main :: IO ()
main = do
  let encomendas =
        [ Encomenda { destinatario = "Osono", peso = 2.0, frete = 15.0 }
        , Encomenda { destinatario = "Madame", peso = 7.5, frete = 40.0 }
        , Encomenda { destinatario = "Tombo", peso = 4.5, frete = 20.0 }
        , Encomenda { destinatario = "Ursula", peso = 9.0, frete = 55.0 }
        ]

  putStrLn "--- Todas as encomendas ---"
  mapM_ putStrLn (map descrever encomendas)

  let aceitas = cabemNaVassoura encomendas

  putStrLn "--- Cabem na vassoura ---"
  mapM_ putStrLn (map descrever aceitas)

  putStrLn ("Total de fretes: R$ " ++ show (totalDeFretes aceitas))
```

**Resposta obtida:**

O erro principal está na função `cabemNaVassoura`.

**Entendendo o lambda**

Uma expressão lambda em Haskell é uma função anônima criada na hora. A sintaxe `\parametro -> expressao` significa: "receba `parametro` e retorne `expressao`". Quando você escreveu:

```haskell
\e -> peso e <= pesoMaximo
```

Criou uma função que recebe uma `Encomenda` e retorna um `Bool` — `True` se o peso for até 5.0 kg, `False` caso contrário.

**Por que deu erro com `map`?**

A função `map` aplica uma função a cada elemento de uma lista e retorna uma nova lista com os resultados. Ao usar `map (\e -> peso e <= pesoMaximo) encomendas`, em vez de retornar `[Encomenda]`, o `map` retornou `[Bool]` — uma lista de verdadeiros e falsos. Isso causou dois problemas: a assinatura dizia que a função retornaria `[Encomenda]`, mas a expressão gerou `[Bool]`; e no `main`, você tentou passar esse `[Bool]` para `descrever`, que espera uma `Encomenda`.

**Como corrigir — usar `filter` em vez de `map`**

Para selecionar elementos de uma lista mantendo o tipo original, a função correta é `filter`. Ela recebe uma função que retorna `Bool` e mantém apenas os elementos que retornam `True`:

```haskell
cabemNaVassoura :: [Encomenda] -> [Encomenda]
cabemNaVassoura encomendas = filter (\e -> peso e <= pesoMaximo) encomendas
```

Código completo corrigido:

```haskell
pesoMaximo :: Double
pesoMaximo = 5.0

data Encomenda = Encomenda
  { destinatario :: String
  , peso         :: Double
  , frete        :: Double
  }

descrever :: Encomenda -> String
descrever e =
  destinatario e ++ " - " ++ show (peso e) ++ " kg - frete R$ " ++ show (frete e)

cabemNaVassoura :: [Encomenda] -> [Encomenda]
cabemNaVassoura encomendas = filter (\e -> peso e <= pesoMaximo) encomendas

totalDeFretes :: [Encomenda] -> Double
totalDeFretes encomendas = sum (map frete encomendas)

main :: IO ()
main = do
  let encomendas =
        [ Encomenda { destinatario = "Osono", peso = 2.0, frete = 15.0 }
        , Encomenda { destinatario = "Madame", peso = 7.5, frete = 40.0 }
        , Encomenda { destinatario = "Tombo", peso = 4.5, frete = 20.0 }
        , Encomenda { destinatario = "Ursula", peso = 9.0, frete = 55.0 }
        ]

  putStrLn "--- Todas as encomendas ---"
  mapM_ putStrLn (map descrever encomendas)

  let aceitas = cabemNaVassoura encomendas

  putStrLn "--- Cabem na vassoura ---"
  mapM_ putStrLn (map descrever aceitas)

  putStrLn ("Total de fretes: R$ " ++ show (totalDeFretes aceitas))
```

Saída esperada:

```
--- Todas as encomendas ---
Osono - 2.0 kg - frete R$ 15.0
Madame - 7.5 kg - frete R$ 40.0
Tombo - 4.5 kg - frete R$ 20.0
Ursula - 9.0 kg - frete R$ 55.0
--- Cabem na vassoura ---
Osono - 2.0 kg - frete R$ 15.0
Tombo - 4.5 kg - frete R$ 20.0
Total de fretes: R$ 35.0
```

---

## 3. Relatório de Aprendizado

### Como a resposta me ajudou (ou falhou em me ajudar) na solução do problema:

Foi bem completa, além de corrigir o erro, explicou o conceito de lambda e a diferença entre `map` e `filter`, que era exatamente o que eu precisava entender.

### De que forma ela solucionou a minha dúvida:

Esclareceu que o lambda `\e -> peso e <= pesoMaximo` retorna um `Bool`, e que `map` constrói uma nova lista com esses resultados, ou seja, `[Bool]`, não `[Encomenda]`. Para filtrar elementos mantendo o tipo original, o correto é `filter`.

### O que aprendi com aquele retorno para aplicar em problemas futuros:

Aprendi a diferença prática entre `map` e `filter` em Haskell: `map` transforma cada elemento (pode mudar o tipo), enquanto `filter` seleciona elementos com base em uma condição (mantém o tipo). Quando quero filtrar uma lista sem mudar o tipo, uso `filter` com um lambda que retorna `Bool`.