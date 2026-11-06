public class Slime extends Monstro
{
    public Slime(String nome)
    {
        super(nome);
    }

    @Override
    public String receita()
    {
        return "Retire o nucleo, lave bem a gelatina e cozinhe no vapor ate firmar.";
    }
}