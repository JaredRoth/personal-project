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

  factory :city do |n|
    sequence :name, [ 'Carlsbad',
                      'Encinitas',
                      'Escondido',
                      'Fallbrook',
                      'Oceanside',
                      'Vista',
                      'San Marcos'].cycle do |name|
      name
    end
    sequence :description do |n|
      "This Event has #{n} vendors"
    end
  end

  factory :event do
    sequence :title do |n|
      "Event #{n}"
    end

    sequence :season, ['fall', 'spring'].cycle do |season|
      season
    end

    sequence :days, [1, 2].cycle do |days|
      days
    end

    date Date.today
    city
  end
end
