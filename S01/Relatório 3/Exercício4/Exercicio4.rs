use std::io;

fn calcular_pontuacao(prova1: f64, prova2: f64, redacao: f64) -> f64 
{
    let npt = (prova1 + prova2) / 2.0;
    let pf = npt * 0.6 + redacao * 0.4;

    if pf >= 60.0 
    {
        println!("Parabens! Candidato aprovado no processo seletivo.");
        println!("Pontuacao Final: {}", pf);
    } 
    else 
    {
        println!("Infelizmente o candidato nao atingiu a pontuacao minima de aprovacao.");
        println!("Pontuacao Final: {}", pf);
    }

    pf
}

fn main() 
{
    let mut entrada_prova1 = String::new();
    println!("Digite a nota da Prova Teorica 1:");
    io::stdin().read_line(&mut entrada_prova1).expect("Erro ao ler");
    let prova1: f64 = entrada_prova1.trim().parse().unwrap_or(0.0);

    let mut entrada_prova2 = String::new();
    println!("Digite a nota da Prova Teorica 2:");
    io::stdin().read_line(&mut entrada_prova2).expect("Erro ao ler");
    let prova2: f64 = entrada_prova2.trim().parse().unwrap_or(0.0);

    let mut entrada_redacao = String::new();
    println!("Digite a nota da Redacao:");
    io::stdin().read_line(&mut entrada_redacao).expect("Erro ao ler");
    let redacao: f64 = entrada_redacao.trim().parse().unwrap_or(0.0);

    calcular_pontuacao(prova1, prova2, redacao);
}