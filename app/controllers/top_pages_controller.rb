class TopPagesController < ApplicationController
  autocomplete :board, :title, :limit =>10 
  def index; end
end
