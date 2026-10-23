# IA_REPORT.md

## 1. Identificação

- **Nome completo:** Laís Carlos Rodrigues
- **Matrícula:** 681

---

## 2. Histórico de Prompts

### Modelo utilizado: Gemini Flash

---

### Prompt 1

**Pergunta enviada à IA:**

> O código roda parcialmente, mas depois aparece este erro — o que significa?
> `undefined method 'phonewave' for an instance of LaboratorioDeGadgets (NoMethodError)`

```ruby
class PhoneWave
  def enviar_dmail(mensagem)
    puts "Enviando D-Mail para o passado: \"#{mensagem}\""
  end
end

class MembroDoLab
  attr_reader :numero, :nome

  def initialize(numero, nome)
    @numero = numero
    @nome = nome
  end
end

class LaboratorioDeGadgets
  def initialize
    @phonewave = PhoneWave.new
    @membros = []
  end

  def admitir(membro)
    @membros << membro
    puts "Lab Mem #{membro.numero} - #{membro.nome} admitido."
  end

  def experimento(mensagem)
    puts "\nMembros presentes:"
    @membros.each { |m| puts "  #{m.numero} - #{m.nome}" }
    @phonewave.enviar_dmail(mensagem)
  end
end

okabe = MembroDoLab.new("001", "Okabe Rintaro")
mayuri = MembroDoLab.new("002", "Shiina Mayuri")

lab = LaboratorioDeGadgets.new
lab.admitir(okabe)
lab.admitir(mayuri)
lab.experimento("Nao va ao festival amanha.")
lab.phonewave.enviar_dmail("Segunda mensagem")
```

**Resposta obtida:**

O erro acontece porque a variável `@phonewave` está encapsulada (privada) dentro da classe `LaboratorioDeGadgets`. Na última linha, você tenta acessar `lab.phonewave`, mas não criou um método leitor (`attr_reader :phonewave`) para disponibilizar esse objeto fora da classe.

**Como resolver:**

Opção 1 — adicionar `attr_reader` (recomendado se quiser acessar o PhoneWave diretamente):

```ruby
class LaboratorioDeGadgets
  attr_reader :phonewave # Permite o acesso a lab.phonewave

  def initialize
    @phonewave = PhoneWave.new
    @membros = []
  end
  # ...
end
```

Opção 2 — usar o método `experimento` da própria classe, sem expor o PhoneWave:

```ruby
lab.experimento("Segunda mensagem")
```

Código completo corrigido (Opção 1):

```ruby
class PhoneWave
  def enviar_dmail(mensagem)
    puts "Enviando D-Mail para o passado: \"#{mensagem}\""
  end
end

class MembroDoLab
  attr_reader :numero, :nome

  def initialize(numero, nome)
    @numero = numero
    @nome = nome
  end
end

class LaboratorioDeGadgets
  attr_reader :phonewave

  def initialize
    @phonewave = PhoneWave.new
    @membros = []
  end

  def admitir(membro)
    @membros << membro
    puts "Lab Mem #{membro.numero} - #{membro.nome} admitido."
  end

  def experimento(mensagem)
    puts "\nMembros presentes:"
    @membros.each { |m| puts "  #{m.numero} - #{m.nome}" }
    @phonewave.enviar_dmail(mensagem)
  end
end

okabe = MembroDoLab.new("001", "Okabe Rintaro")
mayuri = MembroDoLab.new("002", "Shiina Mayuri")

lab = LaboratorioDeGadgets.new
lab.admitir(okabe)
lab.admitir(mayuri)
lab.experimento("Nao va ao festival amanha.")
lab.phonewave.enviar_dmail("Segunda mensagem")
```

---

### Prompt 2

**Pergunta enviada à IA:**

> Pasme você... mas não entendi nem o erro, nem a explicação ainda.

**Resposta obtida:**

Sem problemas, vamos desacoplar isso do "Rubyês" técnico e olhar como se fosse vida real!

Pensa no módulo `Depoente` como se fosse uma **Credencial / Autorização de Fala**.

Quando o programa chamou a `TestemunhaOcular`, deu tudo certo — ela tinha a credencial. Mas quando chegou na `SuspeitoDoCrime`:

1. O Ruby olhou para a classe `SuspeitoDoCrime`.
2. Ela tinha o método `depor` escrito lá dentro? Tinha.
3. **Mas**, como ela não tinha a linha `include Depoente`, para a linguagem foi como se a Irene estivesse tentando falar em um tribunal sem a autorização oficial. O Ruby disse: *"Esse objeto não tem a autorização de `Depoente`, então não deixo chamar o método!"*

A analogia dos dois módulos:

- **`Detivel`** = quem pode ser preso pela polícia.
- **`Depoente`** = quem pode prestar depoimento no tribunal.

Na classe `SuspeitoDoCrime`, você só tinha colocado `include Detivel` — ela sabia "ser presa", mas o `Investigacao` tentou fazer ela "depor".

```ruby
class SuspeitoDoCrime < Envolvido
  include Detivel  # Suspeito pode ser preso!
  # Faltava: include Depoente — para poder depor também
end
```

---

### Prompt 3

**Pergunta enviada à IA:**

> O enunciado pede composição e agregação, mas o código que me passou não bate direito. Corrige o necessário.

