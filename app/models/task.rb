class Task < ApplicationRecord
  validates :title, presence: true, length: { maximum: 50 }
  validates :content, length: { maximum: 255 }
  enum status: { waiting: 0, working: 1, completed: 2 }
  enum priority: { low: 0, middle: 1, high: 2 }

  def self.search(params)
    title       = params[:title]
    # author_name = params[:author]
    # year_from   = params[:publication_year_from]
    # year_to     = params[:publication_year_to]
    @tasks   = Task.all
    # if author_name.present?
    #   author = Author.find_by(name: author_name)
    #   @articles = @articles.where(author_id: author.id) if author.present?
    # end
    @tasks = @tasks.where("title like ?", "%#{title}%") if title.present?
    @tasks
  end
end
