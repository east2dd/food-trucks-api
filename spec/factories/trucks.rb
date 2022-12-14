FactoryBot.define do
  factory :truck do
    sequence(:locationid) { |num| num }
    applicant { Faker::Name.name }
    facilitytype { ['Truck', 'Push Cart'].sample }
    cnn { 10000 }
    locationdescription { Faker::Lorem.sentence }
    address { '120 02ND ST' }
    blocklott { '3722002' }
    block { '3722' }
    lot { '002' }
    permit { '22MFF-00044' }
    status { ['APPROVED', 'REQUESTED', 'EXPIRED'].sample }
    fooditems { 'Filipino fusion food: taco: burrito: nachos: rice plates' }

    trait :approved do
      status { 'APPROVED' }
    end
  end
end
