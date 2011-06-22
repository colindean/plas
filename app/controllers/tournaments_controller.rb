class TournamentsController < ApplicationController

  def index
    @tournaments = Challonge::Tournament.find(:all)
  end
end
