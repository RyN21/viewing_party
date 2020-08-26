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
    require "pry"; binding.pry
    @party = user.parties.create(party_params)
    redirect_to '/user'
  end

  def destroy
    party_to_delete = Party.find(params[:party_id])
    party_to_delete.destroy
    redirect_to '/user/'
  end

  private

  def party_params
    movie_title = params[:party][:movie_title]
    params.require(:party).permit(:duration, :when, :time, :movie_title, :attendees)
  end
end
