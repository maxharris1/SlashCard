require 'navigation_helper.rb'
require 'pages_helper.rb'
require 'vendors_helper.rb'

module ApplicationHelper
  include PagesHelper
  include NavigationHelper
  include VendorsHelper
end
