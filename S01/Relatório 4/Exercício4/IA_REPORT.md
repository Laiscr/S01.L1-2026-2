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

> o que é laço for infinito em go

**Resposta obtida:**

Um laço for infinito em Go (Golang) é um bloco de código que se repete sem parar porque ele não tem nenhuma condição de parada ou instrução de término na sua definição. Em Go, você cria um loop infinito simplesmente escrevendo a palavra for seguida de chaves {}, sem usar condições, contadores ou pontos e vírgulas:

```go
for {
    // Código executado para sempre
}
```

**Para que serve?**

 Ficam rodando sem parar para escutar requisições de usuários.Tarefas em segundo plano: Processos que precisam checar filas de mensagens ou dados de tempos em tempos.Controle manual de saída: Quando você decide quando sair usando um comando interno como break ou return.

**Exemplo prático**
Este código conta de 1 a 5 e usa a palavra break para parar o laço infinito:

```go
package main
import "fmt"

func main() {
    contador := 1

    for {
        fmt.Println("Contagem:", contador)
        contador++

        if contador > 5 {
            break // Interrompe o loop infinito
        }
    }
}
```
Como controlar e sair de um loop infinito em Go:
https://share.google/hyVU5Q43jWRqFGOm4

Gostaria de ver um exemplo de como usar um for infinito com canais (channels) em uma aplicação concorrente em Go?

---

## 3. Relatório de Aprendizado

### Como a resposta me ajudou (ou falhou em me ajudar) na solução do problema:

Ajudou bastante a entender que em Go não precisa de nada mirabolante como while(true) pra fazer um loop contínuo, basta usar for {}. A resposta foi direto ao ponto e tirou a impressão de que fazer um loop infinito seria mais complicado.

### De que forma ela solucionou a minha dúvida:

O exemplo prático de código foi essencial. Ver o for {} rodando com uma condição interna de break deixou claro como controlar o laço e decidir a hora certa de parar a execução sem travar o programa.

### O que aprendi com aquele retorno para aplicar em problemas futuros:

Aprendi que esse tipo de loop é super útil para tarefas que precisam rodar em segundo plano, como servidores, filas ou processos contínuos. Daqui para frente, quando precisar de um processo desse tipo em Go, sei que posso usar o for {}, sempre lembrando de colocar uma condição de saída ou controle claro para não deixar o código rodando solto.
