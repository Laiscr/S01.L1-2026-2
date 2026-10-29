class Pokemon
{
    #vida;

    constructor(apelido, tipo, vidaInicial)
    {
        this.apelido = apelido;
        this.tipo = tipo;
        this.#vida = vidaInicial;
    }

    get vida()
    {
        return this.#vida;
    }

    sofrerDano(pontos)
    {
        this.#vida = this.#vida - pontos;
        if (this.#vida < 0)
        {
            this.#vida = 0;
        }
        console.log(`${this.apelido} sofreu ${pontos} de dano. Vida restante: ${this.#vida}`);
    }

    atacar(alvo)
    {
        console.log(`${this.apelido} usa um ataque generico em ${alvo.apelido}!`);
        alvo.sofrerDano(10);
    }
}

class Squirtle extends Pokemon
{
    constructor(apelido, vidaInicial)
    {
        super(apelido, 'Agua', vidaInicial);
    }

    atacar(alvo)
    {
        console.log(`${this.apelido} usa Jato d'Agua em ${alvo.apelido}!`);
        alvo.sofrerDano(20);
    }
}

class Bulbasaur extends Pokemon
{
    constructor(apelido, vidaInicial)
    {
        super(apelido, 'Planta', vidaInicial);
    }

    atacar(alvo)
    {
        console.log(`${this.apelido} usa Folha Navalha em ${alvo.apelido}!`);
        alvo.sofrerDano(15);
    }
}

const squirtle = new Squirtle('Bolha', 50);
const bulbasaur = new Bulbasaur('Broto', 30);

bulbasaur.atacar(squirtle);
squirtle.atacar(bulbasaur);
squirtle.atacar(bulbasaur);

console.log(`\nVida do ${squirtle.apelido}: ${squirtle.vida}`);
console.log(`Vida do ${bulbasaur.apelido}: ${bulbasaur.vida}`);

// console.log(squirtle.#vida);  // erro: atributo privado, nao eh acessivel fora da classe