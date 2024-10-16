require 'json'
require 'byebug'
require_relative "../infra/db"

module ORM
    module DIO
        class << self
            def tabela(obj)
                obj.to_s.split("::").last.downcase + "s"
            end
        end

        def self.included(base)
            tabela = DIO::tabela(base)
            tabela = base.to_s.split("::").last.downcase + "s"
            dados = Infra::Db.new.execute("desc #{tabela}")
            atributos = dados.map{|dado| dado["Field"]}
            atributos.each do |atributo|
                define_method("#{atributo}=") do |valor|
                    instance_variable_set("@#{atributo}", valor)
                end

                define_method("#{atributo}") do
                    instance_variable_get("@#{atributo}")
                end
            end
            base.extend(MetodosClasse)
        end

        module MetodosClasse
            def todos
                tabela = DIO::tabela(self)
                dados = Infra::Db.new.execute("select * from #{tabela}")
                clientes = []
                dados.each do |dado|
                    obj = self.new
                    obj.methods.each do |method|
                        if method.to_s.end_with?("=")
                            key = method.to_s.chomp("=")
                            debugger
                            instance_variable_set("@#{key}", dado[key])
                        end
                    end
                    clientes << obj
                end
                
            end
        end
    end
end