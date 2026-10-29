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

> Revisei tudo e parecia certo, mas não roda. Por que? E uma dúvida: o dinamismo do JS é o que permite criar um array vazio no início, ou o código de alguma forma "sabe" que vai ser preenchido depois?
> Erro: `SyntaxError: Private field '#funcionarios' must be declared in an enclosing class`

```javascript
// COMPOSICAO: a FichaDeCriatura eh criada dentro do DiarioMisterioso e so existe nele
// AGREGACAO: os Funcionarios existem antes da CabanaDoMisterio e continuam existindo fora dela

class FichaDeCriatura
{
    constructor(criatura, nivelDePerigo)
    {
        this.criatura = criatura;
        this.nivelDePerigo = nivelDePerigo;
    }

    descrever()
    {
        return `${this.criatura} | Nivel de perigo: ${this.nivelDePerigo}`;
    }
}

class DiarioMisterioso
{
    #fichas = [];

    constructor(numero)
    {
        this.numero = numero;
    }

    anotar(criatura, nivelDePerigo)
    {
        const ficha = new FichaDeCriatura(criatura, nivelDePerigo);
        this.#fichas.push(ficha);
    }

    exibirFichas()
    {
        console.log(`\n--- Diario ${this.numero} ---`);
        this.#fichas.forEach(ficha => console.log(ficha.descrever()));
    }
}

class Funcionario
{
    constructor(nome, cargo)
    {
        this.nome = nome;
        this.cargo = cargo;
    }
}

class CabanaDoMisterio
{
    #funcionarios = [];

    constructor(dono)
    {
        this.dono = dono;
    }

    contratar(funcionario)
    {
        this.#funcionarios.push(funcionario);
    }

    abrirAsPortas()
    {
        console.log(`\nCabana do Misterio - Dono: ${this.dono}`);
        this.#funcionarios.forEach(funcionario => console.log(`  ${funcionario.nome} - ${funcionario.cargo}`));
    }
}

const diario = new DiarioMisterioso(3);
diario.anotar('Gnomo', 'Baixo');
diario.anotar('Gideon Gleeful', 'Alto');
diario.anotar('Bill Cipher', 'Extremo');
diario.exibirFichas();

const wendy = new Funcionario('Wendy Corduroy', 'Atendente');
const soos = new Funcionario('Soos Ramirez', 'Faz-tudo');

const cabana = new CabanaDoMisterio('Stan Pines');
cabana.contratar(wendy);
cabana.contratar(soos);
cabana.abrirAsPortas();

console.log(cabana.#funcionarios.length); // ← linha que causou o erro
```

**Resposta obtida:**

O erro acontece por causa da última linha: `console.log(cabana.#funcionarios.length)`.

Atributos que começam com `#` no JavaScript são **campos privados** da classe. Eles só podem ser acessados de dentro dos métodos da própria classe. Tentar acessar `#funcionarios` fora da classe lança um `SyntaxError`.

**Como resolver:** criar um método getter dentro da classe para expor a informação com segurança:

```javascript
get totalFuncionarios()
{
    return this.#funcionarios.length;
}

// Do lado de fora:
console.log(cabana.totalFuncionarios); // ✅ Funciona
```

**Respondendo à dúvida sobre o dinamismo do JavaScript:**

É o dinamismo de tipos e de estruturas de dados. Diferente de linguagens como C, um array em JavaScript é de tamanho dinâmico — quando você faz `#funcionarios = []`, cria uma lista vazia de tamanho 0. O JS não "prevê o futuro"; quando você chama `.push(item)`, ele redimensiona a estrutura internamente em tempo de execução.

Os comentários de composição e agregação no topo do código estão corretos: no Diário (composição) as fichas são criadas e gerenciadas dentro da classe; na Cabana (agregação) os objetos `wendy` e `soos` já existiam antes e foram apenas passados como referência.

---

### Prompt 2

**Pergunta enviada à IA:**

> Não entendi onde corrigir e por quê.

**Resposta obtida:**

O problema está na **última linha do seu código**:

```javascript
console.log(cabana.#funcionarios.length); // ❌ ERRO AQUI
```

O símbolo `#` define que a propriedade é estritamente privada — nada fora das chaves `{ }` da classe `CabanaDoMisterio` pode acessar `#funcionarios`. Por isso o Node.js nem consegue rodar o programa.

**Opção A — criar um método dentro da classe (prática correta em POO):**

```javascript
obterQuantidadeDeFuncionarios()
{
    return this.#funcionarios.length;
}

// No final do arquivo:
console.log(cabana.obterQuantidadeDeFuncionarios()); // Imprime: 2
```

**Opção B — apagar a linha** se ela foi só um teste e não é necessária para o exercício.

---

## 3. Relatório de Aprendizado

### Como a resposta me ajudou (ou falhou em me ajudar) na solução do problema:

A primeira resposta resolveu o erro e ainda respondeu minha dúvida sobre arrays dinâmicos. A segunda foi necessária porque não ficou claro de imediato onde exatamente estava o problema no código, mas depois de apontar a linha específica ficou bem mais fácil de entender.

### De que forma ela solucionou a minha dúvida:

Explicou que campos com `#` em JavaScript são privados e só acessíveis de dentro da própria classe. A tentativa de ler `cabana.#funcionarios` fora da classe gerava um `SyntaxError`, e a solução foi criar um método que exponha essa informação de forma controlada.

### O que aprendi com aquele retorno para aplicar em problemas futuros:

Aprendi que campos privados com `#` em JavaScript têm encapsulamento rígido, ao contrário de outras linguagens onde o privado é mais uma convenção. Se precisar expor uma informação privada, o caminho certo é criar um método ou getter dentro da classe. Também entendi que arrays em JS são dinâmicos por natureza, sem precisar definir tamanho inicial.