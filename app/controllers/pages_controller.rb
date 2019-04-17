class PagesController < ApplicationController

  def index
  end


  def schools
    @schools = School.all

    @hash = Gmaps4rails.build_markers(@schools) do |v, marker|
      marker.infowindow render_to_string(:partial => "/pages/schoolinfo", :locals => { :v => v})
      marker.lat v.latitude
      marker.lng v.longitude
      marker.title v.name
    end
  end

  def locations

  end

end
