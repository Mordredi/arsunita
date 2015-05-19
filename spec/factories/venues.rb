FactoryGirl.define do
  factory :venue do
    num_of_seats 100
    name "Factory"
    description "Specializing in Canadian Theatre"
    user nil
    address_one "125 Bathurst St"
    address_two ""
    city "Toronto"
    province "Ontario"
    country "Canada"
    latitude "9.99"
    longitude "9.99"
  end

end
