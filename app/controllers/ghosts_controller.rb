class GhostsController < ApplicationController

  def index
    @ghosts = Ghost.all
  end

  def new
    @ghost = Ghost.new
  end
end
