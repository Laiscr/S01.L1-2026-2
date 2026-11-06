public abstract class Monstro
{
    private String nome;

    public Monstro(String nome)
    {
        this.nome = nome;
    }

    public String getNome()
    {
        return nome;
    }

    public abstract String receita();
}