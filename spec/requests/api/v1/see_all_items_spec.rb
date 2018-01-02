require 'rails_helper'

# When I send a GET request to `/api/v1/items`
# I receive a 200 JSON response containing all items
# And each item has an id, name, description, and image_url but not the created_at or updated_at

describe "Items API" do
  describe "get /api/v1/items" do
    it "returns a list of all items with id, name, description,and image_url as JSON" do
      items = create_list(:item, 3)

      get '/api/v1/items'

      result = JSON.parse(response.body, symbolize_names: true)
      item_1 = result.first

      expect(response.status).to eq 200
      expect(result.count).to eq 3
      expect(item_1).to have_key(:id)
      expect(item_1).to have_key(:name)
      expect(item_1).to have_key(:description)
      expect(item_1).to have_key(:image_url)
      expect(item_1).to_not have_key(:created_at)
      expect(item_1).to_not have_key(:updated_at)
    end
  end
end
