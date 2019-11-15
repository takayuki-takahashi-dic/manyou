class Task < ApplicationRecord
  validates :title, presence: true, length: { maximum: 50 }
  validates :content, length: { maximum: 255 }
  enum status: { waiting: 0, working: 1, completed: 2 }
  enum priority: { low: 0, middle: 1, high: 2 }

  # def self.search(search)
  #     return Task.all unless search
  #     Task.where(['content LIKE ? OR title LIKE ?', "%#{search}%", "%#{search}%"])
  #     # 適切なオブジェクト名.where(['検索したいカラム名 ? OR 検索したいカラム名 LIKE ? OR 検索したいカラム名 LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%"])
  #     # User.where(‘kind = ? or name = ?‘, 0, ‘yamada’)
  # end

  def self.search(params)
    title       = params[:title]

    @tasks   = Task.all

    @tasks = @tasks.where("title like ?", "%#{title}%") if title.present?

    @tasks
  end

  # scope :search, -> (search_params) do
  #   return if search_params.blank?
  #
  #   title_like(search_params[:title])
  #     .status_is(search_params[:status])
  # #     .birthday_from(search_params[:birthday_from])
  # #     .birthday_to(search_params[:birthday_to])
  # #     .prefecture_id_is(search_params[:prefecture_id])
  # end
  # # nameが存在する場合、nameをlike検索する
  # scope :title_like, -> (title) { where('title LIKE ?', "%#{title}%") if title.present? }
  # # # gender_isが存在する場合、gender_isで検索する
  # scope :status_is, -> (status) { where(status: status) if status.present? }
  # # birthdayが存在する場合、birthdayで範囲検索する
  # scope :birthday_from, -> (from) { where('? <= birthday', from) if from.present? }
  # scope :birthday_to, -> (to) { where('birthday <= ?', to) if to.present? }
  # # prefecture_idが存在する場合、prefecture_idで検索する
  # scope :prefecture_id_is, -> (prefecture_id) { where(prefecture_id: prefecture_id) if prefecture_id.present? }
end
