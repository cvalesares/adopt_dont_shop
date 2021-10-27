class PetApplications < ApplicationController

  def show
    @pets = Pet.search(params[:search])
  end
  
end
