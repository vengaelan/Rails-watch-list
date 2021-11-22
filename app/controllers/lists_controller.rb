class ListsController < ApplicationController
  # Show all lists
  # GET /lists
  def index
    @lists = List.all
  end

  # Create a new list
  # GET /lists/new
  def new
    @list = List.new
  end

  # POST /lists
  def create
    @list = List.new(list_params)

    if @list.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  # Show one list
  # GET /lists/:id
  def show
    @list = List.find(params[:id])
    @bookmark = Bookmark.new # Why instantiate a bookmark?
  end

  # Destroy a list
  # DELETE /lists/:id
  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path
  end

  # Strong params
  def list_params
    params.require(:list).permit(:name)
  end
end
