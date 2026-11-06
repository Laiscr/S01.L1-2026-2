import java.util.ArrayList;

public class CafeLeblanc
{
    private ArrayList<ItemDoCardapio> cardapio;

    public CafeLeblanc()
    {
        this.cardapio = new ArrayList<>();
    }

    public void adicionar(ItemDoCardapio item)
    {
        this.cardapio.add(item);
    }

    public void mostrarCardapio()
    {
        System.out.println("--- Cardapio do Leblanc ---");
        for (ItemDoCardapio item : cardapio)
        {
            System.out.println(item.getNome() + " - " + item.precoFinal() + " ienes");
        }
    }
}