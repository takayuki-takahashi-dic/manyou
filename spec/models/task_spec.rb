require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'バリデーション' do
    t = "t"
    it "titleが空ならバリデーションが通らない" do
      task = Task.new(title: '', content: '')
      expect(task).not_to be_valid
    end
    it "titleが51文字以上ならバリデーションが通らない" do
      task = Task.new(title: t * 51 , content: '')
      expect(task).not_to be_valid
    end
    it "contentが256文字以上ならバリデーションが通らない" do
      task = Task.new(title: t * 51, content: t * 256)
      expect(task).not_to be_valid
    end
    it "titleが50文字以内かつcontentが255文字以内で記載されていればバリデーションが通る" do
      task = Task.new(title: t * 50, content: t * 255)
      expect(task).to be_valid
    end
  end

  describe '検索' do
    before(:all) do
      15.times {@task = FactoryBot.create(:task)}
    end
    after(:all) do
      DatabaseCleaner.clean_with(:truncation)
    end
    context '検索フォームのみ' do
      it '任意の文字列がtitleカラムかcontentカラムにあればその情報を出力する' do
      end
    end
    context 'ラジオボタンのみ' do
    end
    context 'プルダウンのみ' do
    end
    context '検索フォーム + ラジオボタン' do
    end
    context '検索フォーム + プルダウン' do
    end
    context 'プルダウン + ラジオボタン' do
    end
    context '検索フォーム + プルダウン + ラジオボタン' do
    end
    context '何も選択されていない' do
    end
  end




end
