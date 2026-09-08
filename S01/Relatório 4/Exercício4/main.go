package main
import "fmt"

func validarIngresso(setor string, codigo int) bool {
	if setor == "VIP" && codigo == 2026 {
		return true
	}

	return false
}

func main() {
	for {
		var setor string
		var codigo int

		fmt.Print("Digite o setor do ingresso: ")
		fmt.Scanln(&setor)

		fmt.Print("Digite o codigo do ingresso: ")
		fmt.Scanln(&codigo)

		if validarIngresso(setor, codigo) {
			fmt.Println("Acesso liberado a area VIP!")
			break
		} else {
			fmt.Println("Ingresso ou setor invalido. Tente novamente.")
		}
	}
}
//mesmo caso do ex. 1 em relação as entradas. Mas tá certinho também. Eu espero :D
//Minha dificuldade maior, mas vi na aula deste relatório (que parece ser normal do OneCompiler), é as informações aparecem uma na frente da outra
//Tentei meu melhor pra ajeitar, mas não consegui arrumar muito :[ 