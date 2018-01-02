require 'rails_helper'

describe BestBuyService do
  describe "#instance_methods" do
    describe "#find_all_stores(zip_code)" do
      it "returns a list of 10 stores" do
        VCR.use_cassette("BestBuyService#find_all_stores") do
          service = BestBuyService.new
          zip_code = "80202"

          stores = service.find_all_stores(zip_code)[:stores]
          expect(stores.count).to eq 10
        end
      end
    end
  end
end
