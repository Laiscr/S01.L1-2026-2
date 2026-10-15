from abc import ABC, abstractmethod


class IUnidadeDeRede(ABC):

    @abstractmethod
    def executar_invasao(self):
        pass


class Cyberdeck:

    def __init__(self, modelo: str):
        self.modelo = modelo


class OperadorNetrunner(IUnidadeDeRede):

    def __init__(self, nome: str, modelo_cyberdeck: str):
        self.nome = nome
        self.cyberdeck = Cyberdeck(modelo_cyberdeck)

    def executar_invasao(self):
        print(f"{self.nome} usa o {self.cyberdeck.modelo} e esta quebrando o gelo (ICE) de um servidor.")


class DroneDeVigilancia(IUnidadeDeRede):

    def __init__(self, codigo: str):
        self.codigo = codigo

    def executar_invasao(self):
        print(f"Drone {self.codigo} esta interceptando o sinal da rede.")


class CelulaHacker:

    def __init__(self, nome: str, membros: list[IUnidadeDeRede]):
        self.nome = nome
        self._membros = membros

    def iniciar_ataque(self):
        print(f"\nCelula {self.nome} iniciando ataque:")
        for membro in self._membros:
            membro.executar_invasao()


if __name__ == "__main__":
    netrunner = OperadorNetrunner("V", "Militech Paraline")
    drone = DroneDeVigilancia("DR-77")

    celula = CelulaHacker("NetWatch", [netrunner, drone])
    celula.iniciar_ataque()

    # unidade = IUnidadeDeRede()  
    # erro: nao eh possivel instanciar classe abstrata