class WikisController < ApplicationController
  def index
    @wikis = Wiki.visible_to(current_user)
  end
  #def index
  #  @wikis = policy_scope(Wiki)
  #end

  def show
    @wiki = Wiki.visible_to(current_user).find(params[:id])
  end

  def new
    @wiki = Wiki.new
    authorize @wiki
  end

  def create
    @wiki = current_user.wikis.build(params.require(:wiki).permit(:title, :body, :private))
    authorize @wiki
    if @wiki.save
      flash[:notice] = "Wiki was saved."
      redirect_to @wiki
    else
      flash[:error] = "There was an error saving the wiki. Please try again."
      render :new
    end
  end

  def edit
    @wiki = Wiki.find(params[:id])
  end

 def update
     @wiki = Wiki.find(params[:id])
     if @wiki.update_attributes(params.require(:wiki).permit(:title, :body))
       flash[:notice] = "Wiki was updated."
       redirect_to edit_wiki_path
     else
       flash[:error] = "There was an error saving the wiki. Please try again."
       render :edit
     end
   end

  def destroy
    @wiki = Wiki.find(params[:id])
    
    if @wiki.destroy
      flash[:notice] = "\"#{@wiki.title}\" was deleted sucessfully."
      redirect_to action: "index" 
    else
      flash[:error] = "There was an error deleting the wiki."
      render :show
    end
  end
end
