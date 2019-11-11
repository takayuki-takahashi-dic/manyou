require 'rails_helper'

RSpec.describe Task, type: :system do
  describe 'タスク一覧画面' do
    context 'タスクを作成した場合' do
      it '作成済みのタスクが表示されること' do
      @task = FactoryBot.create(:task)
      visit tasks_path
      expect(page).to have_content 'TEST_TITLE'
      end
    end
  end

  describe 'タスク登録画面' do
    context '必要項目を入力して、createボタンを押した場合' do
      it 'データが保存されること' do
        visit new_task_path
        fill_in 'Title', with: 'TEST_TITLE' #
        fill_in 'Content', with: 'TEST_CONTENT'
        click_on 'Create Task' #
        expect(page).to have_content 'TEST_TITLE'
        # <%= form.label :title %>が生成した
        # <label for="task_title">Title</label>の
        # 'Title'にwith: 'TEST_TITLE'をfill_in

        # <%= form.submit %>が生成した
        # <input type="submit" name="commit" value="Create Task" data-disable-with="Create Task">に
        # click_on 'Create Task'

        end
      end
    end

  describe 'タスク詳細画面' do
     context '任意のタスク詳細画面に遷移した場合' do
       it '該当タスクの内容が表示されたページに遷移すること' do


       visit tasks_path
       first(:link, 'Show').click
       expect(page).to have_content 'TITLE1'
       end

     end
  end


end
