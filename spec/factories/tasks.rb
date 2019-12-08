  FactoryBot.define do
  factory :task, class: Task do
    sequence(:title) { |n| "TEST_TITLE#{n}"}
    sequence(:content) { |n| "TEST_CONTENT#{n}"}
    sequence(:deadline, Date.today + 1)
    sequence(:status, [0, 1, 2].cycle)
    sequence(:priority, [0, 1, 2].cycle)

    # シンプル設定
    # deadline { "20191231" }
    # status { 0 }
    # priority { 1 }

    # sequence(:color, %w[red green blue].cycle)
    # # red green blue がこの順番で延々繰り返される。
    # sequence(:reserve_on, Date.today)
    # # 今日、明日、明後日、という感じで順に生成される。

  end
end

FactoryBot.define do
factory :admin_task, class: Task do
  sequence(:title) { |n| "TEST_TITLE#{n}"}
  sequence(:content) { |n| "TEST_CONTENT#{n}"}
  sequence(:deadline, Date.today + 1)
  sequence(:status, [0, 1, 2].cycle)
  sequence(:priority, [0, 1, 2].cycle)
  user_id { 16 }

  # シンプル設定
  # deadline { "20191231" }
  # status { 0 }
  # priority { 1 }

  # sequence(:color, %w[red green blue].cycle)
  # # red green blue がこの順番で延々繰り返される。
  # sequence(:reserve_on, Date.today)
  # # 今日、明日、明後日、という感じで順に生成される。

end
end
