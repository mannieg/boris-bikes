require_relative 'bike'

class DockingStation

  DEFAULT_CAPACITY = 20

  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    return_unbroken_bike
  end

  def dock(bike, broken = false)
      fail "Station is full!" if full?
      bike.is_broken = broken # Maybe implementation change so user can call direcly from Bikes class instead
      @bikes << bike
  end

  private

    attr_reader :bikes

    def full?
      @bikes.count >= @capacity
    end

    def empty?
      @bikes.empty?
    end

    def return_unbroken_bike
      @bikes.each { |bike| return bike unless bike.is_broken }
      fail "bikes not available"
    end

end
