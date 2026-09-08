package main
import "fmt"

func main() {
	var vendas1, vendas2, vendas3 int

	fmt.Print("Digite as vendas do 1o trimestre: ")
	fmt.Scanln(&vendas1)

	fmt.Print("Digite as vendas do 2o trimestre: ")
	fmt.Scanln(&vendas2)

	fmt.Print("Digite as vendas do 3o trimestre: ")
	fmt.Scanln(&vendas3)

	total := vendas1 + vendas2 + vendas3
	fmt.Printf("Total de vendas: %d unidades\n", total)

	if total < 100 {
		fmt.Println("Meta minima anual nao atingida!")
	} else {
		switch {
		case total >= 250:
			fmt.Println("Classificacao: Categoria Top Seller")
		case total >= 180:
			fmt.Println("Classificacao: Categoria Senior")
		default:
			fmt.Println("Classificacao: Categoria Pleno")
		}
	}
}