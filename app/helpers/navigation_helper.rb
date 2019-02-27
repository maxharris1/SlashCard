module NavigationHelper

  def collapsible_links_partial_path
    if user_signed_in?
      'layouts/navigation/collapsible_elements/signed_in_links'
    elsif manager_signed_in?
      'layouts/navigation/collapsible_elements/manager_signed_in_links'
    else
      'layouts/navigation/collapsible_elements/non_signed_in_links'
    end
  end


  def man_navbar_links_path
    if user_signed_in?
      'layouts/navigation/manager_nav_elements/non_manager_nav'
    elsif manager_signed_in?
      'layouts/navigation/manager_nav_elements/manager_nav'
    else
      'layouts/navigation/manager_nav_elements/non_manager_nav'
    end

  end

end