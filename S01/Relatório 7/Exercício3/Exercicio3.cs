using System;
using System.Collections.Generic;

public class Grimorio
{
    public string FeiticoFavorito { get; set; } = "Nenhum";

    public void Abrir()
    {
        Console.WriteLine($"Grimorio aberto. Feitico favorito: {FeiticoFavorito}");
    }
}

public class Companheiro
{
    public string Nome { get; set; }
    public string Funcao { get; set; }

    public void Apresentar()
    {
        Console.WriteLine($"Companheiro: {Nome} | Funcao: {Funcao}");
    }
}

public class Maga
{
    public string Nome { get; set; }

    public Grimorio Grimorio { get; set; }

    private List<Companheiro> _companheiros;

    public Maga(string nome)
    {
        this.Nome = nome;
        this.Grimorio = new Grimorio();
        this._companheiros = new List<Companheiro>();
    }

    public void Recrutar(Companheiro c)
    {
        _companheiros.Add(c);
    }

    public void MostrarGrupo()
    {
        Console.WriteLine($"\nMaga: {Nome}");
        foreach (var c in _companheiros)
        {
            c.Apresentar();
        }
    }
}

public class Program
{
    public static void Main(string[] args)
    {
        Companheiro c1 = new Companheiro();
        c1.Nome = "Fern";
        c1.Funcao = "Aprendiz de magia";

        Companheiro c2 = new Companheiro();
        c2.Nome = "Stark";
        c2.Funcao = "Guerreiro";

        Maga frieren = new Maga("Frieren");
        frieren.Recrutar(c1);
        frieren.Recrutar(c2);
        frieren.Grimorio.FeiticoFavorito = "Zoltraak";

        frieren.MostrarGrupo();
        frieren.Grimorio.Abrir();
    }
}

//Composicao: o Grimorio eh criado dentro do construtor da Maga
//ele nasce e morre junto com ela, mas não existe sem ela (romantico, achei)

//Agregação: os Companheiro (Fern e Stark) foram criados fora da Maga e passados para ela
//eles existem independente da Maga, apenas sendo referenciados por ela (nao tao romantico...)