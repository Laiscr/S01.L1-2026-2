public class DemonioDoFogo extends Morador
{
    public DemonioDoFogo(String nome)
    {
        super(nome);
    }

    @Override
    public void apresentar()
    {
        System.out.println("Sou " + getNome() + ", o demonio do fogo, e faco o castelo andar!");
    }
}