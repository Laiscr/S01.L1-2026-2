# IA_REPORT.md

## 1. Identificação

- **Nome completo:** Laís Carlos Rodrigues
- **Matrícula:** 681

---

## 2. Histórico de Prompts

### Modelo utilizado: (ex: Claude Sonnet, GitHub Copilot, ChatGPT...)

---

### Prompt 1

**Pergunta enviada à IA:**

> o que significa non-exhaustive? Executei o código abaixo e recebi o erro: `Non-exhaustive patterns in function contarEsbocos`

```haskell
data Esboco = Esboco
  { titulo  :: String
  , tecnica :: String
  , horas   :: Int
  }

esbocoMaisRecente :: [Esboco] -> String
esbocoMaisRecente []    = "O caderno esta vazio."
esbocoMaisRecente (e:_) = titulo e ++ " (" ++ tecnica e ++ ")"

contarEsbocos :: [Esboco] -> Int
contarEsbocos (_:resto) = 1 + contarEsbocos resto

horasDesenhando :: [Esboco] -> Int
horasDesenhando []        = 0
horasDesenhando (e:resto) = horas e + horasDesenhando resto

main :: IO ()
main = do
  let caderno =
        [ Esboco { titulo = "Ruina Submersa", tecnica = "nanquim", horas = 6 }
        , Esboco { titulo = "Criatura da Neblina", tecnica = "carvao", horas = 4 }
        , Esboco { titulo = "Torre Abandonada", tecnica = "grafite", horas = 3 }
        ]

  putStrLn "--- Caderno ---"
  putStrLn (esbocoMaisRecente caderno)
  putStrLn ("Esbocos: " ++ show (contarEsbocos caderno))
  putStrLn ("Horas desenhando: " ++ show (horasDesenhando caderno))

  putStrLn "--- Caderno vazio ---"
  putStrLn (esbocoMaisRecente [])

  let cadernoNovo =
        Esboco { titulo = "Floresta Morta", tecnica = "nanquim", horas = 5 } : caderno

  putStrLn "--- Caderno novo ---"
  putStrLn (esbocoMaisRecente cadernoNovo)
  putStrLn ("Esbocos: " ++ show (contarEsbocos cadernoNovo))

  putStrLn "--- Caderno anterior ---"
  putStrLn (esbocoMaisRecente caderno)
  putStrLn ("Esbocos: " ++ show (contarEsbocos caderno))

  -- putStrLn (titulo (head []))  -- erro ao executar: Prelude.head: empty list
```

**Resposta obtida:**

O erro "Non-exhaustive patterns in function..." ocorre quando uma função definida por Pattern Matching (casamento de padrões) não cobre todas as possibilidades de entrada que a estrutura de dados pode assumir.

Em Haskell, uma lista `[a]` pode estar em apenas dois estados possíveis: vazia (`[]`) ou não-vazia (`(x:xs)`, onde `x` é a cabeça e `xs` é a cauda).

**Onde está o erro no seu código**

Na função `contarEsbocos`, você definiu apenas o padrão para listas não-vazias:

```haskell
-- Padrão incompleto: trata apenas (_:resto)
contarEsbocos :: [Esboco] -> Int
contarEsbocos (_:resto) = 1 + contarEsbocos resto
```

Quando a recursão chega ao fim da lista (ou se você passar uma lista vazia `[]`), a função tenta casar a entrada `[]` com o padrão `(_:resto)`. Como a lista vazia não tem cabeça nem cauda, o casamento falha e o Haskell lança uma exceção em tempo de execução.

**Como corrigir**

Basta adicionar o caso base para a lista vazia `[]`:

```haskell
contarEsbocos :: [Esboco] -> Int
contarEsbocos []        = 0                       -- Caso base: lista vazia tem 0 esboços
contarEsbocos (_:resto) = 1 + contarEsbocos resto -- Caso recursivo
```

Código completo corrigido:

```haskell
data Esboco = Esboco
  { titulo  :: String
  , tecnica :: String
  , horas   :: Int
  }

esbocoMaisRecente :: [Esboco] -> String
esbocoMaisRecente []    = "O caderno esta vazio."
esbocoMaisRecente (e:_) = titulo e ++ " (" ++ tecnica e ++ ")"

contarEsbocos :: [Esboco] -> Int
contarEsbocos []        = 0
contarEsbocos (_:resto) = 1 + contarEsbocos resto

horasDesenhando :: [Esboco] -> Int
horasDesenhando []        = 0
horasDesenhando (e:resto) = horas e + horasDesenhando resto

main :: IO ()
main = do
  let caderno =
        [ Esboco { titulo = "Ruina Submersa", tecnica = "nanquim", horas = 6 }
        , Esboco { titulo = "Criatura da Neblina", tecnica = "carvao", horas = 4 }
        , Esboco { titulo = "Torre Abandonada", tecnica = "grafite", horas = 3 }
        ]

  putStrLn "--- Caderno ---"
  putStrLn (esbocoMaisRecente caderno)
  putStrLn ("Esbocos: " ++ show (contarEsbocos caderno))
  putStrLn ("Horas desenhando: " ++ show (horasDesenhando caderno))

  putStrLn "--- Caderno vazio ---"
  putStrLn (esbocoMaisRecente [])
  putStrLn ("Esbocos: " ++ show (contarEsbocos []))

  let cadernoNovo =
        Esboco { titulo = "Floresta Morta", tecnica = "nanquim", horas = 5 } : caderno

  putStrLn "--- Caderno novo ---"
  putStrLn (esbocoMaisRecente cadernoNovo)
  putStrLn ("Esbocos: " ++ show (contarEsbocos cadernoNovo))

  putStrLn "--- Caderno anterior ---"
  putStrLn (esbocoMaisRecente caderno)
  putStrLn ("Esbocos: " ++ show (contarEsbocos caderno))
```

