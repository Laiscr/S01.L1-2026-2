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

> Não consigo encontrar o erro. Não está printando o esperado. Me ajude a encontrar.

```ruby
module Depoente
  def depor
    raise NotImplementedError, "#{self.class} deve implementar depor"
  end
end

module Detivel
  def ser_detido
    puts "#{nome} foi levado pela Scotland Yard."
  end
end

class Envolvido
  attr_reader :nome

  def initialize(nome)
    @nome = nome
  end
end

class TestemunhaOcular < Envolvido
  include Depoente

  def depor
    puts "#{@nome} depoe: vi um homem de capa preta saindo correndo da cena."
  end
end

class SuspeitoDoCrime < Envolvido
  include Detivel

  def depor
    puts "#{@nome} depoe: eu estava em casa a noite toda, posso provar."
  end
end

class Investigacao
  def initialize(caso)
    @caso = caso
    @envolvidos = []
  end

  def registrar(envolvido)
    @envolvidos << envolvido
  end

  def ouvir_todos
    puts "\nCaso: #{@caso}"
    @envolvidos.each { |e| e.depor }
  end

  def acionar_scotland_yard
    puts "\nAcionando Scotland Yard:"
    detidos = @envolvidos.select { |e| e.respond_to?(:ser_detido) }
    detidos.each { |e| e.ser_detido }
  end
end

testemunha = TestemunhaOcular.new("Sra. Hudson")
suspeito1 = SuspeitoDoCrime.new("Irene Adler")
suspeito2 = SuspeitoDoCrime.new("James Moriarty")

investigacao = Investigacao.new("O Assassinato na Baker Street")
investigacao.registrar(testemunha)
investigacao.registrar(suspeito1)
investigacao.registrar(suspeito2)

investigacao.ouvir_todos
investigacao.acionar_scotland_yard
```

**Resposta obtida:**

O problema principal está na classe `SuspeitoDoCrime`. Ela tem o método `depor` escrito, mas **não inclui o módulo `Depoente`** — sem o `include`, o Ruby não reconhece esse objeto como um `Depoente` oficial.

**Onde estão os problemas:**

1. Falta `include Depoente` em `SuspeitoDoCrime`:

```ruby
class SuspeitoDoCrime < Envolvido
  include Detivel
  include Depoente # <--- Faltou incluir este módulo!
  # ...
end
```

2. O método `ser_detido` no módulo `Detivel` usa `nome` diretamente — funciona se `attr_reader` estiver definido na classe, mas usar `@nome` ou `self.nome` deixa mais seguro.

Código corrigido:

```ruby
module Depoente
  def depor
    raise NotImplementedError, "#{self.class} deve implementar depor"
  end
end

module Detivel
  def ser_detido
    puts "#{nome} foi levado pela Scotland Yard."
  end
end

class Envolvido
  attr_reader :nome

  def initialize(nome)
    @nome = nome
  end
end

class TestemunhaOcular < Envolvido
  include Depoente

  def depor
    puts "#{@nome} depoe: vi um homem de capa preta saindo correndo da cena."
  end
end

class SuspeitoDoCrime < Envolvido
  include Depoente # Adicionado aqui
  include Detivel

  def depor
    puts "#{@nome} depoe: eu estava em casa a noite toda, posso provar."
  end
end

class Investigacao
  def initialize(caso)
    @caso = caso
    @envolvidos = []
  end

  def registrar(envolvido)
    @envolvidos << envolvido
  end

  def ouvir_todos
    puts "\nCaso: #{@caso}"
    @envolvidos.each { |e| e.depor }
  end

  def acionar_scotland_yard
    puts "\nAcionando Scotland Yard:"
    detidos = @envolvidos.select { |e| e.respond_to?(:ser_detido) }
    detidos.each { |e| e.ser_detido }
  end
end

testemunha = TestemunhaOcular.new("Sra. Hudson")
suspeito1 = SuspeitoDoCrime.new("Irene Adler")
suspeito2 = SuspeitoDoCrime.new("James Moriarty")

investigacao = Investigacao.new("O Assassinato na Baker Street")
investigacao.registrar(testemunha)
investigacao.registrar(suspeito1)
investigacao.registrar(suspeito2)

investigacao.ouvir_todos
investigacao.acionar_scotland_yard
```

Saída esperada:

```
Caso: O Assassinato na Baker Street
Sra. Hudson depoe: vi um homem de capa preta saindo correndo da cena.
Irene Adler depoe: eu estava em casa a noite toda, posso provar.
James Moriarty depoe: eu estava em casa a noite toda, posso provar.

Acionando Scotland Yard:
Irene Adler foi levado pela Scotland Yard.
James Moriarty foi levado pela Scotland Yard.
```

---

## 3. Relatório de Aprendizado

### Como a resposta me ajudou (ou falhou em me ajudar) na solução do problema:

A resposta foi útil e encontrou o erro rapidamente. O código tinha o método `depor` escrito corretamente, mas faltava o `include Depoente` — algo que eu não teria percebido facilmente só de olhar.

### De que forma ela solucionou a minha dúvida:

Explicou que, em Ruby, ter o método escrito não é suficiente se o código espera que o objeto "assine" um módulo com `include`. Sem o `include Depoente`, a classe não é reconhecida como portadora daquele comportamento.

### O que aprendi com aquele retorno para aplicar em problemas futuros:

Aprendi que módulos em Ruby funcionam como um contrato: não basta implementar o método, é preciso declarar o `include` na classe para que ela seja reconhecida como parte daquele grupo de comportamentos. Em exercícios futuros com módulos, vou verificar se todas as classes que precisam de um módulo estão de fato incluindo ele.