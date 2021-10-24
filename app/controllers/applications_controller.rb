class ApplicationsController < ApplicationController

def index
  @applications = Application.all
end

def new
end

def show
  @application = Application.find(params[:id])
end

def create
  Application.create!(appliction_params)

  redirect_to "/applications/#{params[:id]}"
end

private

  def application_params
    if params[:status] == nil || params[:status] == ""
      params[:status] = 'In Progress'
    end
    params.permit(:name, :address, :description, :status)
  end
end
