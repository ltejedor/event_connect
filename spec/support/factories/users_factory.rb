FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@gmail.com" }
    first_name "Marcy"
    last_name "Hellbeast"
    username "MRocker2004"
    password "password123"
    password_confirmation "password123"
  end
end