Dica: ao compilar com `ghc -Wall Exercicio3.hs`, o GHC avisa antecipadamente sobre qualquer função com pattern matching incompleto antes mesmo de executar o programa.

---

### Prompt 2

**Pergunta enviada à IA:**

> não entendi esse casamento de padrões...me pareceu muito abstrato

**Resposta obtida:**

Pense no Pattern Matching como um `switch/case` superpoderoso que desestrutura dados. Em Haskell, quando você cria uma função com vários casos, o compilador pega o valor que você passou e tenta "encaixar" no primeiro formato que ele encontrar de cima para baixo.

**O formato das listas em Haskell**

Imagine um trem de vagões: uma lista vazia `[]` é um trilho sem nenhum vagão. Uma lista com elementos `(e:resto)` é o primeiro vagão (`e`) engatado no resto do trem (`resto`). Quando você escreve `(e:resto)`, o `:` é o operador que "gruda" a cabeça da lista no resto dela.

**Passo a passo da execução (sem o caso `[]`)**

Chamando `contarEsbocos [Desenho1, Desenho2]`:

1. Haskell pergunta: `[Desenho1, Desenho2]` encaixa em `(_:resto)`? **Sim!** Executa `1 + contarEsbocos [Desenho2]`.
2. Haskell pergunta: `[Desenho2]` encaixa em `(_:resto)`? **Sim!** Executa `1 + contarEsbocos []`.
3. Haskell pergunta: `[]` encaixa em `(_:resto)`? **Não!** Lista vazia não tem "primeiro vagão". Como não existe outra linha para tratar `[]`, o programa trava com `non-exhaustive patterns`.

**A analogia da caixa**

Pense que a função recebe uma caixa de encomendas:

```haskell
contarEsbocos :: [Esboco] -> Int
contarEsbocos []        = 0                       -- Regra 1: caixa VAZIA → retorne 0
contarEsbocos (_:resto) = 1 + contarEsbocos resto -- Regra 2: tem ALGO → tire 1 item e conte o resto
```

O `_` significa "pegue o primeiro item, mas não me importo com o conteúdo". O `resto` guarda todos os outros itens que sobraram.

**Comparando com Python**

```python
def contarEsbocos(lista):
    if len(lista) == 0:      # Corresponde ao caso []
        return 0
    else:                    # Corresponde ao caso (_:resto)
        resto = lista[1:]
        return 1 + contarEsbocos(resto)
```

Em Haskell, em vez de usar `if/else` e navegar por índices, nós desenhamos a estrutura do dado direto na assinatura da função. Se o dado tiver aquele formato, aquela linha é executada.

---

## 3. Relatório de Aprendizado

### Como a resposta me ajudou (ou falhou em me ajudar) na solução do problema:

As duas respostas foram complementares. A primeira resolveu o erro diretamente e mostrou a correção. A segunda me ensinou. Como o conceito ainda parecia abstrato, pedi uma explicação mais visual, e a analogia do trem e da caixa tornou tudo muito mais claro.

### De que forma ela solucionou a minha dúvida:

Entendi que `contarEsbocos` só tinha o caso para listas não vazias (`_:resto`), então quando a recursão chegava ao fim e encontrava `[]`, o programa não sabia o que fazer e travava. A solução foi adicionar `contarEsbocos [] = 0` como caso base. A comparação com Python também ajudou porque mostrou que é a mesma lógica de um `if/else`, só escrita de forma diferente.

### O que aprendi com aquele retorno para aplicar em problemas futuros:

Aprendi que toda função recursiva em Haskell que opera sobre listas precisa cobrir os dois casos possíveis: lista vazia (`[]`) e lista não-vazia (`(x:xs)`). Esquecer o caso base da lista vazia causa um erro em tempo de execução, mas o compilador com `-Wall` avisa antes. A partir de agora, sempre que definir uma função recursiva sobre lista, vou garantir que os dois padrões estão presentes >:o.