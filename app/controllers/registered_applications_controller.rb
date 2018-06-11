class RegisteredApplicationsController < ApplicationController
  include ApplicationHelper
  before_action :authenticate_user!

  def index
    @registered_applications = RegisteredApplication.where("user_id = ?", current_user.id)
    @user = User.find(current_user.id)
  end

  def show
    @registered_application = RegisteredApplication.find(params[:id])
    @user = User.find(current_user.id)
  end

  def new
    @registered_application = RegisteredApplication.new
  end

  def create
    @registered_application = RegisteredApplication.new(registered_application_params)
    @registered_application.user = current_user
    @registered_application.assign_attributes(registered_application_params)

    if @registered_application.save
      flash[:notice] = "Your application was registered successfully."
      redirect_to @registered_application
    else
      flash.now[:alert] = "There was an error registering the application. Please try again."
      render :new
    end
  end

  def destroy
    @registered_application = RegisteredApplication.find(params[:id])

    if @registered_application.destroy
      flash[:notice] = "\"#{@registered_application.name}\" registration was removed successfully."
      redirect_to registered_applications_path
    else
      flash.now[:alert] = "There was an error deleting the registration."
      render :show
    end
  end

  def edit
    @registered_application = RegisteredApplication.find(params[:id])
  end

  def update
    @registered_application = RegisteredApplication.find(params[:id])
    @registered_application.assign_attributes(registered_application_params)

    if @registered_application.save
       flash[:notice] = "Registration was updated."
      redirect_to @registered_application
    else
      flash.now[:alert] = "There was an error registering the application. Please try again."
      render :edit
    end
  end

  private

  def registered_application_params
    params.require(:registered_application).permit(:name, :url)
  end
end
