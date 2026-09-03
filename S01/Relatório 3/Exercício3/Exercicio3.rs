use std::io;

fn imprimir_terminados_em(digito: i32, limite_inferior: i32, limite_superior: i32) 
{
    println!("--- Numeros no intervalo terminados em {} ---", digito);
    for i in limite_inferior..=limite_superior 
    {
        if i % 10 == digito 
        {
            println!("{}", i);
        }
    }
}

fn main() 
{
    let mut entrada_digito = String::new();
    println!("Digite o digito final desejado (0 a 9):");
    io::stdin().read_line(&mut entrada_digito).expect("Erro ao ler");
    let digito: i32 = entrada_digito.trim().parse().unwrap_or(0);

    let mut entrada_inferior = String::new();
    println!("Digite o limite inferior:");
    io::stdin().read_line(&mut entrada_inferior).expect("Erro ao ler");
    let limite_inferior: i32 = entrada_inferior.trim().parse().unwrap_or(0);

    let mut entrada_superior = String::new();
    println!("Digite o limite superior:");
    io::stdin().read_line(&mut entrada_superior).expect("Erro ao ler");
    let limite_superior: i32 = entrada_superior.trim().parse().unwrap_or(0);

    imprimir_terminados_em(digito, limite_inferior, limite_superior);
}