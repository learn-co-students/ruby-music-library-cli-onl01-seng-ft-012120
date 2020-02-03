module Concerns::Findable
    #module ClassMethods
        def find_by_name(name)
            all.detect{|a| a.name == name}
        end

        def find_or_create_by_name(name)
            name_var = ''
            if find_by_name(name)
              name_var =  find_by_name(name)
            else 
              name_var = self.create(name)
            end
            name_var
        end


    #end
end
