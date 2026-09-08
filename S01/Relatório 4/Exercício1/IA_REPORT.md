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

---

## 3. Relatório de Aprendizado

### Como a resposta me ajudou (ou falhou em me ajudar) na solução do problema:

A resposta foi direta e muito útil, pois evitou que eu procurasse por muito tempo formass de ler o comprimento de uma string na linguagem Go.

### De que forma ela solucionou a minha dúvida:

Mostrou maneiras (com códigos de exemplo) de como usar possíveis soluções para a minha dúvida. Para mim, foi mais fácil e havia mais sentido usar o `len()`.

### O que aprendi com aquele retorno para aplicar em problemas futuros:

Aprendi as opções existentes de como ler comprimentos de caracteres em Go, o que pode ser de extrema utilidade em diversas aplicações, como para senhas ou caracteres de CPF.
