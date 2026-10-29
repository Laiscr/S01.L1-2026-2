class UsuarioDeNen
{
    constructor(nome)
    {
        this.nome = nome;
    }

    atacar(alvo)
    {
        console.log(`${this.nome} dispara um golpe generico de aura contra ${alvo.nome}!`);
    }
}

class Intensificador extends UsuarioDeNen
{
    atacar(alvo)
    {
        console.log(`${this.nome} concentra toda a aura no punho e acerta ${alvo.nome} com um soco devastador!`);
    }
}

class Transmutador extends UsuarioDeNen
{
    atacar(alvo)
    {
        console.log(`${this.nome} transforma a aura em eletricidade e eletrocuta ${alvo.nome}!`);
    }
}

class Materializador extends UsuarioDeNen
{
    atacar(alvo)
    {
        console.log(`${this.nome} materializa correntes de aura e prende ${alvo.nome}!`);
    }
}

class Aranha
{
    constructor(nome, numero)
    {
        this.nome = nome;
        this.numero = numero;
    }
}

class TrupeFantasma
{
    #aranhas;

    constructor(cidade, aranhas = [])
    {
        this.cidade = cidade;
        this.#aranhas = aranhas;
    }

    revelarAranhas()
    {
        console.log(`\nTrupe Fantasma avistada em ${this.cidade}:`);
        this.#aranhas.forEach(aranha => console.log(`  #${aranha.numero} - ${aranha.nome}`));
    }

    buscarAranha(numero)
    {
        return this.#aranhas.find(aranha => aranha.numero === numero);
    }
}

const uvogin = new Aranha('Uvogin', 11);
const feitan = new Aranha('Feitan', 2);

const trupe = new TrupeFantasma('Yorknew City', [uvogin, feitan]);
trupe.revelarAranhas();

const alvoEncontrado = trupe.buscarAranha(11);

const hunters = [
    new Intensificador('Gon Freecss'),
    new Transmutador('Killua Zoldyck'),
    new Materializador('Kurapika')
];

console.log('\n--- Confronto ---');
hunters.forEach(hunter => hunter.atacar(alvoEncontrado));