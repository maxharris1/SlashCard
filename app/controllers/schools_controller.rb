
class SchoolsController < ApplicationController

  before_action :set_school, only: [:edit, :update, :show, :destroy]


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
  @school_vendors = @schools.vendors



  @vendors = Vendor.all
  end



  private
  def school_params
    params.require(:school).permit(:name, :address,:description,:amb_email,:amb_name,:amb_phone, :lat, :lng)
  end


end