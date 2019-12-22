FactoryBot.define do
  factory :tagging do
    sequence(:task_id) { |n| n }
    sequence(:tag_id, [1, 2, 3].cycle)
  end
end
