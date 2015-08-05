class CollaboratorsController < ApplicationController
  def index
    @wiki = current_user.wikis.find(params[:wiki_id])
    @users = User.all
  end

  def show
  end

  def new
  end

  def edit
  end
end
