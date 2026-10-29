// COMPOSICAO: a FichaDeCriatura eh criada dentro do DiarioMisterioso e so existe nele
// AGREGACAO: os Funcionario existem antes da CabanaDoMisterio e continuam existindo fora dela
//meu desenho favorito :D
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

    /*obterQuantidadeDeFuncionarios()
    {
        return this.#funcionarios.length;
    }*/

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

//console.log(cabana.obterQuantidadeDeFuncionarios()); preferi deixar comentado porque não corrigi a toa :]
//mesmo o enunciado não pedindo o print