FactoryGirl.define do
  factory :vendor do
    email "vendor@example.com"
    factory :full_vendor do
      first_name "FName"
      last_name "LName"
      business_name "BName"
      product_description "We sell handcrafted jewelry."
      street_address "1234 Main Street"
      city "Denver"
      state "CO"
      zip "12345"
    end
  end

  factory :event do
    sequence :name do |n|
      "Event #{n}"
    end

    sequence :season, ['fall', 'spring'].cycle do |season|
      season
    end

    date Date.today
  end
end
