class ClientsController < ApplicationController
  before_action :set_services, except: [:destroy]
  def index
    @clients = Client.where(user: current_user)
  end

  def new
    @client = Client.new
  end

  def show
    @client = Client.find(params[:id])
  end

  def create
    @client = Client.new(client_params)
    @client.user = current_user
    if @client.save
      #check mailer is working or not
      #NotificationMailer.notification_mailer( @client ).deliver
      redirect_to @client

    else
      render 'new'
    end
  end


  def edit
    @client = Client.find(params[:id])
  end

  def update
    @client = Client.find(params[:id])
    if @client.update(client_params)
      redirect_to @client
    else
      render 'edit'
    end
  end

  def destroy
    @client = Client.find(params[:id])
    if @client.destroy
      flash[:notice] = "Client is deleted"
    end

    redirect_to clients_path
  end

  private
  def client_params
    params.require( :client ).permit( :name, :address, :phone_number,:email , service_ids: [])
  end
  def set_services
    @services = Service.where(user: current_user)
  end

end