```ruby
class PhoneWave
  def enviar_dmail(mensagem)
    puts "Enviando D-Mail para o passado: \"#{mensagem}\""
  end
end

class MembroDoLab
  attr_reader :numero, :nome

  def initialize(numero, nome)
    @numero = numero
    @nome = nome
  end
end

class LaboratorioDeGadgets
  attr_reader :phonewave

  def initialize
    @phonewave = PhoneWave.new
    @membros = []
  end

  def admitir(membro)
    @membros << membro
    puts "Lab Mem #{membro.numero} - #{membro.nome} admitido."
  end

  def experimento(mensagem)
    puts "\nMembros presentes:"
    @membros.each { |m| puts "  #{m.numero} - #{m.nome}" }
    @phonewave.enviar_dmail(mensagem)
  end
end

okabe = MembroDoLab.new("001", "Okabe Rintaro")
mayuri = MembroDoLab.new("002", "Shiina Mayuri")

lab = LaboratorioDeGadgets.new
lab.admitir(okabe)
lab.admitir(mayuri)
lab.experimento("Nao va ao festival amanha.")
lab.phonewave.enviar_dmail("Segunda mensagem")
```

**Resposta obtida:**

Você tem toda a razão! O enunciado pede apenas `lab.experimento(...)` — a chamada extra `lab.phonewave.enviar_dmail(...)` não fazia parte da especificação e expunha um atributo desnecessariamente. Aqui está o código 100% ajustado aos 6 requisitos:

```ruby
# 1. Classe PhoneWave
class PhoneWave
  def enviar_dmail(mensagem)
    puts "Enviando D-Mail para o passado: \"#{mensagem}\""
  end
end

# 2. Classe MembroDoLab
class MembroDoLab
  attr_reader :numero, :nome

  def initialize(numero, nome)
    @numero = numero
    @nome = nome
  end
end

# 3 e 4. Classe LaboratorioDeGadgets
class LaboratorioDeGadgets
  def initialize
    @phonewave = PhoneWave.new # Composição: PhoneWave pertence exclusivamente ao Lab
    @membros = []              # Agregação: guardará instâncias criadas fora do Lab
  end

  def admitir(membro)
    @membros << membro
    puts "Lab Mem #{membro.numero} - #{membro.nome} admitido."
  end

  def experimento(mensagem)
    puts "\nMembros presentes:"
    @membros.each { |m| puts "  #{m.numero} - #{m.nome}" }
    @phonewave.enviar_dmail(mensagem)
  end
end

# ==============================================================================
# 6. COMPOSIÇÃO x AGREGAÇÃO:
#
# COMPOSIÇÃO (@phonewave): o PhoneWave nasce dentro do initialize do Lab.
# Tem dependência forte — nasce e morre junto com o laboratório.
#
# AGREGAÇÃO (@membros): os MembroDoLab são criados fora e passados por admitir.
# Relação fraca — existiam antes do Lab e continuam existindo independentemente.
# ==============================================================================

# 5. Main
okabe = MembroDoLab.new("001", "Okabe Rintaro")
mayuri = MembroDoLab.new("002", "Shiina Mayuri")

lab = LaboratorioDeGadgets.new
lab.admitir(okabe)
lab.admitir(mayuri)
lab.experimento("Nao va ao festival amanha.")
```

---

### Prompt 4

**Pergunta enviada à IA:**

> Minha versão em relação à sua está certa, não?

```ruby
# COMPOSICAO: PhoneWave nasce dentro do Lab e so existe nele
# AGREGACAO: MembroDoLab existe antes do Lab e continua existindo fora dele

class PhoneWave
  def enviar_dmail(mensagem)
    puts "Enviando D-Mail para o passado: \"#{mensagem}\""
  end
end

class MembroDoLab
  attr_reader :numero, :nome

  def initialize(numero, nome)
    @numero = numero
    @nome = nome
  end
end

class LaboratorioDeGadgets
  def initialize
    @phonewave = PhoneWave.new
    @membros = []
  end

  def admitir(membro)
    @membros << membro
    puts "Lab Mem #{membro.numero} - #{membro.nome} admitido."
  end

  def experimento(mensagem)
    puts "\nMembros presentes:"
    @membros.each { |m| puts "  #{m.numero} - #{m.nome}" }
    @phonewave.enviar_dmail(mensagem)
  end
end

okabe = MembroDoLab.new("001", "Okabe Rintaro")
mayuri = MembroDoLab.new("002", "Shiina Mayuri")

lab = LaboratorioDeGadgets.new
lab.admitir(okabe)
lab.admitir(mayuri)
lab.experimento("Nao va ao festival amanha.")
```

**Resposta obtida:**

Sim, a sua versão está 100% correta! Tudo atende perfeitamente ao enunciado:

1. `PhoneWave` instanciado dentro do `initialize` do `LaboratorioDeGadgets` — composição pura, sem expor `attr_reader`.
2. `MembroDoLab` criado fora e passado por `admitir` — agregação.
3. Chamada limpa do método `experimento`.
4. Comentários no topo resumindo a diferença conceitual de forma direta e correta.

Pode entregar exatamente assim!

---

## 3. Relatório de Aprendizado

### Como a resposta me ajudou (ou falhou em me ajudar) na solução do problema:

A IA resolveu o erro do Prompt 1, mas acabou sugerindo uma solução (`attr_reader :phonewave`) que ia além do que o enunciado pedia. Só depois de questionar no Prompt 3 que chegamos ao código correto... foi útil, mas precisei orientar a resposta.

### De que forma ela solucionou a minha dúvida:

Explicou que `@phonewave` era privado e que sem `attr_reader` não é possível acessá-lo de fora da classe. Também ajudou a entender a diferença prática entre composição (objeto criado dentro da classe) e agregação (objeto criado fora e passado como argumento).

### O que aprendi com aquele retorno para aplicar em problemas futuros:

Aprendi que variáveis de instância em Ruby são privadas por padrão e que `attr_reader` é necessário para expô-las. Também entendi a diferença entre composição e agregação na prática: onde o objeto é criado define o tipo de relação.