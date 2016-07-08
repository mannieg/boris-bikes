require 'docking_station'
require 'bike'

describe DockingStation do
  it {is_expected.to respond_to :release_bike}

  #it { is_expected.to respond_to(:initialize).with(1).argument }

  describe '#initialize' do
    it 'should not error' do
      expect{ DockingStation.new(40) }.to_not raise_error
    end
    it 'should return default capacity' do
      expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end
  end

  describe '#release_bike' do
    it "should raise 'no bike error'" do
      expect{ subject.release_bike }.to raise_error "bikes not available"
    end
  end

  describe '#dock' do
    it "should raise 'no docking space' error" do
      subject.capacity.times { subject.dock(Bike.new) }
      expect{ subject.dock(Bike.new) }.to raise_error "Station is full!"
    end
  end

  it 'checks bike is working?' do
    bike = Bike.new
    expect(bike).to be_working
  end
  it { is_expected.to respond_to(:dock).with(2).argument }
  #it { is_expected.to respond_to :bikes }

  describe '#release_bike' do
    it "Should not release the broken bike" do
      broken_bike = Bike.new
      subject.dock(broken_bike, true)
      expect{subject.release_bike}.to raise_error "bikes not available"
    end
  end
end
