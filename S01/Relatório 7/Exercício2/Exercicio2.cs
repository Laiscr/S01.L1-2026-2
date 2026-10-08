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