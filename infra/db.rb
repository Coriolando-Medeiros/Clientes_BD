require 'mysql2'
require 'yaml'
require 'erb'
require 'byebug'

module Infra
  class Db
    def initialize
      env = ENV["APP_ENV"] || "dev"

      yaml_content = ERB.new(File.read('config/database.yml')).result
      db_config = Psych.safe_load(yaml_content, aliases: true)
      config = db_config[env]

      @client = Mysql2::Client.new(
        host: config['host'],
        username: config['user'],  # Alterado de 'root' para 'user'
        password: config['password'],  # Alterado de 'root' para 'password'
        database: config['database']
      )
    end

    def execute(sql, params = [])
      begin
        statement = @client.prepare(sql)
        result = statement.execute(*params)
        return result.to_a
      rescue Mysql2::Error => e
        puts "Erro ao executar a consulta: #{e.message}"
        nil  # Retorna nil se houver um erro
      ensure
        statement.close if statement
      end
    end
  end
end
