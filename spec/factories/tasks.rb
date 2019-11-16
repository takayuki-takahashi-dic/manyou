FactoryBot.define do
  factory :task do
    # 下記の内容は実際に作成するカラム名に合わせて変更してください
    sequence(:title) { |n| "TEST_TITLE#{n}"}
    sequence(:content) { |n| "TEST_CONTENT#{n}"}
    deadline { "20191231" }
    status { 0 }
    priority { 1 }

  end
end
