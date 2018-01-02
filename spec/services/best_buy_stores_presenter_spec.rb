require 'rails_helper'

describe BestBuyStoresPresenter do
  describe "#instance_methods" do
    let(:service) { BestBuyService.new }
    describe ".all_stores" do
      it "returns store objects" do
        VCR.use_cassette("BestBuyStoresPresenter#all_stores") do
        presenter = BestBuyStoresPresenter.new("80202")
        stores = presenter.all_stores

        expect(stores.first).to be_a Store
        end
      end
    end

    describe ".total_stores" do
      it "captures the total_stores from the api_call" do
        VCR.use_cassette("BestBuyStoresPresenter#total_stores") do
          presenter = BestBuyStoresPresenter.new("80202")
          expect(presenter.total_stores).to eq 17
        end
      end
    end
  end
end
