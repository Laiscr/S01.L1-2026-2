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

> Meu código não quer funcionar corretamente, mas eu montei de acordo!

```haskell
data Cafe = Cafe String Double Int

descrever :: Cafe -> String
descrever (Cafe nome preco _) =
  nome ++ " - R$ " ++ preco

forca :: Cafe -> String
forca (Cafe _ _ intensidade)
  | intensidade >= 8 = "Forte"
  | intensidade >= 5 = "Equilibrado"
  | otherwise        = "Suave"

precoDoPedido :: Bool -> Cafe -> Double
precoDoPedido comLeite (Cafe _ preco _) =
  if comLeite
    then preco + 2.0
    else preco

main :: IO ()
main = do
  let blueMountain = Cafe "Blue Mountain" 12.0 9
  let houseBlend   = Cafe "House Blend" 8.0 6
  let kilimanjaro  = Cafe "Kilimanjaro" 10.0 3

  putStrLn "--- Cafes do dia ---"
  putStrLn (descrever blueMountain)
  putStrLn (forca blueMountain)
  putStrLn (descrever houseBlend)
  putStrLn (forca houseBlend)
  putStrLn (descrever kilimanjaro)
  putStrLn (forca kilimanjaro)

  putStrLn "--- Preco do House Blend ---"
  print (precoDoPedido True houseBlend)
  print (precoDoPedido False houseBlend)
```

**Resposta obtida:**

O problema está na função `descrever`. Em Haskell, o operador de concatenação `(++)` só funciona entre duas listas do mesmo tipo — neste caso, duas `String`s. Como o campo `preco` foi definido como `Double`, é preciso convertê-lo para `String` usando a função `show` antes de concatenar.

O erro está nesta linha:

```haskell
descrever (Cafe nome preco _) =
  nome ++ " - R$ " ++ preco  -- preco é Double, não String
```

Código corrigido:

```haskell
data Cafe = Cafe String Double Int

descrever :: Cafe -> String
descrever (Cafe nome preco _) =
  nome ++ " - R$ " ++ show preco  -- show converte Double para String

forca :: Cafe -> String
forca (Cafe _ _ intensidade)
  | intensidade >= 8 = "Forte"
  | intensidade >= 5 = "Equilibrado"
  | otherwise        = "Suave"

precoDoPedido :: Bool -> Cafe -> Double
precoDoPedido comLeite (Cafe _ preco _) =
  if comLeite
    then preco + 2.0
    else preco

main :: IO ()
main = do
  let blueMountain = Cafe "Blue Mountain" 12.0 9
  let houseBlend   = Cafe "House Blend" 8.0 6
  let kilimanjaro  = Cafe "Kilimanjaro" 10.0 3

  putStrLn "--- Cafes do dia ---"
  putStrLn (descrever blueMountain)
  putStrLn (forca blueMountain)
  putStrLn (descrever houseBlend)
  putStrLn (forca houseBlend)
  putStrLn (descrever kilimanjaro)
  putStrLn (forca kilimanjaro)

  putStrLn "--- Preco do House Blend ---"
  print (precoDoPedido True houseBlend)
  print (precoDoPedido False houseBlend)
```

Saída esperada:

```
--- Cafes do dia ---
Blue Mountain - R$ 12.0
Forte
House Blend - R$ 8.0
Equilibrado
Kilimanjaro - R$ 10.0
Suave
--- Preco do House Blend ---
10.0
8.0
```

---

## 3. Relatório de Aprendizado

### Como a resposta me ajudou (ou falhou em me ajudar) na solução do problema:

A resposta foi direta e resolveu o problema rapidamente. O código estava estruturalmente correto e o erro era pontual e fácil de corrigir com a dica certa.

### De que forma ela solucionou a minha dúvida:

Explicou que o operador `(++)` em Haskell só concatena valores do mesmo tipo, e que `preco` era `Double`, não `String` (falta de atenção minha :p). A solução foi usar `show preco` para converter o número antes de concatenar.

### O que aprendi com aquele retorno para aplicar em problemas futuros:

Aprendi que em Haskell não há conversão implícita de tipos, então se precisar concatenar um número a uma string, é necessário usar `show` explicitamente. Em outros contextos com tipos diferentes, sempre é bom verificar se a operação espera o mesmo tipo dos dois lados.