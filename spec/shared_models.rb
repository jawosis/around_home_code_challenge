shared_examples 'addressable' do
  it 'sets latitude and longitude' do
    addressable.validate
    expect(addressable.latitude).to_not be_nil
    expect(addressable.longitude).to_not be_nil
  end
end
