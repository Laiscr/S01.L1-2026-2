public class Main
{
    public static void main(String[] args)
    {
        ItemDoCardapio cafeCoado = new ItemDoCardapio("Cafe Coado", 400.0);
        ItemDoCardapio curryDaCasa = new ItemDoCardapio("Curry da Casa", 800.0);
        ComboLeblanc comboCurryCafe = new ComboLeblanc("Combo Curry + Cafe", 1200.0);

        CafeLeblanc leblanc = new CafeLeblanc();
        leblanc.adicionar(cafeCoado);
        leblanc.adicionar(curryDaCasa);
        leblanc.adicionar(comboCurryCafe);

        leblanc.mostrarCardapio();
    }
}
//Usei, principalmente, o material do Chris e a apostila do relatório 11. Não utilizei IA.