// COMPOSICAO: a Panela e criada dentro do construtor do Cozinheiro e so existe nele
// AGREGACAO: os Monstro existem antes do Cozinheiro e continuam existindo fora dele

public class Main
{
    public static void main(String[] args)
    {
        Slime slimeAzul = new Slime("Slime Azul");
        Mandragora mandragoraGritante = new Mandragora("Mandragora Gritante");

        Cozinheiro senshi = new Cozinheiro("Senshi", "Ferro Fundido");
        senshi.adicionarIngrediente(slimeAzul);
        senshi.adicionarIngrediente(mandragoraGritante);

        senshi.servirBanquete();
    }
}
//Usei, principalmente, o material do Chris e a apostila do relatório 11. Não utilizei IA.