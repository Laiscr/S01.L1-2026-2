public class Alienigena implements Sobrenatural
{
    private String nome;

    public Alienigena(String nome)
    {
        this.nome = nome;
    }

    @Override
    public void manifestar()
    {
        System.out.println("O alienigena " + nome + " desce em um disco voador e paralisa tudo ao redor!");
    }
}