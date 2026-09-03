use std::io;

fn validar_placa(placa: &str) -> bool 
{
    if placa.len() < 7 
    {
        return false;
    }

    let mut maiusculas = 0;
    let mut numeros = 0;

    for c in placa.chars() 
    {
        if c.is_ascii_uppercase() 
        {
            maiusculas += 1;
        }
        if c.is_numeric() 
        {
            numeros += 1;
        }
    }

    //explicação da maiusculas no IA_Report
    maiusculas >= 3 && numeros >= 2
}

fn main() 
{
    loop 
    {
        let mut entrada = String::new();
        println!("Digite a placa do veiculo:");

        let bytes = io::stdin().read_line(&mut entrada).expect("Erro ao ler");

        // Impede o loop infinito no OneCompiler quando a entrada acaba:
        if bytes == 0 
        {
            break;
        }

        let placa = entrada.trim();

        if validar_placa(placa) 
        {
            println!("Placa cadastrada no sistema!");
            break;
        } 
        else 
        {
            println!("Placa invalida. Tente novamente!");
        }
    }
}