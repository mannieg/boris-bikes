require 'docking_station'

describe DockingStation do
  it {is_expected.to respond_to :release_bike}

  describe '#release_bike' do
    it "should raise 'no bike error'" do
      @bike = nil
      expect{subject.release_bike}.to raise_error "bikes not available"
    end
  end

  describe '#dock(bike)' do
    it 'docks a bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.bike).to eq bike
    end

    it "should raise 'no docking space' error" do
      bike1 = Bike.new
      subject.dock(bike1)
      bike2 = Bike.new
      expect{subject.dock(bike2)}.to raise_error "Docking station is full!"
    end
  end

  it 'checks bike is working?' do
    bike = Bike.new
    expect(bike).to be_working
  end
  it { is_expected.to respond_to(:dock).with(1).argument }
  it { is_expected.to respond_to :bike}

describe 'release_bike' do
  it 'releases a working bike' do
  end
end
