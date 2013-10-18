FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "foobar999"
    password_confirmation "foobar999"

    factory :auctioneer do
    	auctioneer true
    end
  end

  factory :item do
  	sequence(:name) { |n| "Item #{n}" }
  	reserved_price 10.00
  end

  factory :auction do
  	item
  	sequence(:name) { |n| "Auction #{n}" }
  end
end