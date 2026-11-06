public class Main
{
    public static void main(String[] args)
    {
        Morador howl = new Mago("Howl", "Transformacao em passaro");
        Morador calcifer = new DemonioDoFogo("Calcifer");

        howl.apresentar();
        calcifer.apresentar();

        // Morador generico = new Morador("Generico"); // erro: Morador is abstract; cannot be instantiated
    }
}

//Usei, principalmente, o material do Chris e a apostila do relatório 11. Não utilizei IA.
//E este é realmente o exercício 1, mesmo que o nome do arquivo esteja "Relatorio 11".
//Na hora de nomear confundi o nome de onde eu guardaria os exercícios com o primeiro
//e o intelliJ não me deixa renomear certo >:0