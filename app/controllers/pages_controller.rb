class PagesController < ApplicationController

  def index
  end

  def schools
    @schools = School.all

  end

end
