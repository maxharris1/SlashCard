require 'navigation_helper.rb'
require 'pages_helper.rb'
require 'vendors_helper.rb'
require 'users_helper.rb'
require 'schools_helper.rb'

module ApplicationHelper
  include PagesHelper
  include NavigationHelper
  include VendorsHelper
  include SchoolsHelper
  include UsersHelper
end
