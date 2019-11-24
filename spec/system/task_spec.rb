require 'rails_helper'
# $ bin/rspec ./spec/system/task_spec.rb

RSpec.describe Task, type: :system do
  before(:all) do
    15.times {@task = create(:task)}
  end
  after(:all) do
    DatabaseCleaner.clean_with(:truncation)
  end

  describe 'タスク一覧画面/index' do
    context 'タスクを作成した場合' do
      it '作成済みのタスクが表示されること' do
        visit tasks_path
        expect(page).to have_content 'TEST_TITLE'
      end
    end
    context 'タスクが作成日時の降順に並んでいるかのテスト' do
      it '最初のshowlinkをクリックすると、最後に作成したタスクの内容が表示されたページに遷移すること' do
        visit tasks_path
        first(:link, '詳細').click
        expect(page).to have_content 'TEST_TITLE15'
      end
    end

    context 'フォーム検索結果が表示されているかのテスト' do
      it 'フォームに文字列を入力し、検索ボタンをクリックすると、
      tilteカラムで同じ文字列を持つ情報のみを表示すること' do
        visit tasks_path
        fill_in 'title', with: '7' #
        click_on '検索' #
        expect(page).to have_content 'TEST_TITLE7'
        expect(page).to_not have_content 'TEST_TITLE8'

      end
    end
    context 'フォーム検索結果が表示されているかのテスト' do
      it 'フォームに文字列を入力し、検索ボタンをクリックすると、
      contentカラムで同じ文字列を持つ情報のみを表示すること' do
        visit tasks_path
        fill_in 'title', with: '6' #
        click_on '検索' #
        expect(page).to have_content 'TEST_CONTENT6'
        expect(page).to_not have_content 'TEST_CONTENT7'
      end
    end
  end

  describe 'タスク登録画面/new' do
    context '必要項目を入力して、createボタンを押した場合' do
      before do
        visit new_task_path
        fill_in 'タイトル', with: 'TEST_TITLE' #
        fill_in '詳細', with: 'TEST_CONTENT'
      end
      it 'タイトルと詳細に入力して、新規作成を押すとデータが保存されること' do
        click_on '新規作成' #
        expect(page).to have_content 'TEST_CONTENT'
        # <%= form.label :title %>が生成した<label for="task_title">Title</label>の
        # 'Title'にwith: 'TEST_TITLE'をfill_in
        # <%= form.submit %>が生成した<input type="submit" name="commit" value="Create Task" data-disable-with="Create Task">に
        # click_on 'Create Task'
      end
      it 'ステータスの選択フォームで選択した項目のデータが保存されること' do
        select '完了', from: 'ステータス'
        click_on '新規作成'
        expect(page).to have_content '完了'
      end
      it '終了期日の選択フォームで選択した項目のデータが保存されること' do
        select '2020', from: 'task[deadline(1i)]'
        click_on '新規作成'
        expect(page).to have_content '2020'
      end
      it '終了期日の選択フォームで選択した項目のデータが保存されること' do
        select '高', from: '優先順位'
        click_on '新規作成'
        expect(page).to have_content '高'
      end
    end
  end

  describe 'タスク詳細画面/show' do
    context '任意のタスク詳細画面に遷移した場合' do
      it '該当タスクの内容が表示されたページに遷移すること' do
        visit tasks_path
        all('tbody tr').last.click_link '詳細'
        expect(page).to have_content 'TEST_CONTENT6'
      end
    end
  end

  describe '終了期限のテスト' do
    context '終了期限でソートした場合' do
      it '終了期限の▲をクリックすると、終了期限が早い順にソートされる。' do
        visit tasks_path
        click_on 'deadline▲'
        sleep 2
        first(:link, '詳細').click
        expect(page).to have_content 'TEST_TITLE1'
        # expect(find(.css_class_id) 取得要素を限定する
      end
      it '終了期限の▼をクリックすると、終了期限が遅い順にソートされる。' do
        visit tasks_path
        click_on 'deadline▼'
        sleep 2 #ロードを待つため
        first(:link, '詳細').click
        expect(page).to have_content 'TEST_TITLE15'
        # expect(all('div.container')).to have_content 'TEST_TITLE15'
      end
    end
  end

  describe 'ステータスのテスト'
    context 'ステータスで検索した場合'
      it 'セレクトボックスで”完了”を選択し、検索ボタンをクリックすると、
      ”完了”のステータスを持つ情報のみがindexに表示される' do
        visit tasks_path
        select '完了', from: 'status'
        click_button '検索'
        expect(find('.table-responsive')).to have_content '完了'
        expect(find('.table-responsive')).to_not have_content '着手'
        # find('.table-responsive') テーブル要素の中身を検索
      end
end
