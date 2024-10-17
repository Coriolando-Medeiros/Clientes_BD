require_relative 'models/cliente'
require_relative 'models/fornecedor'
require 'terminal-table'


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
