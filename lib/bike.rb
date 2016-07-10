class Bike
  
  attr_accessor :is_broken

  def initialize
    self.is_broken = false
  end

  def working?
    false
  end

end
