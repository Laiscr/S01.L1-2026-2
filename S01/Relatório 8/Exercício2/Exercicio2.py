class HeroiOverwatch:

    def __init__(self, codinome: str, funcao: str):
        self.codinome = codinome
        self.funcao = funcao

    def usar_suprema(self):
        print(f"{self.codinome} usa uma suprema generica!")


class HeroiTanque(HeroiOverwatch):

    def usar_suprema(self):
        print(f"{self.codinome} ativa a suprema de tanque e bloqueia todos os danos!")


class HeroiSuporte(HeroiOverwatch):

    def usar_suprema(self):
        print(f"{self.codinome} ativa a suprema de suporte e revive os aliados!")

    def curar_equipe(self):
        print(f"{self.codinome} cura toda a equipe!")


if __name__ == "__main__":
    time: list[HeroiOverwatch] = [
        HeroiTanque("Reinhardt", "Tanque"),
        HeroiSuporte("Ana", "Suporte"),
        HeroiOverwatch("Soldier76", "Dano")
    ]

    for heroi in time:
        heroi.usar_suprema()
        if isinstance(heroi, HeroiSuporte):
            heroi.curar_equipe()