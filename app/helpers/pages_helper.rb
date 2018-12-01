module PagesHelper

  def index_collapsible_links_partial_path
    if user_signed_in?
      'pages/index/userSigned_in_index'
    else
      'pages/index/userSigned_out_index'
    end
  end

end
