require 'docking_station'
require 'bike'

describe DockingStation do

  # Double
  let(:bike) { double('bike', is_broken: false) }

  describe '#initialize' do
    it 'should not error where increasing capacity' do
      expect{ DockingStation.new(40) }.to_not raise_error
    end
    it 'should return default capacity' do
      expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end
  end

  describe '#release_bike' do
    it {is_expected.to respond_to :release_bike}

    it "should raise error when no bikes available" do
      expect{ subject.release_bike }.to raise_error "bikes not available"
    end

    it 'check bike is working after release' do
      allow(bike).to receive(:working?).and_return(true)
      subject.dock(bike)
      released_bike = subject.release_bike
      expect(released_bike).to be_working
    end

    it "Should not release a broken bike" do
      allow(bike).to receive(:is_broken).and_return(true)
      subject.dock(bike) # docked broken bike
      expect{subject.release_bike}.to raise_error "bikes not available"
    end
  end

  describe '#dock' do
    it { is_expected.to respond_to(:dock).with(1).argument }

    it "should raise 'no docking space' error" do
      subject.capacity.times { subject.dock(bike) }
      expect{ subject.dock(bike) }.to raise_error "Station is full!"
    end
  end
end
