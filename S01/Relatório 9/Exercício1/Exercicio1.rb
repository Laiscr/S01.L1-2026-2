class CoquetelAfterlife
  attr_reader :nome

  def initialize(nome, preco)
    @nome = nome
    @_preco = preco
  end

  def preco
    @_preco
  end

  def preco=(valor)
    if valor >= 5 && valor <= 200
      @_preco = valor
    else
      puts "Preco invalido!"
    end
  end

  def ficha
    "#{@nome} | Preco: #{@_preco}"
  end
end

class DrinkDeLenda < CoquetelAfterlife
  attr_reader :lenda

  def initialize(nome, preco, lenda)
    super(nome, preco)
    @lenda = lenda
  end

  def ficha
    super + " | Lenda: #{@lenda}"
  end
end

afterlife_special = CoquetelAfterlife.new("Afterlife Special", 50)
johnny = DrinkDeLenda.new("Johnny Silverhand", 120, "Johnny Silverhand")
alt = DrinkDeLenda.new("Alt Cunningham", 150, "Alt Cunningham")

cardapio = [afterlife_special, johnny, alt]
cardapio.each { |drink| puts drink.ficha }

puts "\n"
johnny.preco = 500
johnny.preco = 80
puts johnny.ficha

#johnny.nome = "Outro Nome"  # erro: attr_reader nao permite escrita direta
