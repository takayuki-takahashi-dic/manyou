class Task < ApplicationRecord
  validates :title, presence: true, length: { maximum: 50 }
  validates :content, length: { maximum: 255 }
  validate :not_before_today # deadline < Date.today

  enum status: { waiting: 0, working: 1, completed: 2 }
  enum priority: { low: 0, middle: 1, high: 2 }
  # enumにバリデーションは不要

  def not_before_today
      errors.add(:deadline, :not_before_today) if deadline.nil? || deadline < Date.today
  end

  scope :search, -> (search_params) do
    return if search_params.blank?
    title_like(search_params[:title])
      .status_is(search_params[:status])
      .priority_is(search_params[:priority])
  end
  scope :title_like, -> (title) { where(['title LIKE ? OR content  LIKE ?',
                                "%#{title}%", "%#{title}%"]) if title.present? }
  scope :status_is, -> (status) { where(status: status) if status.present? }
  scope :priority_is, -> (priority) { where(priority: priority) if priority.present? }
end
