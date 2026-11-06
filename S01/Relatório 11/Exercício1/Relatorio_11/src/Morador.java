public abstract class Morador
{
    private String nome;

    public Morador(String nome)
    {
        this.nome = nome;
    }

    public String getNome()
    {
        return nome;
    }

    public abstract void apresentar();
}