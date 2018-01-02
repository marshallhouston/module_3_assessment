require 'rails_helper'

# When I send a DELETE request to `/api/v1/items/1`
# I receive a 204 JSON response if the record is successfully deleted

describe "Items API" do
  describe "delete /api/v1/items/:id" do
    it "returns a 204 JSON response if the record is successfully deleted" do
      item = create(:item)

      header = { 'CONTENT_TYPE':'application/json' }

      expect {
        delete "/api/v1/items/#{item.id}", headers: header
      }.to change(Item, :count).by(-1)

      expect(response.status).to eq 204
    end

    xit "returns a 404 JSON response if the record is not successfully deleted" do
      header = { 'CONTENT_TYPE':'application/json' }

      delete "/api/v1/items/2", headers: header

      expect(response.status).to eq 404
    end
  end
end
