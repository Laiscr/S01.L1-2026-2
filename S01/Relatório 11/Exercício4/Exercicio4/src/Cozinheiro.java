import java.util.ArrayList;

public class Cozinheiro
{
    private String nome;
    private Panela panela;
    private ArrayList<Monstro> ingredientes;

    public Cozinheiro(String nome, String materialDaPanela)
    {
        this.nome = nome;
        this.panela = new Panela(materialDaPanela);
        this.ingredientes = new ArrayList<>();
    }

    public void adicionarIngrediente(Monstro monstro)
    {
        this.ingredientes.add(monstro);
    }

    public void servirBanquete()
    {
        System.out.println("--- Banquete de " + nome + " ---");
        System.out.println("Panela de " + panela.getMaterial());

        for (Monstro monstro : ingredientes)
        {
            System.out.println("\n" + monstro.getNome());
            System.out.println("  " + monstro.receita());
        }
    }
}