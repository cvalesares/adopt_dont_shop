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
    result = {name: params[:name],
              address: params[:address],
              pets: params[:pets],
              status: params[:status]}
  end
end
