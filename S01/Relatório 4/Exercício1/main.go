package main
import "fmt"

func ValidarCodigoRastreio(codigo string) (bool, string) { //descobri que essa linguagem não me deixa colocar as chaves na linha abaixo >:( e nem o nome do arquivo que quero
	if len(codigo) == 10 {
		return true, "Codigo de rastreio registrado no sistema!"
	}
	return false, "Erro: O codigo de rastreio deve ter exatamente 10 caracteres."
}

func main() {
	valido := false

	for !valido {
		var codigo string
		fmt.Print("Digite o codigo de rastreio: ")
		fmt.Scanln(&codigo)

		var mensagem string
		valido, mensagem = ValidarCodigoRastreio(codigo)
		fmt.Println(mensagem)
	}
}
//não sei se é bobeira avisar, mas o código ta certinho. Se colocar os três valores testes de entrada no I/O 
//aparece tudo corretamente, agora se coloca somente uma entrada (e a errada, especificamente) fica mensagem infinita...