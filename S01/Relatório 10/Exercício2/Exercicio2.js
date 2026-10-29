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
const jett = new Duelista('Jett', 'Sheriff');

const esquadrao = new Esquadrao('Alpha', [omen, brimstone, sova, jett]);
esquadrao.iniciarPartida();

console.log('\nControladores:');
esquadrao.listarControladores().forEach(controlador => console.log(`- ${controlador.codinome}`));

const agenteGenerico = new AgenteProtocolo('Recruta', 'Frenzy');
// agenteGenerico.entrarEmCombate();