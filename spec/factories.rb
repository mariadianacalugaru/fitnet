FactoryBot.define do
    require 'faker'

    factory :user, class: User do
        firstname {Faker::Name.first_name}
        lastname {Faker::Name.last_name}
        email {Faker::Internet.safe_email}
        password {"user2000"}
        gender {"M"}
        pt {false}
        admin {false}
    end

    factory :pt, class: User do
        firstname {Faker::Name.first_name}
        lastname {Faker::Name.last_name}
        email {Faker::Internet.safe_email}
        password {"pt2000"}
        gender {"M"}
        pt {true}
        admin {false}
    end

    factory :admin, class: User do
        firstname {Faker::Name.first_name}
        lastname {Faker::Name.last_name}
        email {Faker::Internet.safe_email}
        password {"admin2000"}
        gender {"M"}
        pt {false}
        admin {true}
    end

    factory :review do
       body {"One of the best fitness applications I've ever tried!"}
       user_id {FactoryBot.create(:user).id}
    end

    factory :request do
        user_id {FactoryBot.create(:user).id}
        age {25}
        height {190}
        weight {90}
        abs {true}
        biceps {false}
        cardio {false}
        glutes {true}
        hamstrings {true}
        pectorals {false}
        quads {true}
        triceps {true}
        pt_id {FactoryBot.create(:pt)}
     end
     
end
