require 'rails_helper'

# When I send a GET request to `/api/v1/items/1`
# I receive a 200 JSON response containing the id, name, description, and image_url but not the created_at or updated_at

describe "Items API" do
  describe "get /api/v1/items/:id" do
    it "returns the item with id, name, description, image_url as JSON with status code 200" do
      item = create(:item)

      get "/api/v1/items/#{item.id}"

      result = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq 200
      expect(result[:id]).to eq item.id
      expect(result[:name]).to eq item.name
      expect(result[:description]).to eq item.description
      expect(result[:image_url]).to eq item.image_url
      expect(result).to_not have_key(:created_at)
      expect(result).to_not have_key(:updated_at)
    end
  end
end
