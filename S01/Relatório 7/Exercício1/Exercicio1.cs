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
        CombatenteDeGondor c1 = new CombatenteDeGondor("Boromir", "Gondor", "Capitao");
        CombatenteDeGondor c2 = new CombatenteDeGondor("Faramir", "Gondor", "Tenente");
        CombatenteDeGondor c3 = new CombatenteDeGondor("Beregond", "Gondor", "Soldado");

        c1.Equipar("Espada e Escudo");

        c1.ApresentarUnidade();
        c2.ApresentarUnidade();
        c3.ApresentarUnidade();
    }
}