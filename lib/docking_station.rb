require_relative 'bike'

class DockingStation
  def initialize
    @bikes = []
  end

  attr_reader :bike
  def release_bike
    if @bikes = []
      fail "bikes not available"
      @bikes.pop
    end
    #Bike.new
  end

  def dock(bike)
    if @bikes.count >= 20
      fail "Station is full!"
    else
      @bikes << bike
    end
  end
end
