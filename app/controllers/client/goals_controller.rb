class Client::GoalsController < ApplicationController

  def show
    goal_id = params[:id]
    response = Unirest.get("http://localhost:3000/api/goals/#{goal_id}"
      )
    @goal = response.body
    render "show.html.erb"
  end

  def new
    render 'new.html.erb'
  end

  def create
    client_params = {
      category: params[:category],
      kid_id: params[:kid_id],
      image: params[:image_url],
      date: params[:due_date],
      description: params[:description]
    }
    goal = Unirest.post("http://localhost:3000/api/goals", parameters: client_params).body
    flash[:success] = "New Goal Created!"
    redirect_to "/client/goals/#{goal['id']}"
  end

  def edit
    goal = Unirest.get("http://localhost:3000/api/goals/#{params[:id]}")
    @goal = goal.body
    render 'edit.html.erb'
  end

  def update
    client_params = {
      category: params[:category],
      kid_id: params[:kid_id],
      image: params[:image_url],
      date: params[:due_date],
      description: params[:description] 
    }
    goal = Unirest.patch("http://localhost:3000/api/goals/#{params[:id]}", parameters: client_params).body
    redirect_to "/client/goals/#{goal['id']}"
  end

  def destroy
    goal_id = params[:id]
    goal = Unirest.delete("http://localhost:3000/api/goals/#{goal_id}").body
    flash[:danger] = "Goal succesfully removed!"
    redirect_to "/client/goals"
  end
end
