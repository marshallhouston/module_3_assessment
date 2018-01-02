require 'rails_helper'

describe "Items API" do
  describe "post /api/v1/items" do
    context "with a name, description, and image_url" do
      it "returns the newly created item with a 201 status and id, name, description, and image_url" do

        header = { 'CONTENT_TYPE':'application/json' }

        expect {
          post "/api/v1/items", params: '{ "item": { "name":"New Item", "description":"keyboard", "image_url":"http://robohash.org/1.png?set=set2&bgset=bg1&size=200x200" } }', headers: header
        }.to change(Item, :count).by(1)

        expect(response.status).to eq 201
      end
    end
  end
end
