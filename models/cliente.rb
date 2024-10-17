require_relative "../orm/dio"

module Models
  class Cliente
    @@nome_tabela = "clientes"
    include ORM::DIO
  end
end