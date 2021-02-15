class ServicesController < ApplicationController
  before_action :set_services
  def index
    @services = Service.where(user: current_user)
  end

  def new
    @service = Service.new
  end


  def create
    @service = Service.new(service_params)
    @service.user = current_user
    if @service.save
      redirect_to services_path
    else
      render 'new'
    end
  end


  def destroy
    @service = Service.find(params[:id])
    if @service.destroy
      flash[:notice] = "Service is deleted"
    end

    redirect_to services_path
  end

  private
  def service_params
    params.require( :service ).permit( :name, :price)
  end
  def set_services
  end

end
