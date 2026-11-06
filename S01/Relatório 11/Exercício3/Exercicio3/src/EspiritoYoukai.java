public class EspiritoYoukai implements Sobrenatural
{
    private String nome;

    public EspiritoYoukai(String nome)
    {
        this.nome = nome;
    }

    @Override
    public void manifestar()
    {
        System.out.println("O espirito " + nome + " surge correndo em alta velocidade e assombra o local!");
    }
}