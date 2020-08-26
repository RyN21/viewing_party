class User::PartiesController < ApplicationController
  before_action :require_current_user

  def new
    @movie_title = params[:movie_title]
    @party = Party.new
  end

  def show
    @party = Party.find(params[:party_id])
  end

  def create
    user = current_user
    party = user.parties.new(party_params)
    if party.save
      flash[:success] = "New viewing party created"
      redirect_to '/user'
    end 
  end

  def destroy
    party_to_delete = Party.find(params[:party_id])
    party_to_delete.destroy
    redirect_to '/user/'
  end

  private

  def party_params
    params.require(:party).permit(:duration, :when, :time, :movie_title, :attendees)
  end
end
