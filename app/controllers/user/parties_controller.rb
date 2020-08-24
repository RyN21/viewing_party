class User::PartiesController < ApplicationController

  def new
    @party = Party.new
  end

  def create
    user = current_user
    @party = user.parties.create(party_params)
    redirect_to '/user'
  end

  private

  def party_params
    params.require(:party).permit(:duration, 'when(3i)', 'when(2i)', 'when(1i)', :attendees)
  end
end
