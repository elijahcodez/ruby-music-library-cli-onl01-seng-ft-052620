module Concerns

    module Findable
        
            def find_by_name(name)
                self.all.detect{|element| element if element.name == name}
            end
            
            def find_or_create_by_name(element)
                self.find_by_name(element) ? self.find_by_name(element) : self.create(element)
            end
    end


end