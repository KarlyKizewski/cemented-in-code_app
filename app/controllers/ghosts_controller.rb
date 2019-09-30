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

  def show
    @ghost = Ghost.find_by_id(params[:id])
    if @ghost.blank?
      render plain: 'Not Found', status: :not_found
    end
  end

  private

  def ghost_params
    params.require(:ghost).permit(:person, :eulogy)
  end
end
