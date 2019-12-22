require 'rails_helper'
# bin/rspec ./spec/models/task_spec.rb

RSpec.describe Task, type: :model do
  describe 'バリデーション' do
    before do
      @user = create(:admin_user)
    end

    context 'title/content' do
      t = "t"
      it "titleが50文字以内かつcontentが255文字以内で記載されていればバリデーションが通る" do
        task = Task.new(title: t * 50 , content: t * 255, deadline: Date.today + 1, status: 1, priority: 1, user_id: @user.id)
        expect(task).to be_valid
      end
      it "titleが空ならバリデーションが通らない" do
        task = Task.new(title: '', content: '', deadline: Date.today + 1, status: 1, priority: 1, user_id: @user.id)
        expect(task).not_to be_valid
      end
      it "titleが51文字以上ならバリデーションが通らない" do
        task = Task.new(title: t * 51 , content: '', deadline: Date.today + 1, status: 1, priority: 1, user_id: @user.id)
        expect(task).not_to be_valid
      end
      it "contentが256文字以上ならバリデーションが通らない" do
        task = Task.new(title: t * 50 , content: t * 256, deadline: Date.today + 1, status: 1, priority: 1, user_id: @user.id)
        expect(task).not_to be_valid
      end
    end
    context 'deadline' do
      it "deadlineがタスク作成日よりも早い場合、バリデーションが通らない" do
        task = Task.new(title: "t",
                        content: "t",
                        deadline: Date.today - 1,
                        status: 2,
                        priority: 1,
                        user_id: @user.id )
        expect(task).not_to be_valid
      end
    end
  end

  describe '検索' do
    before(:all) do
      # 15.times {@task = create(:task)}
      15.times { @user = create(:user) do |u|
            u.tasks.create(attributes_for(:task))
          end
        }
    end
    after(:all) do
      DatabaseCleaner.clean_with(:truncation)
    end

    context '文字列入力フォームの検索' do
      it 'titleに"1"が含まれる要素のみ取得する' do
        search_params = {title: "1", status: "", priority: "" }
        expect(Task.search(search_params)).to include(Task.find(1))
        expect(Task.search(search_params).count).to be 7
        expect(Task.search(search_params)).to_not include(Task.find(2))
      end
    end
    context 'ステータスの検索' do
      it 'statusが"completed"の要素のみ取得する' do
        search_params = {title: "", status: "completed", priority: "" }
        expect(Task.search(search_params)).to include(Task.find(3))
        expect(Task.search(search_params)).to_not include(Task.find(2))
      end
    end
    context '優先順位の検索' do
      it 'priority"middle"の要素のみ取得する' do
        search_params = {title: "", status: "", priority: "middle" }
        expect(Task.search(search_params)).to include(Task.find(2))
        expect(Task.search(search_params)).to_not include(Task.find(3))
      end
    end
    context '何も選択されていない場合' do
      it '検索パラメータが空の場合、全ての要素を取得する' do
        search_params = {title: "", status: "", priority: "" }
        expect(Task.search(search_params).count).to be 15
      end
    end
  end
  describe 'タグ検索' do
    before(:all) do
      15.times { @user = create(:user) do |u|
            u.tasks.create(attributes_for(:task))
          end
        }

        Tag.create!(
          [
            {title: "赤"},
            {title: "青"},
            {title: "黄"},
            ]
          )
      @user = create(:admin_user)
      15.times {@task = create(:admin_task) do |t|
                t.taggings.create(attributes_for(:tagging))
            end
            }
    end
    after(:all) do
      DatabaseCleaner.clean_with(:truncation)
    end
    it 'タグ"赤"の要素のみ取得する' do
      search_params = {title: "", status: "", priority: "", tag_ids: 1 }
      expect(Task.search(search_params)).to include(Task.find(16))
      expect(Task.search(search_params)).to_not include(Task.find(17))
    end
  end

end
