class GhostsController < ApplicationController

  def index
    @ghosts = Ghost.all
  end

  def new
    @ghost = Ghost.new
  end

  def create
    @ghost = Ghost.create(ghost_params)
    redirect_to root_path
  end

  private

  def ghost_params
    params.require(:ghost).permit(:person, :eulogy)
  end
end
