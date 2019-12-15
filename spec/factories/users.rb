FactoryBot.define do
  factory :user,class: User do
    sequence(:name) { |n| "TEST_NAME#{n}"}
    sequence(:email) { |n| "#{n}@test.com"}
    password { "111111" }
    password_confirmation { "111111" }
  end

end

FactoryBot.define do
factory :admin_user,class: User do
  name { "TEST_ADMIN"}
  email { "admin@test.com" }
  password { "111111" }
  password_confirmation { "111111" }
  admin { true }
end
end
