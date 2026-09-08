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

> como contar caracteres de string em go

**Resposta obtida:**

Para contar caracteres de uma string em Go, use a função `utf8.RuneCountInString` para contar runas reais ou a função `len()` para contar bytes.

**Usando `utf8.RuneCountInString` (recomendado para caracteres especiais)**

A função `utf8.RuneCountInString` do pacote `unicode/utf8` conta o número real de caracteres (runas), mesmo que a string possua acentos ou emojis.

```go
package main

import (
    "fmt"
    "unicode/utf8"
)

func main() {
    texto := "Olá, mundo!"
    tamanho := utf8.RuneCountInString(texto)
    fmt.Println(tamanho) // Retorna 14
}
```

**Usando `len()` (para contar bytes)**

A função nativa `len()` retorna a quantidade de bytes da string. Funciona bem para textos simples sem acentos (ASCII), mas pode retornar um valor incorreto se houver caracteres com múltiplos bytes.

```go
package main

import "fmt"

func main() {
    texto := "Golang"
    tamanho := len(texto)
    fmt.Println(tamanho) // Retorna 6
}
```
Veja uma aula prática sobre como contar elementos e tamanho de strings:
https://share.google/oUq79BxapCbOZMwxr

Se precisar, me diga se o seu texto usa acentos ou emojis para escolhermos a melhor abordagem de contagem.

---

## 3. Relatório de Aprendizado

### Como a resposta me ajudou (ou falhou em me ajudar) na solução do problema:

A resposta foi bem direta e economizou bastante tempo, pois me mostrou de imediato que em Go a forma de medir o tamanho de um texto depende do que você realmente precisa contar: bytes ou caracteres visíveis.

### De que forma ela solucionou a minha dúvida:

Solucionou trazendo dois exemplos práticos de código com abordagens diferentes. O `len()` serviu perfeitamente para o caso mais simples, mas a explicação deixou bem claro por que o **`utf8.RuneCountInString`** é a opção correta quando lidamos com acentos e caracteres especiais.

### O que aprendi com aquele retorno para aplicar em problemas futuros:

Aprendi a diferença prática entre contar bytes e caracteres Unicode em Go. Em projetos futuros, como na validação de campos de texto (senhas, CPF, nomes), sei que preciso ter cuidado: se o texto puder conter acentuação ou símbolos, devo usar o pacote utf8 para evitar contagens erradas e bugs de validação.
