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
  nome = gets.chomp
  print "Tel: "
  telefone = gets.chomp
  print "CPF: "
  cpf = gets.chomp
  cliente.incluir(nome: nome, telefone: telefone, cpf: cpf)
  puts "Cliente incluido com sucesso!".green
end

def editar_cliente
  puts "Editar Cliente"
  clientes
  puts "Informe o ID do cliente a ser editado"
  print "Id: "
  id = gets.chomp.to_i
  cliente = Models::Cliente.todos.find { |c| c.id == id}

  if cliente.nil?
    puts "Cliente com ID #{id} não encontrado!"
    return
  end

  limpar_tela
  puts "Digite os novos dados do cliente"
  puts "(Enter) para manter"
  print "Nome (atual: #{cliente.nome}: )"
  novo_nome = gets.chomp
  novo_nome = cliente.nome if novo_nome.empty?

  print "Telefone (atual: #{cliente.telefone}: )"
  novo_telefone = gets.chomp
  novo_telefone = cliente.telefone if novo_telefone.empty?

  print "CPF (atual: #{cliente.cpf}: )"
  nvo_cpf = gets.chomp
  novo_cpf = cliente.cpf if novo_cpf.empty?

  cliente.editar(cliente.id, nome: novo_nome, telefone: novo_telefone, cpf: novo_cpf)
  puts "Cliente atualizado com sucesso!".green
end

def infos_fornecedor
  fornecedor = Models::Fornecedor.new
  puts "Adicionar fornecedor"
  print "Nome: "
  nome = gets.chomp.capitalize
  print "Tel: "
  telefone = gets.chomp
  print "CNPJ: "
  cnpj = gets.chomp
  print "Endereço: "
  endereco = gets.chomp.downcase
  print "Cidade: "
  cidade = gets.chomp.capitalize
  print "Estado: "
  estado = gets.chomp.capitalize
  endereco = "#{endereco} - #{cidade} - #{estado}"
  fornecedor.incluir(nome:nome, telefone: telefone, cnpj: cnpj, endereco: endereco)
end

def editar_fornecedor
  puts "Editar Fornecedor"
  fornecedores
  puts "Informe o ID do fornecedor a ser editado"
  print "Id: "
  id = gets.chomp.to_i
  fornecedor = Models::Fornecedor.todos.find { |f| f.id == id}

  if fornecedor.nil?
    puts "Fornecedor com ID #{id} não encontrado!"
    return
  end

  limpar_tela
  puts "Digite os novos dados do fornecedor"
  puts "(Enter) para manter"
  print "Nome (atual): #{fornecedor.nome}: "
  novo_nome = gets.chomp
  novo_nome = fornecedor.nome if novo_nome.empty?

  print "Telefone (atual): #{fornecedor.telefone}: "
  novo_telefone = gets.chomp
  novo_telefone = fornecedor.telefone if novo_telefone.empty?

  print "CNPJ (atual): #{fornecedor.cnpj}: "
  novo_cnpj = gets.chomp
  novo_cnpj = fornecedor.cnpj if novo_cnpj.empty?

  puts "Endereço (atual): #{fornecedor.endereco}"
  print "Novo endereço: "
  novo_endereco = gets.chomp
  novo_endereco = fornecedor.endereco if novo_endereco.empty?

  fornecedor.editar(fornecedor.id, nome: novo_nome, telefone: novo_telefone, cnpj: novo_cnpj, endereco: novo_endereco)
  puts "Fornecedor: #{fornecedor.novo_nome} atualizado com sucesso!".green
end

def proseguir
  puts "Enter para proseguir".blue
  gets
end

def menu
  loop do
    puts "🌟" + " " * 13 + "Menu" + " " * 13 + "🌟".red
    puts " " * 6 + "========================".blue
    puts " " * 6 + "=========Cliente========".light_blue
    puts " " * 6 + "1 - Adicionar Cliente".light_blue
    puts " " * 6 + "2 - Listar Clientes".light_blue
    puts " " * 6 + "3 - Editar Cliente".light_blue
    puts " " * 6 + "4 - Excluir Cliente".light_blue
    puts " " * 6 + "========Fornecedor======".light_blue
    puts " " * 6 + "5 - Adicionar Fornecedor".light_blue
    puts " " * 6 + "6 - Listar Fornecedores".light_blue
    puts " " * 6 + "7 - Editar Fornecedor".light_blue
    puts " " * 6 + "8 - Excluir Fornecedor".light_blue
    puts " " * 6 + "0 - Sair".light_red
    puts " " * 6 + "========================".blue
    print "Opção: ".green
    opcao = gets.chomp.to_i

    if opcao == 1
      limpar_tela
      infos_cliente
    elsif opcao == 2
      limpar_tela
      clientes
      proseguir
    elsif opcao == 3
      limpar_tela
      editar_cliente
      proseguir
    elsif opcao == 4
      limpar_tela
      puts "Em implementação"
      proseguir
    elsif opcao == 5
      limpar_tela
      infos_fornecedor
    elsif opcao == 6
      limpar_tela
      fornecedores
      proseguir
    elsif opcao == 7
      limpar_tela
      editar_fornecedor
      proseguir
    elsif opcao == 8
      limpar_tela
      puts "Em implementação"
      proseguir
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

