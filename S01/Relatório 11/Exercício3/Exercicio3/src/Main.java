public class Main
{
    public static void main(String[] args)
    {
        Alienigena serpo = new Alienigena("Serpo");
        EspiritoYoukai turboVovo = new EspiritoYoukai("Turbo Vovo");

        MapaDeAvistamentos mapa = new MapaDeAvistamentos();
        mapa.registrar("Hospital Abandonado", serpo);
        mapa.registrar("Tunel da Estrada Velha", turboVovo);

        mapa.investigar("Hospital Abandonado");
        mapa.investigar("Tunel da Estrada Velha");
        mapa.investigar("Praca Central");
    }
}
//Usei, principalmente, o material do Chris e a apostila do relatório 11. Não utilizei IA.