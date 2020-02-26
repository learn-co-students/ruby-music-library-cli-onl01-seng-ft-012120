module Persistable 
  def save 
    @@all << self 
  end
  
  def self.reset_all
    @@all.clear
  end
  
  def self.count 
    @@all.size
  end
end 