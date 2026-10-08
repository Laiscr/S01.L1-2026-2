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

> Meu código não funciona e não encontro o erro.

```csharp
using System;

public class CombatenteDeGondor
{
    public string Nome { get; private set; }
    public string Povo { get; private set; }
    public string Posto { get; private set; }
    public string Armamento { get; private set; } = "Desarmado";

    public CombatenteDeGondor(string nome, string povo)
    {
        this.Nome = nome;
        this.Povo = povo;
    }

    public void Equipar(string arma)
    {
        this.Armamento = arma;
    }

    public void ApresentarUnidade()
    {
        Console.WriteLine($"\nNome: {Nome} | Povo: {Povo} | Posto: {Posto}");
        if (Armamento != "Desarmado")
        {
            Console.WriteLine($"Armamento: {Armamento}");
        }
    }
}

public class Program
{
    public static void Main(string[] args)
    {
        CombatenteDeGondor c1 = new CombatenteDeGondor("Boromir", "Gondor", "Capitao");
        CombatenteDeGondor c2 = new CombatenteDeGondor("Faramir", "Gondor", "Tenente");
        CombatenteDeGondor c3 = new CombatenteDeGondor("Beregond", "Gondor", "Soldado");

        c1.Equipar("Espada e Escudo");

        c1.ApresentarUnidade();
        c2.ApresentarUnidade();
        c3.ApresentarUnidade();
    }
}
```

**Resposta obtida:**

O erro ocorre no método `Main`, na linha em que você tenta instanciar os objetos passando **três parâmetros** (como `"Capitao"`, `"Tenente"` e `"Soldado"`):

```csharp
CombatenteDeGondor c1 = new CombatenteDeGondor("Boromir", "Gondor", "Capitao");
```

Porém, o construtor da classe foi definido para aceitar apenas **dois parâmetros**:

```csharp
public CombatenteDeGondor(string nome, string povo)
{
    this.Nome = nome;
    this.Povo = povo;
}
```

Isso gera o erro de compilação: `CS1729: 'CombatenteDeGondor' não contém um construtor que aceita 3 argumentos`.

**Como corrigir — Opção recomendada:** atualizar o construtor para receber o `Posto` também:

```csharp
public CombatenteDeGondor(string nome, string povo, string posto)
{
    this.Nome = nome;
    this.Povo = povo;
    this.Posto = posto;
}
```

Código completo corrigido:

```csharp
using System;

public class CombatenteDeGondor
{
    public string Nome { get; private set; }
    public string Povo { get; private set; }
    public string Posto { get; private set; }
    public string Armamento { get; private set; } = "Desarmado";

    public CombatenteDeGondor(string nome, string povo, string posto)
    {
        this.Nome = nome;
        this.Povo = povo;
        this.Posto = posto;
    }

    public void Equipar(string arma)
    {
        this.Armamento = arma;
    }

    public void ApresentarUnidade()
    {
        Console.WriteLine($"\nNome: {Nome} | Povo: {Povo} | Posto: {Posto}");
        if (Armamento != "Desarmado")
        {
            Console.WriteLine($"Armamento: {Armamento}");
        }
    }
}

public class Program
{
    public static void Main(string[] args)
    {
        CombatenteDeGondor c1 = new CombatenteDeGondor("Boromir", "Gondor", "Capitão");
        CombatenteDeGondor c2 = new CombatenteDeGondor("Faramir", "Gondor", "Tenente");
        CombatenteDeGondor c3 = new CombatenteDeGondor("Beregond", "Gondor", "Soldado");

        c1.Equipar("Espada e Escudo");

        c1.ApresentarUnidade();
        c2.ApresentarUnidade();
        c3.ApresentarUnidade();
    }
}
```

---

## 3. Relatório de Aprendizado

### Como a resposta me ajudou (ou falhou em me ajudar) na solução do problema:

A resposta foi útil e direta, porque identificou exatamente onde estava o meu erro e explicou o motivo. Então, o código rodou corretamente após a correção indicada.

### De que forma ela solucionou a minha dúvida:

Mostrou que o construtor precisava receber o parâmetro `posto` para que os três argumentos passados no `Main` fossem aceitos, e apresentou duas formas de corrigir isso.

### O que aprendi com aquele retorno para aplicar em problemas futuros:

Aprendi que o número de parâmetros passados na criação de um objeto precisa bater exatamente com o que o construtor espera. Em problemas futuros, quando o código não compilar, verificar a assinatura do construtor é um bom ponto de partida.