require_relative 'models/cliente'
require 'terminal-table'


clientes = Models::Cliente.new

clientes = Models::Cliente.todos

rows = []

clientes.each do |cliente|
  rows << [cliente.nome]
end

table = Terminal::Table.new :title => "Lista de Clientes", :headings => ['Nome'], :rows => rows

puts table