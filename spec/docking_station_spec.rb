require 'docking_station'

describe DockingStation do
  it {is_expected.to respond_to :release_bike}
  it "should raise 'no bike error'" do
    @bike = nil
    expect{subject.release_bike}.to raise_error "bikes not available"
  end
  it 'checks bike is working?' do
    bike = Bike.new
    expect(bike).to be_working
  end
  it { is_expected.to respond_to(:dock).with(1).argument }
  it { is_expected.to respond_to :bike}
  it 'docks a bike' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bike).to eq bike
  end
end
