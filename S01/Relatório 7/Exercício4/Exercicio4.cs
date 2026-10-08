using System;
using System.Collections.Generic;

public class EntidadeCosmica
{
    public string Nome { get; set; }
    public string Origem { get; set; } = "Desconhecida";

    public virtual void Manifestar()
    {
        Console.WriteLine($"\n{Nome} se manifesta!");
        if (Origem != "Desconhecida")
        {
            Console.WriteLine($"Origem: {Origem}");
        }
    }
}

public class Profundo : EntidadeCosmica
{
    public override void Manifestar()
    {
        Console.WriteLine($"\n{Nome} emerge das profundezas abissais!");
    }
}

public class MiGo : EntidadeCosmica
{
    public override void Manifestar()
    {
        base.Manifestar();
        Console.WriteLine($"{Nome} sussurra segredos proibidos.");
    }
}

public class Pesquisador
{
    public string Nome { get; set; }
    private List<EntidadeCosmica> _catalogo;

    public Pesquisador(string nome)
    {
        this.Nome = nome;
        this._catalogo = new List<EntidadeCosmica>();
    }

    public void Catalogar(EntidadeCosmica entid)
    {
        _catalogo.Add(entid);
    }

    public void LerCatalogo()
    {
        Console.WriteLine($"\nCatalogo do pesquisador {Nome}:");
        foreach (var entid in _catalogo)
        {
            entid.Manifestar();
        }
    }
}

public class Program
{
    public static void Main(string[] args)
    {
        EntidadeCosmica dagon = new EntidadeCosmica();
        dagon.Nome = "Dagon";
        dagon.Origem = "Mar Profundo";

        Profundo cthulhu = new Profundo();
        cthulhu.Nome = "Cthulhu";

        MiGo fungo = new MiGo();
        fungo.Nome = "Fungo de Yuggoth";
        fungo.Origem = "Yuggoth";

        Pesquisador pesquisador = new Pesquisador("Armitage");
        pesquisador.Catalogar(dagon);
        pesquisador.Catalogar(cthulhu);
        pesquisador.Catalogar(fungo);

        pesquisador.LerCatalogo();
    }
}