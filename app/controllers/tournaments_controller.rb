class TournamentsController < ApplicationController

  def index
    @tournaments = Challonge::Tournament.find(:all)
  end

  # for later
  # Challonge::API.username = Pcfg.get('challonge.api.username')
  # Challonge::API.key = Pcfg.get('challonge.api.key')

end

