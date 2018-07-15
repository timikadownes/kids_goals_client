class Client::KidsController < ApplicationController
  def show
    kid_id = params[:id]
    response = Unirest.get(
      "http://localhost:3000/api/kids/#{kid_id}"
      )
    @kid = response.body
    render "show.html.erb"    
  end

  def new
    render 'new.html.erb'
  end

  def create
    client_params = {
      name: params[:name],
      age: params[:age],
      grade: params[:grade],
      teacher: params[:teacher],
      school: params[:school],
      image: params[:image_url]
    }  
    kid = Unirest.post("http://localhost:3000/api/kids", parameters: client_params).body
    flash[:success] = "New Child Created!"
    redirect_to "/client/kids/#{kid['id']}"
  end

  def edit
    kid = Unirest.get("http://localhost:3000/api/kids/#{params[:id]}")
    @kid = kid.body
    render 'edit.html.erb'
  end

  def update
    client_params = {
      name: params[:name],
      age: params[:age],
      grade: params[:grade],
      teacher: params[:teacher],
      school: params[:school],
      image: params[:image_url]
    }
    kid = Unirest.patch("http://localhost:3000/api/kids/#{params[:id]}", parameters: client_params).body
    redirect_to "/client/kids/#{kid['id']}"
  end

  def destroy
    kid_id = params[:id]
    kid = Unirest.delete("http://localhost:3000/api/kids/#{kid_id}").body
    flash[:danger] = "Child succesfully removed!"
    redirect_to "/client/kids"
  end
end
