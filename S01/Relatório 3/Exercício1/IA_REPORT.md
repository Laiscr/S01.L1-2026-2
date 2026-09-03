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

> Meu código dá texto infinito de placa inválida, por que? Parece correto.

```rust
use std::io;

fn validar_placa(placa: &str) -> bool 
{
    if placa.len() < 7 
    {
        return false;
    }

    let mut maiusculas = 0;
    let mut numeros = 0;

    for c in placa.chars() 
    {
        if c.is_ascii_uppercase() 
        {
            maiusculas += 1;
        }
        if c.is_numeric() 
        {
            numeros += 1;
        }
    }

    maiusculas >= 4 && numeros >= 2
}

fn main() 
{
    loop 
    {
        let mut entrada = String::new();
        println!("Digite a placa do veiculo:");
        io::stdin().read_line(&mut entrada).expect("Erro ao ler");

        let placa = entrada.trim();

        if validar_placa(placa) 
        {
            println!("Placa cadastrada no sistema!");
            break;
        } 
        else 
        {
            println!("Placa invalida. Tente novamente!");
        }
    }
}
```

**Resposta obtida:**

O loop infinito acontece por um destes dois motivos comuns, dependendo de como o programa está sendo executado e do que está sendo digitado:

**1. Formato da placa informada**

A condição final exige pelo menos **4 letras maiúsculas** e **2 números**:

```rust
maiusculas >= 4 && numeros >= 2
```

- **Placa tradicional (ex: `ABC1234`):** Possui apenas 3 letras maiúsculas. O teste `maiusculas >= 4` falha sempre.
- **Placa Mercosul (ex: `BRA2E19`):** Possui 4 letras maiúsculas e 3 números, passando na regra.
- **Letras minúsculas (ex: `bra2e19`):** O método `is_ascii_uppercase()` retorna `false` para minúsculas, resultando em 0 maiúsculas e falha na validação.

**2. Entrada via redirecionamento ou EOF (End of File)**

Se você estiver executando o código em um ambiente online (como Rust Playground sem entrada interativa configurada):

- Quando a entrada chega ao fim (EOF), `io::stdin().read_line()` lê 0 bytes e retorna sem esperar digitação.
- A variável `entrada` fica vazia `""`, o `validar_placa` falha e o `loop` repete instantaneamente para sempre.

**Como corrigir:** Para aceitar tanto o padrão antigo quanto o Mercosul, converter minúsculas para maiúsculas e tratar o encerramento do leitor:

```rust
use std::io;

fn validar_placa(placa: &str) -> bool {
    let limpa: String = placa
        .chars()
        .filter(|c| c.is_ascii_alphanumeric())
        .collect();

    if limpa.len() != 7 {
        return false;
    }

    let maiusculas = limpa.chars().filter(|c| c.is_ascii_uppercase()).count();
    let numeros = limpa.chars().filter(|c| c.is_ascii_digit()).count();

    // Padrão antigo: 3 letras e 4 números
    // Padrão Mercosul: 4 letras e 3 números
    (maiusculas == 3 && numeros == 4) || (maiusculas == 4 && numeros == 3)
}

fn main() {
    loop {
        let mut entrada = String::new();
        println!("Digite a placa do veiculo:");

        let bytes_lidos = io::stdin().read_line(&mut entrada).expect("Erro ao ler");

        if bytes_lidos == 0 {
            println!("Entrada encerrada.");
            break;
        }

        let placa = entrada.trim().to_ascii_uppercase();

        if validar_placa(&placa) {
            println!("Placa cadastrada no sistema!");
            break;
        } else {
            println!("Placa invalida. Tente novamente!");
        }
    }
}
```

---

### Prompt 2

**Pergunta enviada à IA:**

> Crie uma função chamada `fn validar_placa(placa: &str) -> bool`. A função deve retornar true apenas se a string enviada atender a todos os seguintes critérios: ter pelo menos 7 caracteres de comprimento, conter pelo menos 4 letras maiúsculas (`c.is_ascii_uppercase()`), conter pelo menos 2 números (`c.is_numeric()`). Na main, peça ao usuário para digitar a placa de um veículo. Use a estrutura loop (com break) para continuar pedindo a placa até que a função retorne true. Quando uma placa válida for informada, exiba a mensagem "Placa cadastrada no sistema!" e saia do laço. O exercício diz que deve conter pelo menos 4 letras, mas nem o valor de entrada oferecido dá certo, então talvez seja erro de formato? Se eu trocar minha entrada de maiúsculas de `>=4` por `>=3` deve resolver, não?

**Resposta obtida:**

Sim, a sua observação está certíssima! O enunciado do exercício tem uma contradição evidente entre o texto da regra e o exemplo de execução:

