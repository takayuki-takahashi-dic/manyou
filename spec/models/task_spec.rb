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
end
