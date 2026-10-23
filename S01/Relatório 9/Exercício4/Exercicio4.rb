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

# Execução do script
testemunha = TestemunhaOcular.new("Sra. Hudson")
suspeito1 = SuspeitoDoCrime.new("Irene Adler")
suspeito2 = SuspeitoDoCrime.new("James Moriarty")

investigacao = Investigacao.new("O Assassinato na Baker Street")
investigacao.registrar(testemunha)
investigacao.registrar(suspeito1)
investigacao.registrar(suspeito2)

investigacao.ouvir_todos
investigacao.acionar_scotland_yard