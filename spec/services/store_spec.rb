require 'rails_helper'

describe Store do
  it "initializes with attributes" do
    attrs = {:city=>"Denver",
    :distance=>3.45,
    :longName=>"Cherry Creek Shopping Center",
    :phone=>"303-270-9189",
    :storeType=>"Mobile SAS"}

    store = Store.new(attrs)

    expect(store.name).to eq("Cherry Creek Shopping Center")
    expect(store.city).to eq("Denver")
    expect(store.distance).to eq(3.45)
    expect(store.phone_number).to eq("303-270-9189")
    expect(store.store_type).to eq("Mobile SAS")
  end
end
