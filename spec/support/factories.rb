FactoryGirl.define do
  factory :vendor do
    email "vendor@example.com"
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
