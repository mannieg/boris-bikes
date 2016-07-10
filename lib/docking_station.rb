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
      bike.is_broken = broken
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
      @bikes.each_with_index { |bike, i| return bikes.slice!(i) unless bike.is_broken }
      fail "bikes not available"
    end

end