- **Pelo texto:** Exige pelo menos **4** maiúsculas (`maiusculas >= 4`).
- **Pelo exemplo:** Aceita `ABC1234`, que tem exatamente **3** maiúsculas (`A`, `B`, `C`) e 4 números.

Alterar para **`maiusculas >= 3`** resolve a divergência e faz o código bater exatamente com o exemplo fornecido:

```rust
use std::io;

fn validar_placa(placa: &str) -> bool {
    if placa.len() < 7 {
        return false;
    }

    let mut maiusculas = 0;
    let mut numeros = 0;

    for c in placa.chars() {
        if c.is_ascii_uppercase() {
            maiusculas += 1;
        }
        if c.is_numeric() {
            numeros += 1;
        }
    }

    // Ajustado para >= 3 para permitir o exemplo "ABC1234"
    maiusculas >= 3 && numeros >= 2
}

fn main() {
    loop {
        let mut entrada = String::new();
        println!("Digite a placa do veiculo:");

        io::stdin()
            .read_line(&mut entrada)
            .expect("Erro ao ler");

        let placa = entrada.trim();

        if validar_placa(placa) {
            println!("Placa cadastrada no sistema!");
            break;
        } else {
            println!("Placa invalida. Tente novamente!");
        }
    }
}
```

---

### Prompt 3

**Pergunta enviada à IA:**

> Porém se testo com abc1234 dá erro e fica com "placa invalida infinita". Por que? (estou usando o OneCompiler)

**Resposta obtida:**

O OneCompiler não possui um terminal interativo em tempo real. Ele funciona com **execução em lote (batch)** usando a caixa **STDIN**, e isso causa exatamente esse problema por dois motivos:

**1. Letras minúsculas não passam no teste**

Quando você testa com `abc1234`: a validação usa `c.is_ascii_uppercase()`, e como `a`, `b` e `c` são minúsculas, a variável `maiusculas` termina valendo **0**. O teste `maiusculas >= 3` falha e a placa é considerada inválida.

**2. O que causa a repetição infinita no OneCompiler**

1. O programa lê `abc1234`, valida, falha e imprime `"Placa invalida. Tente novamente!"`.
2. O `loop` reinicia e chama `read_line` novamente.
3. **O STDIN já acabou (EOF).** Em vez de travar esperando digitação, o Rust lê `0 bytes` e continua imediatamente.
4. A variável `entrada` fica vazia, a validação falha de novo, e o laço roda para sempre até o servidor abortar por timeout.

**Como resolver:** trate o fim da entrada (EOF) — se `read_line` retornar `0` bytes lidos, encerre o laço:

```rust
use std::io;

fn validar_placa(placa: &str) -> bool {
    if placa.len() < 7 {
        return false;
    }

    let mut maiusculas = 0;
    let mut numeros = 0;

    for c in placa.chars() {
        if c.is_ascii_uppercase() {
            maiusculas += 1;
        }
        if c.is_numeric() {
            numeros += 1;
        }
    }

    maiusculas >= 3 && numeros >= 2
}

fn main() {
    loop {
        let mut entrada = String::new();
        println!("Digite a placa do veiculo:");

        let bytes = io::stdin()
            .read_line(&mut entrada)
            .expect("Erro ao ler");

        if bytes == 0 {
            break;
        }

        let placa = entrada.trim();

        if validar_placa(placa) {
            println!("Placa cadastrada no sistema!");
            break;
        } else {
            println!("Placa invalida. Tente novamente!");
        }
    }
}
```

Na caixa **STDIN** do OneCompiler, coloque as entradas linha por linha, terminando com uma válida em maiúsculas:

```text
abc1234
ABC1234
```

---

### Prompt 4

**Pergunta enviada à IA:**

> Funciona, mas quando testado com as letras minusculas, aparece o texto de "Digite a placa do veiculo:". Por que? Olhe o meu código atual:

```rust
use std::io;

fn validar_placa(placa: &str) -> bool 
{
    if placa.len() < 7 
    {
        return false;
    }

    let mut maiusculas = 0;
    let mut numeros = 0;

    for c in placa.chars() 
    {
        if c.is_ascii_uppercase() 
        {
            maiusculas += 1;
        }
        if c.is_numeric() 
        {
            numeros += 1;
        }
    }

    maiusculas >= 3 && numeros >= 2
}

fn main() 
{
    loop 
    {
        let mut entrada = String::new();
        println!("Digite a placa do veiculo:");

        let bytes = io::stdin().read_line(&mut entrada).expect("Erro ao ler");

        if bytes == 0 {
            break;
        }

        let placa = entrada.trim();

        if validar_placa(placa) 
        {
            println!("Placa cadastrada no sistema!");
            break;
        } 
        else 
        {
            println!("Placa invalida. Tente novamente!");
        }
    }
}
```

