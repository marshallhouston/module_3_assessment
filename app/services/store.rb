class Store
  attr_reader :name, :city, :distance, :phone_number, :store_type

  def initialize(attrs)
    @name = attrs[:longName]
    @city = attrs[:city]
    @distance = attrs[:distance]
    @phone_number = attrs[:phone]
    @store_type = attrs[:storeType]
  end

end
