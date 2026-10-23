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

# Instâncias
kousei = Solista.new("Kousei Arima", "Piano")
kaori = Acompanhador.new("Kaori Miyazono", "Violino") 
regente = Regente.new("Maestro Hiroko")

regente.convocar(kousei)
regente.convocar(kaori)
regente.reger("Ballade No. 1 de Chopin")

puts "\nEscalacao:"
regente.escalacao.each { |texto| puts texto }

#instrumentista.interpretar("Qualquer peca")  #erro: NotImplementedError