class Task < ApplicationRecord
  validates :title, presence: true, length: { maximum: 50 }
  validates :content, length: { maximum: 255 }
  enum status: { waiting: 0, working: 1, completed: 2 }
  enum priority: { low: 0, middle: 1, high: 2 }

  # Search method(add search)
    def self.search(title)
      if title
        Task.where(['title LIKE ?', "%#{title}%"])
      else
        Task.all
      end
    end
end
