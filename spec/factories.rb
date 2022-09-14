FactoryBot.define do

    factory :user, class: User do
        firstname {"Andrea"}
        lastname {"Bianchi"}
        email {"andrea@gmail.com"}
        password {"andrea2000"}
        gender {"M"}
        pt {false}
        admin {false}
    end

    factory :pt, class: User do
        firstname {"Marco"}
        lastname {"Marini"}
        email {"marco@gmail.com"}
        password {"marco2000"}
        gender {"M"}
        pt {true}
        admin {false}
    end

    factory :admin, class: User do
        firstname {"Mario"}
        lastname {"Rossi"}
        email {"mario@gmail.com"}
        password {"mario2000"}
        gender {"M"}
        pt {false}
        admin {true}
    end

    factory :review do
       body {"One of the best fitness applications I've ever tried!"}
       user_id {FactoryBot.create(:user)}
    end

    factory :request do
        user_id {FactoryBot.create(:user)}
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
