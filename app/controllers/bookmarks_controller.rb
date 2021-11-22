class BookmarksController < ApplicationController

  # Create a bookmark
  # GET /lists/:list_id/bookmarks/new
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  # POST /lists/:list_id/bookmarks
  def create
    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params[:list_id])
    @bookmark.list = @list

    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  # Destroy a bookmark
  # DELETE /bookmarks/:id
  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy

    redirect_to list_path(@bookmark.list)
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
