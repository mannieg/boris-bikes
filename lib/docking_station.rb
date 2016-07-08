require_relative 'bike'

class DockingStation
  def initialize
    @bikes = []
  end

  attr_reader :bikes
  def release_bike
    fail "bikes not available" if empty?
    @bikes.pop
  end

  def dock(bike)
      fail "Station is full!" if full?
      @bikes << bike
  end
  private
    def full?
      @bikes.count >= 20
    end
    def empty?
      @bikes.empty?
    end
end
