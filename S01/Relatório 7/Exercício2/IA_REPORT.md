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

> Este código dá a seguinte mensagem de erro — o que significa?
> `error CS1503: Argument #1 cannot convert 'TipoEletrico' expression to type 'TipoPlanta'`

```csharp
using System;
using System.Collections.Generic;

public class Pokemon
{
    public string Especie { get; set; }
    public int Nivel { get; set; }

    public Pokemon(string especie, int nivel)
    {
        this.Especie = especie;
        this.Nivel = nivel;
    }

    public virtual void Atacar()
    {
        Console.WriteLine($"{Especie} usa um ataque comum!");
    }
}

public class TipoPlanta : Pokemon
{
    public TipoPlanta(string especie, int nivel) : base(especie, nivel) {}

    public override void Atacar()
    {
        Console.WriteLine($"{Especie} usa Folha Navalha!");
    }
}

public class TipoEletrico : Pokemon
{
    public TipoEletrico(string especie, int nivel) : base(especie, nivel) {}

    public override void Atacar()
    {
        base.Atacar();
        Console.WriteLine($"{Especie} solta uma descarga elétrica!");
    }
}

public class Program
{
    public static void Main(string[] args)
    {
        List<TipoPlanta> time = new List<TipoPlanta>();

        time.Add(new TipoPlanta("Bulbasaur", 15));
        time.Add(new TipoEletrico("Pikachu", 20));
        time.Add(new Pokemon("Meowth", 10));

        foreach (var p in time)
        {
            p.Atacar();
            Console.WriteLine();
        }
    }
}
```

**Resposta obtida:**

O erro acontece porque a lista foi declarada especificamente para guardar apenas objetos do tipo `TipoPlanta`:

```csharp
List<TipoPlanta> time = new List<TipoPlanta>();
```

Quando você tenta adicionar um `TipoEletrico` ou um `Pokemon` genérico, o compilador avisa que não consegue converter esses tipos para `TipoPlanta`. **Na herança, a relação é "de baixo para cima":** todo `TipoPlanta` é um `Pokemon`, mas nem todo `Pokemon` é um `TipoPlanta`. Por isso, um Pikachu (`TipoEletrico`) não pode entrar em uma lista exclusiva de plantas.

**Como resolver:** altere o tipo genérico da lista para a classe pai, assim ela aceita qualquer classe que herde de `Pokemon`:

```csharp
List<Pokemon> time = new List<Pokemon>();
```

Código completo corrigido:

```csharp
using System;
using System.Collections.Generic;

public class Pokemon
{
    public string Especie { get; set; }
    public int Nivel { get; set; }

    public Pokemon(string especie, int nivel)
    {
        this.Especie = especie;
        this.Nivel = nivel;
    }

    public virtual void Atacar()
    {
        Console.WriteLine($"{Especie} usa um ataque comum!");
    }
}

public class TipoPlanta : Pokemon
{
    public TipoPlanta(string especie, int nivel) : base(especie, nivel) {}

    public override void Atacar()
    {
        Console.WriteLine($"{Especie} usa Folha Navalha!");
    }
}

public class TipoEletrico : Pokemon
{
    public TipoEletrico(string especie, int nivel) : base(especie, nivel) {}

    public override void Atacar()
    {
        base.Atacar();
        Console.WriteLine($"{Especie} solta uma descarga elétrica!");
    }
}

public class Program
{
    public static void Main(string[] args)
    {
        // Alterado de List<TipoPlanta> para List<Pokemon> para usar polimorfismo
        List<Pokemon> time = new List<Pokemon>();

        time.Add(new TipoPlanta("Bulbasaur", 15));
        time.Add(new TipoEletrico("Pikachu", 20));
        time.Add(new Pokemon("Meowth", 10));

        foreach (var p in time)
        {
            p.Atacar();
            Console.WriteLine();
        }
    }
}
```

---

### Prompt 2

**Pergunta enviada à IA:**

> Tá, me dá um exemplo mais simples pra eu entender. O código funcionou, mas não compreendi bem.

**Resposta obtida:**

Imagina que você tem uma **Caixa de Brinquedos**. Se você colar um adesivo escrito **"Apenas Carrinhos"**, só consegue colocar carrinhos lá dentro. Se tentar colocar um **Boneco** ou uma **Bola**, não vai caber — dá erro!

No C#, as classes e as listas funcionam assim:

- **`Pokemon`** é a categoria geral ("Brinquedo").
- **`TipoPlanta`** (Bulbasaur) é um tipo específico de Pokemon ("Carrinho").
- **`TipoEletrico`** (Pikachu) é outro tipo específico de Pokemon ("Bola").

Quando você escreveu `List<TipoPlanta>`, criou uma **caixa exclusiva para plantas**. Por isso o C# reclamou ao tentar colocar o Pikachu e o Meowth.

Ao mudar para `List<Pokemon>`, a caixa passa a aceitar **qualquer coisa que seja um Pokemon**:

- ✅ `TipoPlanta` (Bulbasaur) entra, porque Bulbasaur é um Pokemon.
- ✅ `TipoEletrico` (Pikachu) entra, porque Pikachu é um Pokemon.
- ✅ `Pokemon` (Meowth) entra, porque é um Pokemon.

**A regra de ouro do polimorfismo:** todo `TipoPlanta` é um `Pokemon`, mas nem todo `Pokemon` é um `TipoPlanta`. A relação sempre vai de baixo para cima na hierarquia.

---

## 3. Relatório de Aprendizado

### Como a resposta me ajudou (ou falhou em me ajudar) na solução do problema:

A primeira resposta resolveu o erro, mas ainda fiquei sem entender o conceito por trás. A segunda resposta, com o exemplo da caixa de brinquedos, foi o que realmente fez sentido pra mim... Às vezes uma analogia simples ajuda mais do que a explicação técnica.

### De que forma ela solucionou a minha dúvida:

Ficou claro que o tipo da lista precisa ser a classe pai quando quero guardar objetos de tipos diferentes que herdam dela. Mudar de `List<TipoPlanta>` para `List<Pokemon>` foi o suficiente para o código funcionar.

### O que aprendi com aquele retorno para aplicar em problemas futuros:

Aprendi que a herança funciona "de baixo para cima": uma subclasse pode ser tratada como a classe pai, mas não o contrário. Quando precisar de uma lista que aceite tipos variados dentro de uma mesma hierarquia, devo usar a classe base como tipo genérico.