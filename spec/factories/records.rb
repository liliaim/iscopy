FactoryBot.define do
  factory :record do
    destination             { Faker::Travel::TrainStation.name(region: 'spain') }
    text                    { Faker::Travel::TrainStation.name(region: 'spain') }
    prefecture_id           { Faker::Number.between(from: 1, to: 47) }
    city                    { Faker::Address.city }
    start_date              { Faker::Date.between(from: '2023-10-01', to: '2023-12-31') }
    end_date                { Faker::Date.between(from: start_date, to: '2023-12-31') }

    association :user

    # after(:build) do |plan|
    #   plan.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    # end


  end
end
