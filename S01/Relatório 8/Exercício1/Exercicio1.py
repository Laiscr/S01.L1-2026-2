class MortoVivo:

    def __init__(self, nome: str, almas: int, estus: int):
        self.nome = nome
        self._almas = almas
        self.__estus = estus

    def get_estus(self):
        return self.__estus

    def set_estus(self, quantidade):
        if 0 <= quantidade <= 10:
            self.__estus = quantidade
        else:
            print("Quantidade de Estus invalida!")

    def mostrar_status(self):
        return f"Morto-vivo {self.nome} | Almas: {self._almas} | Estus: {self.__estus}"


class Clerigo(MortoVivo):

    def __init__(self, nome: str, almas: int, estus: int, milagre: str):
        super().__init__(nome, almas, estus)
        self.milagre = milagre

    def mostrar_status(self):
        return super().mostrar_status() + f" | Milagre: {self.milagre}"


if __name__ == "__main__":
    clerigo = Clerigo("Petrus", 2000, 5, "Cura Divina")
    print(clerigo.mostrar_status())

    clerigo.set_estus(15)
    clerigo.set_estus(10)
    print(clerigo.mostrar_status())

    # print(clerigo.__estus)  
    # erro: atributo privado, nao acessivel diretamente

    # https://pythoniluminado.netlify.app/classes-objetos -> nao usei IA, mas usei bastante este link 
    # para os exercicios alem do exemplo. Isso vale pra todos os exercicios.