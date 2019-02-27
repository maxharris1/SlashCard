
class SchoolsController < ApplicationController

  before_action :set_school, only: [:edit, :update, :show, :destroy]
  respond_to :js, :json, :html


  def index
    @schools=School.all
  end

  def new
    @schools = School.new
  end

  def edit

  end

  def set_school
    @schools = School.find(params[:id])
  end

  def update
    if @schools.update(school_params)
      flash[:notice] = "School was updated"
      redirect_to schoolsindex_path
    else
      flash[:notice] = "School was not updated"
      render 'edit'
    end
  end

  def create
    @schools = School.new(school_params)
    @schools.save
    if @schools.save
      flash[:notice] = "School was successfully created"
      redirect_to schoolsindex_path
    else
      flash[:notice] = "ERROR: Could not create School"
      redirect_to schoolsindex_path
    end
  end

  def destroy
    @schools.destroy
    flash[:notice] = "School was deleted"
    redirect_to profile_path
  end

  def show
    @user = current_user
    @school_vendors = @schools.vendors
    load_map
    @lat = session[:lat]
    @lng = session[:lng]





  end

  def getLoc
    lat = params[:lat]
    lng = params[:lng]
    respond_to do |format|
      format.html
      format.json { render :json => { :lat => lat, :lng => lng
      } }
      session[:lat] = lat
      session[:lng] = lng
    end
  end


  def load_map
    @school_vendors = @schools.vendors
    @school_lat = @schools.latitude
    @school_lng = @schools.longitude



    @hash = Gmaps4rails.build_markers(@school_vendors) do |v, marker|
      marker.infowindow render_to_string(:partial => "/schools/vendorinfo", :locals => { :v => v})
      marker.lat v.latitude
      marker.lng v.longitude
      marker.title v.name
    end
  end



  private
  def school_params
    params.require(:school).permit(:name, :address, :description, :amb_email, :amb_name, :amb_phone, :latitude, :longitude)
  end

  def sortable_columns
    ["distance", ""]
  end


end