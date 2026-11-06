import java.util.HashMap;

public class MapaDeAvistamentos
{
    private HashMap<String, Sobrenatural> avistamentos;

    public MapaDeAvistamentos()
    {
        this.avistamentos = new HashMap<>();
    }

    public void registrar(String local, Sobrenatural ser)
    {
        this.avistamentos.put(local, ser);
    }

    public void investigar(String local)
    {
        System.out.println("\n[Investigacao] Local: " + local);
        Sobrenatural encontrado = this.avistamentos.get(local);

        if (encontrado == null)
        {
            System.out.println("Nada por aqui. O local esta tranquilo.");
        }
        else
        {
            encontrado.manifestar();
        }
    }
}