FactoryBot.define do
  factory :item do
    sequence(:name) {|n| "Item #{n}" }
    description "Dead dove. Do not eat."
    image_url "http://robohash.org/1.png?set=set2&bgset=bg1&size=200x200"
  end
end
