require 'docking_station'
require 'bike'

describe DockingStation do
  it {is_expected.to respond_to :release_bike}

  describe '#release_bike' do
    it "should raise 'no bike error'" do
      @bikes = nil
      expect{subject.release_bike}.to raise_error "bikes not available"
    end
  end

  describe '#dock' do
    it 'docks a bike' do
      bike = Bike.new
      subject.dock(bike)

      expect(subject.bikes).to be_kind_of Array

    end

    it "should raise 'no docking space' error" do
      20.times { subject.dock(Bike.new) }
      expect{ subject.dock(Bike.new) }.to raise_error "Station is full!"
    end
  end

  it 'checks bike is working?' do
    bike = Bike.new
    expect(bike).to be_working
  end
  it { is_expected.to respond_to(:dock).with(1).argument }
  it { is_expected.to respond_to :bikes}

end

describe 'release_bike' do
  it 'releases a working bike' do
  end
end
