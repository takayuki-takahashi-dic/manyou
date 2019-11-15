module SearchHelper

  def sort_asc(column_to_be_sorted, task_search_params = nil)
    opts = { :column => column_to_be_sorted, :direction => "asc" }
    opts.merge!(task_search_params) if task_search_params.present?
    link_to "▲", opts
  end

  def sort_desc(column_to_be_sorted, task_search_params = nil)
    opts = { :column => column_to_be_sorted, :direction => "desc" }
    opts.merge!(task_search_params) if task_search_params.present?
    link_to "▼", opts
  end

  def sort_direction
    %W[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
