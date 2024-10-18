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
            base.extend(MetodosClasse)
            base.include(MetodosInstancia)

            base.class_variable_set(:@@nome_tabela, DIO::tabela(base)) unless base.class_variable_defined?(:@@nome_tabela)
            tabela = base.class_variable_get(:@@nome_tabela)
            dados = Infra::Db.new.execute("desc #{tabela}")
            atributos = dados.map{|dado| dado["Field"]}
            atributos.each do |atributo|
                base.define_method("#{atributo}=") do |valor|
                    instance_variable_set("@#{atributo}", valor)
                end

                base.define_method("#{atributo}") do
                    instance_variable_get("@#{atributo}")
                end
            end
            self.extend(MetodosClasse)
        end

        module MetodosInstancia
            def incluir(atributos = {})
              self.class.class_variable_set(:@@nome_tabela, DIO::tabela(self.class)) unless self.class.class_variable_defined?(:@@nome_tabela)
              tabela = self.class.class_variable_get(:@@nome_tabela)
          
              colunas = []
              params = []
          
              atributos.each do |coluna, valor|
                colunas << coluna.to_s
                instance_variable_set("@#{coluna}", valor)
                params << valor
              end
          
              sql = "insert into #{tabela}(#{colunas.join(",")}) values(#{(['?'] * colunas.size).join(",")})"
          
              Infra::Db.new.execute(sql, params)
            end

            def editar(id, atributos = {})
                self.class.class_variable_set(:@@nome_tabela, DIO::tabela(self.class)) unless self.class.class_variable_defined?(:@@nome_tabela)
                tabela = self.class.class_variable_get(:@@nome_tabela)

                set_clauses = []
                params = []

                atributos.each do |coluna, valor|
                    set_clauses << "#{coluna} = ?"
                    params << valor
                end

                params << id

                debugger
                sql = "UPDATE #{tabela} SET #{set_clauses.join(", ")} WHERE id = ?"

                Infra::Db.new.execute(sql, params)
            end
        end
          
        module MetodosClasse
            def todos
                self.class_variable_set(:@@nome_tabela, DIO::tabela(self)) unless self.class_variable_defined?(:@@nome_tabela)
                tabela = self.class_variable_get(:@@nome_tabela)

                dados = Infra::Db.new.execute("select * from #{tabela}")
                clientes = []
                dados.each do |dado|
                    obj = self.new
                    obj.methods.each do |method|
                        if method.to_s.end_with?("=")
                            key = method.to_s.chomp("=")
                            obj.send("#{key}=", dado[key])
                        end
                    end
                    clientes << obj
                end
                return clientes
            end
        end
    end
end