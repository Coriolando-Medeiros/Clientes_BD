require 'terminal-table'

class Estados
  def initialize
    @estados = {
      1 => { sigla: "AC", nome: "Acre" },
      2 => { sigla: "AL", nome: "Alagoas" },
      3 => { sigla: "AP", nome: "Amapá" },
      4 => { sigla: "AM", nome: "Amazonas" },
      5 => { sigla: "BA", nome: "Bahia" },
      6 => { sigla: "CE", nome: "Ceará" },
      7 => { sigla: "DF", nome: "Distrito Federal" },
      8 => { sigla: "ES", nome: "Espírito Santo" },
      9 => { sigla: "GO", nome: "Goiás" },
      10 => { sigla: "MA", nome: "Maranhão" },
      11 => { sigla: "MT", nome: "Mato Grosso" },
      12 => { sigla: "MS", nome: "Mato Grosso do Sul" },
      13 => { sigla: "MG", nome: "Minas Gerais" },
      14 => { sigla: "PA", nome: "Pará" },
      15 => { sigla: "PB", nome: "Paraíba" },
      16 => { sigla: "PR", nome: "Paraná" },
      17 => { sigla: "PE", nome: "Pernambuco" },
      18 => { sigla: "PI", nome: "Piauí" },
      19 => { sigla: "RJ", nome: "Rio de Janeiro" },
      20 => { sigla: "RN", nome: "Rio Grande do Norte" },
      21 => { sigla: "RS", nome: "Rio Grande do Sul" },
      22 => { sigla: "RO", nome: "Rondônia" },
      23 => { sigla: "RR", nome: "Roraima" },
      24 => { sigla: "SC", nome: "Santa Catarina" },
      25 => { sigla: "SP", nome: "São Paulo" },
      26 => { sigla: "SE", nome: "Sergipe" },
      27 => { sigla: "TO", nome: "Tocantins" }
    }

    estados_ordenados = @estados.sort_by { |_, info| info[:nome] }
    estados_divididos = estados_ordenados.each_slice((estados_ordenados.size / 3.0).ceil).to_a

    rows = []
    max_rows = estados_divididos.map(&:size).max

    (0...max_rows).each do |i|
      row = []
      estados_divididos.each do |estado_slice|
        if estado_slice[i]
          num, info = estado_slice[i]
          row << "#{num} - #{info[:sigla]} - #{info[:nome]}"
        else
          row << ""
        end
      end
      rows << row
    end

    @table = Terminal::Table.new do |t|
      t.title = "Estados"
      t.rows = rows
    end
  end

  def apresenta_tabela
    puts @table

    loop do
      print "Escolha o estado desejado: "
      escolha = gets.chomp.to_i

      if @estados.key?(escolha)
        sigla = @estados[escolha][:sigla]
        puts "Estado selecionado: #{sigla}"
        return sigla  # Retorna a sigla do estado escolhido
      else
        puts "Número inválido!"
        pausa
        limpar_tela
        puts @table
      end
    end
  end
end

def pausa
  sleep(2)
end

def limpar_tela
  system("clear") || system("cls")
end

