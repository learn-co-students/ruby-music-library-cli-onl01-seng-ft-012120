module MyModule

  module ClassModule

    def destroy_all
      all.clear
    end

    def create(name)
      self.new(name).tap{|s| s.save}
    end

  end

  module InstanceModule
    attr_accessor :name

    def initialize(name)
      self.name= name
    end
   
    def save 
      self.class.all << self
    end

    
  end

 

end