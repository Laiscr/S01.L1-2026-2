public class ComboLeblanc extends ItemDoCardapio
{
    public ComboLeblanc(String nome, double preco)
    {
        super(nome, preco);
    }

    @Override
    public double precoFinal()
    {
        return getPreco() * 0.9;
    }
}