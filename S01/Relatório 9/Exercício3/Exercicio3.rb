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