FactoryBot.define do
  factory :task do
    sequence(:title) { |n| "TEST_TITLE#{n}"}
    sequence(:content) { |n| "TEST_CONTENT#{n}"}
    deadline { "20191231" }
    status { 0 }
    priority { 1 }

  end
end