**Resposta obtida:**

Isso acontece por causa da **ordem dos comandos dentro do `loop`**.

Veja o que o código faz passo a passo quando você testa com `abc1234`:

1. **Primeira volta:** imprime `"Digite a placa do veiculo:"` → lê `abc1234` → valida: falha → imprime `"Placa invalida. Tente novamente!"` → volta ao topo do laço.
2. **Segunda volta:** a primeira linha do topo é `println!("Digite a placa do veiculo:")`, que é executada **antes** de tentar ler qualquer coisa. Em seguida, chama `read_line` → STDIN acabou → `bytes == 0` → `break`.

O texto `"Digite a placa do veiculo:"` foi impresso no início da segunda repetição, antes do programa descobrir que a entrada havia acabado.

**Como corrigir:** mover o primeiro prompt para fora do laço e só repeti-lo no bloco `else`:

```rust
use std::io;

fn validar_placa(placa: &str) -> bool {
    if placa.len() < 7 {
        return false;
    }

    let mut maiusculas = 0;
    let mut numeros = 0;

    for c in placa.chars() {
        if c.is_ascii_uppercase() {
            maiusculas += 1;
        }
        if c.is_numeric() {
            numeros += 1;
        }
    }

    maiusculas >= 3 && numeros >= 2
}

fn main() {
    println!("Digite a placa do veiculo:");

    loop {
        let mut entrada = String::new();
        let bytes = io::stdin().read_line(&mut entrada).expect("Erro ao ler");

        if bytes == 0 {
            break;
        }

        let placa = entrada.trim();

        if validar_placa(placa) {
            println!("Placa cadastrada no sistema!");
            break;
        } else {
            println!("Placa invalida. Tente novamente!");
            println!("Digite a placa do veiculo:");
        }
    }
}
```

---

### Prompt 5

**Pergunta enviada à IA:**

> Não, não é por estética isso. Ele está dentro do loop para o user digitar até que retorne true a placa. Então deve aparecer no loop, mas não quando retornar true!

**Resposta obtida:**

No seu código atual, quando a placa é válida e retorna `true`, ele **já não imprime** `"Digite a placa do veiculo:"` novamente, porque o `break` encerra o laço na hora.

O motivo de `"Digite a placa do veiculo:"` ter aparecido quando você testou com `abc1234` foi exatamente porque `abc1234` retornou **`false`**. Como a placa foi **inválida**, o laço continuou rodando para pedir de novo:

**Cenário 1 — Placa inválida (`abc1234`):**

```text
Digite a placa do veiculo:
abc1234
Placa invalida. Tente novamente!
Digite a placa do veiculo:    <-- Pede de novo porque deu FALSE
```

**Cenário 2 — Placa válida (`ABC1234`):**

```text
Digite a placa do veiculo:
ABC1234
Placa cadastrada no sistema!  <-- Dá break e NUNCA mais pede!
```

Se o enunciado esperava que o usuário pudesse digitar letras minúsculas e o sistema convertesse automaticamente, basta aplicar `.to_ascii_uppercase()` na entrada:

```rust
let placa = entrada.trim().to_ascii_uppercase();
```

Fazendo isso, mesmo digitando `abc1234`, ela vira `ABC1234`, a função retorna **`true`** e encerra sem pedir novamente.

---

## 3. Relatório de Aprendizado

### Como a resposta me ajudou (ou falhou em me ajudar) na solução do problema:

A resposta me ajudou bastante a resolver o loop infinito gerado pelo fim de arquivo (EOF) no OneCompiler e a notar que o enunciado pedia 4 maiúsculas, mas usava uma placa com 3 no exemplo. Por outro lado, falhou quando tentou mexer na ordem dos comandos só para a mensagem aparecer uma vez, em vez de me avisar logo de cara que meu código já estava certo e que a mensagem repetida era apenas o comportamento esperado para uma placa inválida.

### De que forma ela solucionou a minha dúvida:

Mostrou exatamente o que acontecia nos bastidores do compilador online quando a entrada terminava sem novos dados, indicando a checagem de `bytes == 0` para encerrar o laço. Também confirmou que, para o exemplo `ABC1234` passar, era preciso ajustar a regra de validação para pelo menos 3 maiúsculas.

### O que aprendi com aquele retorno para aplicar em problemas futuros:

Aprendi a tratar o fim de entrada em programas com repetição para não travar ferramentas online e a rastrear o fluxo do laço com mais calma antes de mudar a lógica. Também ficou claro que preciso filtrar as sugestões da IA, já que às vezes ela tenta contornar o problema pelo lado errado em vez de focar na lógica real.
