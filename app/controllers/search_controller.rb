class SearchController < ApplicationController

  def index
    search = Photo.search { fulltext params[:term] }
    @photos = search.results
  end
end
