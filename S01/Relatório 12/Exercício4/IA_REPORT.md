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

> estou sentindo minhas forças indo embora com tantos erros... recebi os seguintes:
>
> `Exercicio4.hs:12:47: No instance for (Show Etapa) arising from a use of 'show'`
>
> `Exercicio4.hs:19:41: No instance for (Eq Etapa) arising from a use of '=='`

```haskell
data Etapa = NaFila | NoBanho | Concluido

data Atendimento = Atendimento
  { cliente :: String
  , servico :: String
  , valor   :: Double
  , etapa   :: Etapa
  }

descrever :: Atendimento -> String
descrever a =
  cliente a ++ " - " ++ servico a ++ " - " ++ show (etapa a)

concluir :: Atendimento -> Atendimento
concluir a = a { etapa = Concluido }

arrecadado :: [Atendimento] -> Double
arrecadado atendimentos =
  sum (map valor (filter (\a -> etapa a == Concluido) atendimentos))

main :: IO ()
main = do
  let deusDoRio =
        Atendimento { cliente = "Deus do Rio", servico = "Banho de ervas"
                    , valor = 120.0, etapa = NaFila }
  let semRosto =
        Atendimento { cliente = "Sem Rosto", servico = "Banho simples"
                    , valor = 60.0, etapa = NoBanho }
  let deusRabanete =
        Atendimento { cliente = "Deus Rabanete", servico = "Banho de vapor"
                    , valor = 80.0, etapa = NaFila }

  let atendimentos = [deusDoRio, semRosto, deusRabanete]
  let finalizados = [concluir deusDoRio, semRosto, concluir deusRabanete]

  putStrLn "--- Atendimentos do dia ---"
  mapM_ putStrLn (map descrever atendimentos)
  putStrLn ("Arrecadado: R$ " ++ show (arrecadado atendimentos))

  putStrLn "--- Depois de concluir alguns ---"
  mapM_ putStrLn (map descrever finalizados)
  putStrLn ("Arrecadado: R$ " ++ show (arrecadado finalizados))

  putStrLn "--- Lista original ---"
  mapM_ putStrLn (map descrever atendimentos)
  putStrLn ("Arrecadado: R$ " ++ show (arrecadado atendimentos))
```

**Resposta obtida:**

Em Haskell, tipos customizados (como `data Etapa`) não vêm com comportamentos padrão como "converter para texto" ou "comparar igualdade". Você precisa dizer ao Haskell que seu tipo pode ser exibido ou comparado.

Os dois erros explicam isso diretamente: `No instance for (Show Etapa)` significa que `show` não sabe como formatar `NaFila`, `NoBanho` ou `Concluido`; `No instance for (Eq Etapa)` significa que `==` não sabe como comparar valores do tipo `Etapa`.

**Como resolver**

Basta adicionar `deriving (Show, Eq)` ao final da definição do tipo. Altere:

```haskell
data Etapa = NaFila | NoBanho | Concluido
```

Para:

```haskell
data Etapa = NaFila | NoBanho | Concluido
  deriving (Show, Eq)
```

`Show` permite usar `show (etapa a)`, e `Eq` permite usar o operador `etapa a == Concluido`.

Código completo corrigido:

```haskell
data Etapa = NaFila | NoBanho | Concluido
  deriving (Show, Eq)

data Atendimento = Atendimento
  { cliente :: String
  , servico :: String
  , valor   :: Double
  , etapa   :: Etapa
  }

descrever :: Atendimento -> String
descrever a =
  cliente a ++ " - " ++ servico a ++ " - " ++ show (etapa a)

concluir :: Atendimento -> Atendimento
concluir a = a { etapa = Concluido }

arrecadado :: [Atendimento] -> Double
arrecadado atendimentos =
  sum (map valor (filter (\a -> etapa a == Concluido) atendimentos))

main :: IO ()
main = do
  let deusDoRio =
        Atendimento { cliente = "Deus do Rio", servico = "Banho de ervas"
                    , valor = 120.0, etapa = NaFila }
  let semRosto =
        Atendimento { cliente = "Sem Rosto", servico = "Banho simples"
                    , valor = 60.0, etapa = NoBanho }
  let deusRabanete =
        Atendimento { cliente = "Deus Rabanete", servico = "Banho de vapor"
                    , valor = 80.0, etapa = NaFila }

  let atendimentos = [deusDoRio, semRosto, deusRabanete]
  let finalizados = [concluir deusDoRio, semRosto, concluir deusRabanete]

  putStrLn "--- Atendimentos do dia ---"
  mapM_ putStrLn (map descrever atendimentos)
  putStrLn ("Arrecadado: R$ " ++ show (arrecadado atendimentos))

  putStrLn "--- Depois de concluir alguns ---"
  mapM_ putStrLn (map descrever finalizados)
  putStrLn ("Arrecadado: R$ " ++ show (arrecadado finalizados))

  putStrLn "--- Lista original ---"
  mapM_ putStrLn (map descrever atendimentos)
  putStrLn ("Arrecadado: R$ " ++ show (arrecadado atendimentos))
```

Saída esperada:

```
--- Atendimentos do dia ---
Deus do Rio - Banho de ervas - NaFila
Sem Rosto - Banho simples - NoBanho
Deus Rabanete - Banho de vapor - NaFila
Arrecadado: R$ 0.0
--- Depois de concluir alguns ---
Deus do Rio - Banho de ervas - Concluido
Sem Rosto - Banho simples - NoBanho
Deus Rabanete - Banho de vapor - Concluido
Arrecadado: R$ 200.0
--- Lista original ---
Deus do Rio - Banho de ervas - NaFila
Sem Rosto - Banho simples - NoBanho
Deus Rabanete - Banho de vapor - NaFila
Arrecadado: R$ 0.0
```

Toda vez que o GHC reclama de `No instance for (...)`, ele está avisando que falta incluir o `deriving` correspondente na declaração do tipo (`Show`, `Eq`, `Ord`, etc.).

---

## 3. Relatório de Aprendizado

### Como a resposta me ajudou (ou falhou em me ajudar) na solução do problema:

A resposta foi direta e resolveu os dois erros de uma vez com uma única linha de mudança. E, ainda, a explicação foi empática (acho engraçado às vezes o rumo que a IA tá tomando) ajudou a não desanimar diante de tanto erro do compilador.

### De que forma ela solucionou a minha dúvida:

Entendi que tipos customizados em Haskell não herdam automaticamente comportamentos como conversão para texto (`Show`) ou comparação de igualdade (`Eq`). É preciso declarar explicitamente com `deriving` quais dessas capacidades o tipo terá.

### O que aprendi com aquele retorno para aplicar em problemas futuros:

Aprendi que sempre que criar um `data` em Haskell e precisar usar `show` ou `==` com ele, devo adicionar `deriving (Show, Eq)` na definição. Se aparecer `No instance for (Show ...)` ou `No instance for (Eq ...)`, é sinal de que esqueci o `deriving`, e a correção é sempre nessa linha da declaração do tipo.