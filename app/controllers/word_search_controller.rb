class WordSearchController < ApplicationController
  def create
    @validator = WordValidator.new(params[:word_search])
    redirect_to root_path
  end
end