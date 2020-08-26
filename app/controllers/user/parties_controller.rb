class User::PartiesController < ApplicationController

  def new
    @movie_title = params[:movie_title]
    @party = Party.new
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
    movie_title = params[:party][:movie_title]
    params.require(:party).permit(:duration, 'when(3i)', 'when(2i)', 'when(1i)', :movie_title, :attendees)
  end
end
