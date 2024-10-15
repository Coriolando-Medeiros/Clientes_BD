require_relative 'infra/db'


db = Infra::Db.new
dados = db.execute("SELECT * FROM clientes")  # Corrija o nome da tabela se necessário
puts dados.inspect
