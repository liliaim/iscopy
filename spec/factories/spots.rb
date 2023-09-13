FactoryBot.define do
  factory :spot do
    icon_id           { Faker::Number.between(from: 1, to: 7) }
    spot_name             { Faker::Travel::TrainStation.name(region: 'spain') }
    information                    { Faker::Travel::TrainStation.name(region: 'spain') }
    prefecture_id           { Faker::Number.between(from: 1, to: 47) }
    address                    { Faker::Address.city }
    latitude              { Faker::Number.decimal(l_digits: 2, r_digits: 8) }
    longitude                { Faker::Number.decimal(l_digits: 3, r_digits: 7)  }

    association :user

    # after(:build) do |plan|
    #   plan.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    # end

  end
end
