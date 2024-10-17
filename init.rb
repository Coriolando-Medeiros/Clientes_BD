require_relative 'models/cliente'
require_relative 'models/fornecedor'
require 'terminal-table'
require 'colorize'

def limpar_tela
  system("clear") || system("cls")
end

def clientes
  clientes = Models::Cliente.todos
  rows = clientes.map do |cliente|
    [cliente.id, cliente.nome, cliente.telefone, cliente.cpf]
  end
  table = Terminal::Table.new(
      :title => "Lista de Clientes",
      :headings => ['ID', 'Nome', 'Telefone', 'CPF'],
      :rows => rows
  )
  puts table
end

def fornecedores
  fornecedores = Models::Fornecedor.todos
  rows = fornecedores.map do |fornecedor|
    [fornecedor.id, fornecedor.nome, fornecedor.telefone, fornecedor.cnpj, fornecedor.endereco]
  end

  table = Terminal::Table.new(
      :title => "Lista de Fornecedores",
      :headings => ['ID', 'Nome', 'Telefone', 'CNPJ', 'Endereço'],
      :rows => rows
  )
  puts table
end

def infos_cliente
  cliente = Models::Cliente.new
  puts "Adicionar Cliente"
  print "Nome: "
  nome = gets.chomp.capitalize
  print "Tel: "
  telefone = gets.chomp
  print "CPF: "
  cpf = gets.chomp
  cliente.incluir
end

def menu
  loop do
    limpar_tela
    puts "🌟" + " " * 18 + "Menu" + " " * 18 + "🌟".red
    puts " " * 6 + "========================".blue
    puts " " * 6 + "1 - Adicionar Cliente".light_blue
    puts " " * 6 + "1 - Adicionar Fornecedor".light_blue
    puts " " * 6 + "3 - Listar Clientes".light_blue
    puts " " * 6 + "4 - Listar Fornecedores".light_blue
    puts " " * 6 + "0 - Sair".light_red
    puts " " * 6 + "========================".blue
    print "Opção: ".green
    opcao = gets.chomp.to_i

    if opcao == 1
      limpar_tela
      infos_cliente
    elsif opcao == 2
      limpar_tela
      puts "Em implementação"
    elsif opcao == 3
      limpar_tela
      clientes
    elsif opcao == 4
      limpar_tela
      fornecedores
    elsif opcao == 0
      limpar_tela
      puts "Saindo...".light_red
      return
    else
      limpar_tela
      puts "Opção inválida! Tente novamente.".light_red
    end
  end
end

menu