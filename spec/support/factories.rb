FactoryGirl.define do
  factory :vendor do
    sequence :email do |n|
      "vendor#{n}@example.com"
    end

    factory :o_auth_vendor do
      email "vendor@example.com"
    end
  end
end
