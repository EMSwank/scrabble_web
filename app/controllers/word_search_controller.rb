class WordSearchController < ApplicationController
  def create
    @validator = WordValidator.new(params[:word_search])
    @validator.find_word
    redirect_to root_path
  end
end