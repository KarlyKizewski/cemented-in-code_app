class GhostsController < ApplicationController

  def index
    @ghosts = Ghost.all
  end

  def new
    @ghost = Ghost.new
  end

  def create
    @ghost = Ghost.create(ghost_params)
    if @ghost.valid?
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def ghost_params
    params.require(:ghost).permit(:person, :eulogy)
  end
end
