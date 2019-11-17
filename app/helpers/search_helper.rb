
module SearchHelper

  def sort_asc(column_to_be_sorted, search_params = nil)
    opts = { column: column_to_be_sorted, direction: "asc" }
    opts.merge!(search_params) if search_params.present?
    link_to "▲", opts, { id: column_to_be_sorted + "▲" }
  end

  def sort_desc(column_to_be_sorted, search_params = nil)
    opts = { column: column_to_be_sorted, direction: "desc" }
    opts.merge!(search_params) if search_params.present?
    link_to "▼", opts, { id: column_to_be_sorted }
  end

  def sort_direction
    %W(asc desc).include?(params[:direction]) ? params[:direction] : "desc"
  end
end
