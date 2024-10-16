require_relative 'models/cliente'
require 'terminal-table'


clientes = Models::Cliente.new

clientes = Models::Cliente.todos

rows = []

rows = clientes.map do |cliente|
  [cliente.id, cliente.nome, cliente.telefone, cliente.cpf]
end

table = Terminal::Table.new(
     :title => "Lista de Clientes",
     :headings => ['ID', 'Nome', 'Telefone', 'CPF'],
     :rows => rows
)

puts table