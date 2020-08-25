class User::PartiesController < ApplicationController

  def new
    @movie_show = Movie.new(@movie)
    @party = Party.new
    require "pry"; binding.pry
  end

  def show
    @party = Party.find(params[:party_id])
  end

  def create
    user = current_user
    #datetime object, add time to form
    @party = user.parties.create(party_params)
    # day = @party.when[4..5]
    # month = @party.when[11]
    # year = @party.when[17..20]
    # @party.when = "#{day}/#{month}/#{year}"
    redirect_to '/user'
  end

  def destroy
    party_to_delete = Party.find(params[:party_id])
      party_to_delete.destroy
      redirect_to "/user/"
  end

  private

  def party_params
    params.require(:party).permit(:duration, 'when(3i)', 'when(2i)', 'when(1i)', :attendees)
  end
end
