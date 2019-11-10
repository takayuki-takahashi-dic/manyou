require 'rails_helper'

RSpec.describe Task, type: :model do

  before do
    @task = FactoryBot.build(:task)
  end

  describe 'バリデーション' do
    it 'nameとemailどちらも値が設定されていれば、OK' do
      expect(@task.valid?).to eq(true)
    end
  end

end
