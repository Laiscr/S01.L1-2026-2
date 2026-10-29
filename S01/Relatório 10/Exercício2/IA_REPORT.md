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

> Não estou entendendo o motivo deste erro:
> `ReferenceError: Must call super constructor in derived class before accessing 'this'`

```javascript
class Pistola
{
    constructor(modelo)
    {
        this.modelo = modelo;
    }
}

class AgenteProtocolo
{
    #pistola;

    constructor(codinome, modeloDaPistola)
    {
        this.codinome = codinome;
        this.#pistola = new Pistola(modeloDaPistola);
    }

    usarHabilidade()
    {
        throw new Error(`O agente ${this.codinome} deve implementar usarHabilidade()`);
    }

    entrarEmCombate()
    {
        console.log(`${this.codinome} entra em combate com a ${this.#pistola.modelo}.`);
        console.log(`  ${this.usarHabilidade()}`);
    }
}

class Controlador extends AgenteProtocolo
{
    usarHabilidade()
    {
        return 'Lanca uma cortina de fumaca para bloquear a visao inimiga.';
    }
}

class Iniciador extends AgenteProtocolo
{
    usarHabilidade()
    {
        return 'Dispara um dardo revelador que marca a posicao dos inimigos.';
    }
}

class Duelista extends AgenteProtocolo
{
    constructor(codinome)
    {
        this.codinome = codinome;
    }

    usarHabilidade()
    {
        return 'Avanca com um dash rapido e entra no duelo.';
    }
}

class Esquadrao
{
    #agentes;

    constructor(nome, agentes)
    {
        this.nome = nome;
        this.#agentes = agentes;
    }

    iniciarPartida()
    {
        console.log(`\n--- Esquadrao ${this.nome} ---`);
        this.#agentes.forEach(agente => agente.entrarEmCombate());
    }

    listarControladores()
    {
        return this.#agentes.filter(agente => agente instanceof Controlador);
    }
}

const omen = new Controlador('Omen', 'Ghost');
const brimstone = new Controlador('Brimstone', 'Sheriff');
const sova = new Iniciador('Sova', 'Classic');
const jett = new Duelista('Jett');

const esquadrao = new Esquadrao('Alpha', [omen, brimstone, sova, jett]);
esquadrao.iniciarPartida();

console.log('\nControladores:');
esquadrao.listarControladores().forEach(controlador => console.log(`- ${controlador.codinome}`));
```

**Resposta obtida:**

O erro acontece porque a classe `Duelista` herda de `AgenteProtocolo` (`extends AgenteProtocolo`), mas define um `constructor` próprio sem chamar `super()` primeiro.

Em JavaScript, quando uma classe filha redefine o construtor, ela **deve** chamar `super()` antes de usar o `this`. O `super()` executa o construtor da classe pai para inicializar a estrutura corretamente.

O problema está aqui:

```javascript
class Duelista extends AgenteProtocolo
{
    constructor(codinome)
    {
        this.codinome = codinome; // ❌ Erro: 'this' não pode ser usado sem super()
    }
}
```

Como corrigir — chamar `super()` antes de usar `this`:

```javascript
class Duelista extends AgenteProtocolo
{
    constructor(codinome, modeloDaPistola = 'Frenzy')
    {
        super(codinome, modeloDaPistola); // ✅ Inicializa o AgenteProtocolo primeiro
    }

    usarHabilidade()
    {
        return 'Avanca com um dash rapido e entra no duelo.';
    }
}
```

---

### Prompt 2

**Pergunta enviada à IA:**

> Estou verificando se o exercício faz sentido com o enunciado. Ele diz para criar as classes filhas **sem constructor próprio**. Qual outra forma você sugere para corrigir, já que estava dando erro?

**Resposta obtida:**

Se o enunciado exige que as classes filhas não tenham `constructor` próprio, a classe `Duelista` estava violando essa regra ao declarar um `constructor(codinome)`. A forma correta é **remover completamente o constructor da `Duelista`** — quando uma classe filha não declara um `constructor`, o JavaScript usa automaticamente o da classe pai.

```javascript
class Duelista extends AgenteProtocolo
{
    usarHabilidade()
    {
        return 'Avanca com um dash rapido e entra no duelo.';
    }
}
```

Como a `Duelista` passa a herdar o construtor de `AgenteProtocolo(codinome, modeloDaPistola)`, você deve passar os dois parâmetros na criação do objeto:

```javascript
// Antes (faltava a arma):
const jett = new Duelista('Jett');

// Correto:
const jett = new Duelista('Jett', 'Sheriff');
```

Assim você atende 100% ao enunciado e o código roda sem erros.

---

## 3. Relatório de Aprendizado

### Como a resposta me ajudou (ou falhou em me ajudar) na solução do problema:

A primeira resposta resolveu meu erro técnico, mas sugeriu uma solução que ia contra o enunciado. Precisei questionar no Prompt 2 para chegar à correção certa, que era remover o `constructor` da `Duelista`. No geral foi útil, mas confirmou que vale sempre checar se a solução proposta bate com o que foi pedido.

### De que forma ela solucionou a minha dúvida:

Me explicou que, em JavaScript, uma classe filha que redefine o `constructor` obrigatoriamente precisa chamar `super()` antes de usar `this`. E que, quando o `constructor` é removido, o da classe pai é herdado automaticamente, o que era exatamente o que o exercício pedia.

### O que aprendi com aquele retorno para aplicar em problemas futuros:

Aprendi que `super()` é obrigatório no `constructor` de qualquer classe filha em JavaScript. Também aprendi que, quando a classe filha não precisa de lógica extra no construtor, o mais limpo é simplesmente não declarar um, e o JavaScript cuida do resto.