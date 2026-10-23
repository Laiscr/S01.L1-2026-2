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

> O erro diz que dei um argumento mas esperava dois. Mas eu dei dois argumentos nessa linha — como assim?
> `Exercicio2.rb:4:in 'initialize': wrong number of arguments (given 1, expected 2) (ArgumentError)`

```ruby
class Instrumentista
  attr_reader :nome, :instrumento

  def initialize(nome, instrumento)
    @nome = nome
    @instrumento = instrumento
  end

  def interpretar(peca)
    raise NotImplementedError, "#{self.class} deve implementar interpretar"
  end
end

class Solista < Instrumentista
  def interpretar(peca)
    puts "#{@nome} (#{@instrumento}) conduz a melodia principal de #{peca}."
  end
end

class Acompanhador < Instrumentista
  def interpretar(peca)
    puts "#{@nome} (#{@instrumento}) acompanha o ritmo do solista em #{peca}."
  end
end

class Regente
  def initialize(nome)
    @nome = nome
    @orquestra = []
  end

  def convocar(instrumentista)
    @orquestra << instrumentista
  end

  def reger(peca)
    puts "#{@nome} rege: #{peca}"
    @orquestra.each { |i| i.interpretar(peca) }
  end

  def escalacao
    @orquestra.map { |i| "#{i.class}: #{i.nome}" }
  end
end

kousei = Solista.new("Kousei Arima", "Piano")
kaori = Acompanhador.new("Kaori Miyazono")
regente = Regente.new("Maestro Hiroko")

regente.convocar(kousei)
regente.convocar(kaori)
regente.reger("Ballade No. 1 de Chopin")

puts "\nEscalacao:"
regente.escalacao.each { |texto| puts texto }
```

**Resposta obtida:**

Essa é uma pegadinha muito comum do Ruby quando trabalhamos com herança! Você deu 2 argumentos para o `kousei`, mas passou apenas 1 para a `kaori`:

```ruby
kousei = Solista.new("Kousei Arima", "Piano") # 2 argumentos -> OK
kaori = Acompanhador.new("Kaori Miyazono")    # 1 argumento  -> ERRO!
```

Como `Acompanhador` não tem um `initialize` próprio, o Ruby usa o da classe pai (`Instrumentista`), que espera 2 argumentos (`nome` e `instrumento`). Ao passar só o nome, ele reclama.

**Como corrigir:** basta passar o instrumento da Kaori:

```ruby
kaori = Acompanhador.new("Kaori Miyazono", "Violino")
```

Código completo corrigido:

```ruby
class Instrumentista
  attr_reader :nome, :instrumento

  def initialize(nome, instrumento)
    @nome = nome
    @instrumento = instrumento
  end

  def interpretar(peca)
    raise NotImplementedError, "#{self.class} deve implementar interpretar"
  end
end

class Solista < Instrumentista
  def interpretar(peca)
    puts "#{@nome} (#{@instrumento}) conduz a melodia principal de #{peca}."
  end
end

class Acompanhador < Instrumentista
  def interpretar(peca)
    puts "#{@nome} (#{@instrumento}) acompanha o ritmo do solista em #{peca}."
  end
end

class Regente
  def initialize(nome)
    @nome = nome
    @orquestra = []
  end

  def convocar(instrumentista)
    @orquestra << instrumentista
  end

  def reger(peca)
    puts "#{@nome} rege: #{peca}"
    @orquestra.each { |i| i.interpretar(peca) }
  end

  def escalacao
    @orquestra.map { |i| "#{i.class}: #{i.nome}" }
  end
end

kousei = Solista.new("Kousei Arima", "Piano")
kaori = Acompanhador.new("Kaori Miyazono", "Violino")
regente = Regente.new("Maestro Hiroko")

regente.convocar(kousei)
regente.convocar(kaori)
regente.reger("Ballade No. 1 de Chopin")

puts "\nEscalacao:"
regente.escalacao.each { |texto| puts texto }
```

Saída esperada:

```
Maestro Hiroko rege: Ballade No. 1 de Chopin
Kousei Arima (Piano) conduz a melodia principal de Ballade No. 1 de Chopin.
Kaori Miyazono (Violino) acompanha o ritmo do solista em Ballade No. 1 de Chopin.

Escalacao:
Solista: Kousei Arima
Acompanhador: Kaori Miyazono
```

---

## 3. Relatório de Aprendizado

### Como a resposta me ajudou (ou falhou em me ajudar) na solução do problema:

A resposta foi direta e resolveu o problema. O erro parecia ser na linha do `kousei`, mas era na linha da `kaori` — a IA identificou isso rápido e explicou o motivo.

### De que forma ela solucionou a minha dúvida:

Explicou que quando uma subclasse não define seu próprio `initialize`, o Ruby herda o da classe pai. Como o `initialize` de `Instrumentista` exige dois argumentos, a `kaori` precisava receber o instrumento também.

### O que aprendi com aquele retorno para aplicar em problemas futuros:

Aprendi que, em Ruby, se uma subclasse não tem `initialize` próprio, ela usa o da classe pai, incluindo todos os argumentos que ele exige. Antes de criar um objeto, vale verificar qual `initialize` está sendo chamado na herança.