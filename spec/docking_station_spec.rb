require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to(:release_bike)}

  describe '#release_bike' do
    it 'releases a bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end
  end

  describe '#release_bike' do
    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
  end

  it { is_expected.to respond_to(:dock).with(1).arguments}

  it { is_expected.to respond_to(:bikes) }

  describe '#dock' do
    it 'return a bike' do
      subject.dock(Bike.new)
      expect(subject.bikes).to be_kind_of(Array)
    end
  end

  describe '#dock' do
    it 'raises an error when more than one bike is docked' do
      #puts subject.DEFAULT_CAPACITY
      DockingStation::DEFAULT_CAPACITY.times { subject.dock(Bike.new) }
      expect { subject.dock(Bike.new)}.to raise_error 'Docking Station full'
    end
  end

#  it { expect(subject.release_bike).to raise_error("Sorry no bike is available!") }
end
