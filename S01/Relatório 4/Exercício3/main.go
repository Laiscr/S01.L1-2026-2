package main
import "fmt"

func gerarEscalaPlantao(n int) {
	fmt.Println("--- Escala de Plantao Tecnico ---")
	for i := 0; i < n; i++ {
		dia := 1 + i*4
		fmt.Printf("Plantao %d: Dia %d do mes\n", i+1, dia)
	}
}

func main() {
	var quantidade int
	fmt.Print("Digite a quantidade de plantoes necessarios: ")
	fmt.Scanln(&quantidade)

	gerarEscalaPlantao(quantidade)
}